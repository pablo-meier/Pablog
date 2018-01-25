    Title: Services, monoliths, modularity
    Date: 2018-01-23T20:47:52
    Tags: engineering

_🎵 The song for this post is [Men in Black][16], by Will Smith 🎵_

I haven't written about code in a long time, so here are some reckons about
(micro)services, monoliths, and modularity.

### Who am I

After leaving Adobe and Google in SF, my experience in NYC has been with
progressively larger startups: [Sup][17] (seed, 3 employees), [Reonomy][18] (B
Round, ~50 employees at max), [ClassPass][19] (C round, ~220 employees), and now
[Lyft][20] (…G? H round? ~2k employees).

All but Sup have involved growing the number of services in the backend, rather
than growing the monolith.

### Monoliths and their majesty

Every company starts from a monolith. If you're lucky, you'll get a company that
won't deviate from this. DHH and the friends at Basecamp advocate this in
["The Majestic Monolith"][1].

That said, "just stay monolith" wasn't a possibility at the companies I worked for:
while Basecamp brands excellently writing [multiple][2] [books][3] about growing
companies responsibly and eschewing outside funding, the companies that
have the most funding and press are largely that way because of VCs and the
directive to grow before you have a market. Or, for that matter, a whole lot of
engineering culture.

(Did you know I joined Lyft [around the time they raised $1.5b][4], 59 days ago,
and I'm already more senior than 11.2% of the employees? 🤔)

So if you work for a company that scales or has scaled like that at any point in
their history, there comes a point when someone says the following:

### "It will never get easier to split into services"

Eventually, there come grumblings for separate services (guilty). I usually see
this happen:

- When new leadership inherits old leadership's monolith. Remember that when
  most senior engineers describe "terrible" or "unmaintainable" code, they
  almost always mean "code I didn't write." Splitting into services gets you the
  opportunity to greenfield.

- When the company gets big enough that the CTO/VP is now managing managers instead
  of line engineers. Two things happen here: they want clear boundaries between
  the teams their managers run, and they also want to stem the tide of issues
  arising from dozens of engineers sharing a single codebase. They might,
  theoretically, have been able to build a workable CI/test/deploy
  system, PR processes, and other engineering practices to enable their numerous
  developers to work effectively on a single codebase (consider open source
  projects with many contributors). But they grew quickly, the issues are
  happening _now_, and per VC dictum, they must ship new shit all the time while
  growing like Tetsuo at the end of _AKIRA_ (warning: [extremely graphic][29]).

Microservices are also fashionable: there's cachet in saying "we've
grown so much we're moving to microservices" if you're tech leadership at a
cocktail party with startup types. I'm surprised nobody espousing its virtues in
these companies brings up [Steve Yegge's big rant about SOA from 2011,][5]
because there's pretty good stuff there too.

#### Natural forces: Conway's Law, Engineering employment, Engineering Management

A few other forces at play:

**[Conway's Law][6] is a real thing:** if you have _n_ teams, left to
their own devices, you'll have _n_ fenced-off modules of code. Time for my
Thomas Friedman mixing metaphors impression: "Service-oriented allows you to
swim downstream of Conway's Law rather than against the grain."

**Fickle engineer tenure.** Engineers at these companies are extremely
high-turnover.  My resume has almost as many companies as years, _and this has
been great for me and my career._ This is a big topic (here I'll
just say [software engs are undervalued][30], strange as it may seem, and
capital in tech is still flowing too freely), but
overall, the industry is such that it's often better for talented folk to always
seek better offers. 

**Engineering management** has a lot of the same turnover issues as 👆🏼, with
the added caveat that a lot of leadership has literally never done this before,
because leadership opportunities often go to founders and early employees who
survive the initial purges. Did your company go from 20 to 50 engineers? Your
CTO has probably never managed this many people before. Even if they did, it was
_different_ people with _different_ leadership in a _different_ market at a
_different_ point in tech's history.

Corollary: many people are in their position _not_ because they're great at what
their position requires, but because they're great at what you needed to arrive
there or be selected for it (examples: CEO not because you're good at running
companies, but because you have access to capital and can persuade investors.
Many engineers are amazing at interviewing but terrible on the job.  I've
[written before about this][7]).

So most employees are a) new to code they are now responsible for, b) working
mostly with other people new to the organization, since growth, c) learning from
a diminishing pool of previous developers, since they're chasing new gigs, with
d) pretty fresh leadership, who e) is usually taking one of their earliest
swings at managing and/or leadership, _or_ did so under radically different
circumstances.

So is it a surprise that teams pick the fashionable solution that allows them to
feel productive (greenfield) without confronting the code they didn't write?

### A solution: microservices!

In light of all this, let's talk about what microservices are supposed to offer
you, on a technical level:

* Technical independence from one another: if one team wants to use Java and the
  other wants to use OCaml, well, as long as they talk via RPC or HTTP, right?

* Scalability per-component: if 10,000,000 customers are loving your Wickets
  offering but only 500,000 care about your Denture offering, you can scale the
  `Wickets` service to its massive needs and keep `Dentures` service to its
  lower needs.

* Isolation of components: if your `Wickets` service fails, it won't take down
  the whole product, people can still use `Dentures`.

* Abstract implementation details: if `Wickets` uses a bunch of materialized
  views or intermediate tables in their database, `Dentures` literally can't
  rely on them because they see separate databases.

These aren't nothing! I'm of the opinion that most companies adopt them for the
non-technical reasons in the previous sections: greenfield is fun, management is
immediately less painful while you grow unnaturally fast. But these should be
remembered, especially since they become especially true at the scale of
hundreds of engineers.

### What sucks about microservices

Here come my reckons. I think **microservices are usually a bad fit for the
companies that adopt them.** That said, I have trouble offering _practical_
solutions to companies playing the VC playbook, since I frame microservices as
the natural consequence of how how these companies form, who works at them, who
leads them, and what their strategies are.

Here's what sucks about microservices: you took what was one of the most
dependable abstractions in all of software (the humble function call) and added
a networking layer to it. Now you don't just _write code_ (expensive to
maintain; really, avoid code when you can) but you need to add:

- Monitoring
- Alerting
- Error handling
- Deploy/CI
- Latency requirements

You took a whole category of `a -> b` calls and made them `a -> IO Maybe b`
calls.

You previously had to deploy one codebase, you now need deploy pipelines for
several, interlocking codebases. Now when you want to write an integration test,
you need an eng-wide discussion on how to do this. Usually this has developers
waiting several minutes for tests to run after downloading gigabytes of
containers.

These aren't small costs. Engineers who work with code have a price of _x_, and
engineers who comfortably write code and manage all the above cost _px_ for some
_p_ > 2, and they'll work a whole lot slower. And they'll be getting paged.

Lets say I have to debug another team's code. In a monolithic system? "Jump
to definition" in the IDE, add a breakpoint or a printline. Microservices? `git
clone <service_url>`, read the README (if there is one), and/or investigate an
entire _codebase_, past a bunch of HTTP API cruft.

Two lovely articles that elaborate on these and other points are [here][8] and
[here][9].  Needless to say, [distributed systems are hard][10], and you should
avoid them if you possibly can.

### Is there ever a time to switch to SOA?

Of course! I couldn't imagine Lyft without the services architecture we have:
with this many engineers, our processes would surely flood. Then again, [we
wrote an industry-leading service proxy software][27] which took off so well
that [one of its authors wrote about why he won't form a company around it][28].

_Massive_ companies do well with services when they can invest the appropriate
amount for tooling, architecture, and support. That's probably not your startup.
The correct time to switch to microservices is [at precisely the moment you have
a "heap" of engineers.][31]

### Wow Pablo, _another_ Erlang plug… 🙄

All 3 of you who can tolerate talking to me about programming will hear me plug
Erlang all the time, and I have [waxed about it here][11]. But! It really was
_built_ for this. To take from [the chapter on Distributed Computing][12] in
[Learn You Some Erlang][13]:

> [...] distributed programming is like being left alone in the dark, with
> monsters everywhere. It's scary, you don't know what to do or what's coming at
> you. Bad news: distributed Erlang is still leaving you alone in the dark to
> fight the scary monsters. It won't do any of that kind of hard work for you.
> Good news: instead of being alone with nothing but pocket change and a poor
> sense of aim to kill the monsters, Erlang gives you a flashlight, a machete,
> and a pretty kick-ass mustache to feel more confident [...]

Erlang programs use "components as self-contained, share-nothing, monitored,
restartable servers with and API to callers" as _the default_ way to
program virtually everything. It's such the default that someone made [a
"microservices module"][14] that's jokingly just [our beloved `gen_server`][15],
arguably the most-used module in Erlang.

I'm obviously not advocating "JUST REWRITE IT ALL IN ERLANG!!" (though please go
and be That Person at your company 🍿), I'm just taking this opportunity to plug
the language/runtime I think software engineers will learn the most from when
wanting to structure applications in this environment.

### How do you cut a monolith? Not with message brokers

Last thing I'll point out: message brokers are very popular in SOA/microservice
environments. One of my _all-time favorite blog posts_ is [this one][22] on
issues arising from their very common use cases in distributed environments.

### Last words, further reading

My not-useful takeaway from these reckons is that _what you need is modularity,
not microservices._ If you replaced "each team publishes a library with a stable
API to something like [Artifactory][23]" instead of "each team runs and monitors
_n_ services," you get many of the same team structure benefits of microservices
with a lot less of the technical hassle or infrastructure staffing needs. It
looks similar to what's written about [here: "The Modular Monolith"][24].

I listed an _all-time favorite blog post_, here is _one of my all-time favorite
talks:_ [Boundaries][25], by Gary Bernhardt. There's a _lot_ here about
structuring and designing systems so integration tests between components are a
lot less painful, and your system overall is much easier to reason about.

Finally, there's [Testing Microservices, the sane way][26], a great
(comprehensive!) article that has a pretty healthy perspective on the challenges
of operating in a world of services.

Good luck to you, it's hard out there. 💪🏼

   [1]: https://m.signalvnoise.com/the-majestic-monolith-29166d022228
   [2]: https://basecamp.com/books/rework
   [3]: https://basecamp.com/books/getting-real
   [4]: https://www.theverge.com/2017/10/19/16503742/lyft-capitalg-google-fundraising-venture-billion
   [5]: https://gist.github.com/chitchcock/1281611
   [6]: https://en.wikipedia.org/wiki/Conway%27s_law
   [7]: /2017/12/company-culture.html#selecting-for-the-job-vs-performing-the-tasks-of-the-job
   [8]: http://blog.christianposta.com/microservices/the-hardest-part-of-microservices-calling-your-services/
   [9]: https://blog.rapid7.com/2016/09/15/microservices-please-dont/
   [10]: https://www.somethingsimilar.com/2013/01/14/notes-on-distributed-systems-for-young-bloods/
   [11]: /2015/07/using-erlang.html
   [12]: http://learnyousomeerlang.com/distribunomicon
   [13]: http://learnyousomeerlang.com
   [14]: https://github.com/videlalvaro/gen_microservice
   [15]: http://learnyousomeerlang.com/clients-and-servers#callback-to-the-future
   [16]: https://www.youtube.com/watch?v=fiBLgEx6svA
   [17]: https://techcrunch.com/2014/08/07/sup-app
   [18]: https://www.reonomy.com/
   [19]: https://classpass.com/
   [20]: https://www.lyft.com/
   [22]: https://programmingisterrible.com/post/162346490883/how-do-you-cut-a-monolith-in-half
   [23]: https://jfrog.com/artifactory/
   [24]: https://medium.com/@dan_manges/the-modular-monolith-rails-architecture-fb1023826fc4
   [25]: https://www.destroyallsoftware.com/talks/boundaries
   [26]: https://medium.com/@copyconstruct/testing-microservices-the-sane-way-9bb31d158c16
   [27]: https://www.envoyproxy.io/
   [28]: https://medium.com/@mattklein123/optimizing-impact-why-i-will-not-start-an-envoy-platform-company-8904286658cb
   [29]: https://www.youtube.com/watch?v=SBm87cTvihY
   [30]: https://twitter.com/patio11/status/954035737061568512
   [31]: https://en.wikipedia.org/wiki/Sorites_paradox
