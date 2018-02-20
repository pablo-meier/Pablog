    Title: Using Erlang
    Date: 2015-07-05T23:12:12
    Tags: engineering, essay, pablolife

_The following is [cross-posted with the Ghostlight blog.](http://blog.ghostlight.io/erlang/)_

It's not common knowledge, but Ghostlight is written in [Erlang][6]. This is
slightly bananapants. Here are some thoughts and reactions to this choice, now
that I've done substantial work on it.

<!-- more -->

<h1 id="i-erlang">I ❤️ Erlang</h1>

<h3 id="pattern-matching">Pattern matching.</h3>

Srsly, this ruins you when you use other languages. Using raw `if` statements to
choose your branches, and/or extracting nested data into a variable feels just
_so_ cumbersome in other languages.

<h3 id="binaries">Binaries</h3>

I don't have much use for them in Ghostlight, but when I have needed them (once
for a [very old project][19]) it's far and away easiest way to work with binary
data. This is illustrated pretty well in [this solution to a Go challenge.][3]

<h3 id="small-simple-language">"Small, simple language"</h3>

This phrase apparently gets repeated a lot with some eyeroll, given how hard it
can be to get any of your code _running_ in Erlang before you understand OTP
Applications and Releases, but there's some truth to it — you have atoms, lists,
binaries, tuples, and the ocassional function. When something breaks it's often
obvious why (and consequently what the fix is), even in third-party code.

Dare I say: it's got the appeal of JavaScript's "simplicity" (where you can just
inspect transparent objects), but smarter — no forced universal floating-point
precision, no UTF-16 code points by default, no `null` _and_ `undefined`, no 4
meanings of `this`, an atom type, and tuples and lists as distinct data types.

Oh, and

<h3 id="being-the-only-kinda-sorta-i-guess-mainstream-language-that-gets-software-right">Being the only (kinda, sorta, I guess) mainstream language that gets software right</h3>

Most "Why Erlang?" posts cover this beautifully, so you can start by reading
[Evan Miller][2]. In particular, I love his points that many of the benefits of
Erlang are "back-loaded": they're non-obvious unless you've been building
software for a substantial amount of time, _and_ put up with Erlang's quirks for
a long enough time to observe them (most give up, understandably, before they
reach the top of the mountain to enjoy the view).

My absolute favorite thing about Erlang is its story around reliability: the
best way to describe it succinctly comes from the fabulous [Fred Hebert][21]'s
book, [Erlang in Anger][20]. It's a PDF, so I'll quote the relevant section:

> There’s something rather unique in Erlang in how it approaches failure
> compared to most other programming languages. There’s this common way of
> thinking where the language, programming environment, and methodology do
> everything possible to prevent errors. Something going wrong at run-time is
> something that needs to be prevented, and if it cannot be prevented, then it’s
> out of scope for whatever solution people have been thinking about.
> 
> The program is written once, and after that, it’s off to production, whatever
> may happen there. If there are errors, new versions will need to be shipped.
> 
> Erlang, on the other hand, takes the approach that failures will happen no
> matter what, whether they’re developer-, operator-, or hardware-related. It is
> rarely practical or even possible to get rid of all errors in a program or a
> system. If you can deal with some errors rather than preventing them at all
> cost, then most undefined behaviours of a program can go in that "deal with
> it" approach.
> 
> This is where the "Let it Crash" idea comes from: Because you can now deal
> with failure, and because the cost of weeding out all of the complex bugs from
> a system before it hits production is often prohibitive, programmers should
> only deal with the errors they know how to handle, and leave the rest for
> another process (a supervisor) or the virtual machine to deal with.
> 
> Given that most bugs are transient, simply restarting processes back to a
> state known to be stable when encountering an error can be a surprisingly good
> strategy.
> 
> Erlang is a programming environment where the approach taken is equivalent to
> the human body’s immune system, whereas most other languages only care about
> hygiene to make sure no germ enters the body. Both forms appear extremely
> important to me. Almost every environment offers varying degrees of hygiene.
> Nearly no other environment offers the immune system where errors at run time
> can be dealt with and seen as survivable.
> 
> Because the system doesn’t collapse the first time something bad touches it,
> Erlang/OTP also allows you to be a doctor. You can go in the system, pry it
> open right there in production, carefully observe everything inside as it
> runs, and even try to fix it interactively. To continue with the analogy,
> Erlang allows you to perform extensive tests to diagnose the problem and
> various degrees of surgery (even very invasive surgery), without the patients
> needing to sit down or interrupt their daily activities.
 
There is a _lot_ of twee romance about Lisp and how Lisp is Beautiful and Lisp
Will Ruin You So Don't Learn Lisp Because You'll Never Want To Program In
Anything Else. I learned a few Lisps, had a ball, felt many things, but that
wasn't one of them. I _do_ feel that way with Erlang.

Per pattern matching above — once you have a system that is _built_ around
[smart setting of boundaries][1] with [guarantees, not best efforts,][22] and a
realistic view of transient errors… well goddamn, you'll never feel comfortable
programming anywhere else.

<h1 id="where-erlang-has-bitten-me">Where Erlang has bitten me</h1>

<h3 id="for-a-web-app-too-many-data-formats">(For a web app,) Too many data formats</h3>

We deal with 4 primary resources in Ghostlight:

* [Productions](https://ghostlight.io/shows) (the code calls them "shows").
* [Organizations](https://ghostlight.io/organizations)
* [People](https://ghostlight.io/people)
* [Pieces](https://ghostlight.io/works) (the code calls them "works," as in
  "works of art")

Each of these is represented by an Erlang record, which, until [Maps][8] became
more-or-less ratified (and they're not even done in bleeding-edge
distributions!),were the standard name-value store.

**It is well-known that records suck.** Or are… basic, in any case. Because
they're just a compile-time hack to tuples, there are a few operations (i.e.
indexing by a variable) that are just impossible. When people complain about
"ugly syntax," records are the only part of that I agree with. _But! Whatever!_
I'm not here to complain about records. Only to say that, internally, I'm using
them.

But we don't send _records_ to the server; the accepted way to speak to a server
these days is to send and receive JSON, and so that's how we insert or update
either of the 4 resources. So each of the above _also_ has a JSON representation
that needs to be validated, parsed from, and converted to.

_Yet!_ We're not storing records _or_ JSON in our persistent database,
Postgres!<sup><a href="#persistence">1</a></sup> _That_ requires you to take a
record, then split it up into whatever representation you have in the various
tables and Postgres datatypes! _Then_ when you fetch it, you need to build up a
record again for the application layer to use.

**_But we're not done!_** Because to actually render variables into an HTML
template, we're using [ErlyDTL][12], which uses
[proplists][13]!<sup><a href="#proplists">2</a></sup>

This means every resource has/needs:

* Code to parse JSON and form a record.
* Code to split the record into SQL `INSERT` or `UPDATE` statements.
* Code to parse your `SELECT` queries columns into a record.
* Code to take your record and form a proplist for its HTML templates.

If you want to create JSON from your backend (and I wrote this for things like
[Elasticsearch][14], and making an API you can GET), you also need

* Code to form a JSON representation of your record.

While I have many engineering qualms against a lot of hot tech (Node is garbage,
ORMs are poison), it's cases like these where a Node + JSON object store look
mighty attractive, since so much code is spent just shuffling the format.

<h3 id="static-types">Static Types</h3>

We have [Dialyzer][15], but I can't help but feel if you're going for a Weird
Language, you should go big and get one with even a passable static type system.
Static type systems are like polio vaccines in that we have the solution to a
giant class of suffering and just choose not to put it in widespread use.

<h3 id="tooling">Tooling</h3>

[rebar3][16] is _fabulous_ compared to what came before, but it's still a very
far cry from a more modern package manager and/or builder, like `npm`, or even
things like `gradle` or the `go` command-line tool. This isn't due to their bad
work — the system they've devised is fabulous given the constraints of the
Erlang ecosystem — but the end result is still challenging for the user.

As mentioned before, bundling code in OTP Applications and releasing with
Releases has a high learning curve. Those are solutions to real problems, but
they can be daunting when you're just trying to get your shit up.

<h3 id="basackwards-abstraction-model">Bas-ackwards Abstraction Model</h3>

This is harder to say concretely, but — there are many things that are done
differently in Erlang than virtually everywhere else. While this already true by
virtue of being an immutable, functional programming language, there's plenty of
weird stuff _on top of that, even if you're used to other FP_ that bends your
brain a bit. Things like:

* Global namespaces: it's irresponsible to not prefix the application name to
  your module (leading to pretty long module names) because it's all in one
  namespace.

* Building generalized components _without_ direct parametrization: SML gives
  you [functors][17]. Haskell lets functions operate on typeclasses that you
  pass by parameter.

  Erlang _did_ have [parametrized modules][18], but apparently its 11 oldest
  users hated them, and promptly removed them, despite some notable Erlang apps
  using them. The _proper_ way to have lots of modules share structure with
  another is, like `gen_server`, to call a toplevel module, and have _it_ call
  your exported callbacks.

  It's not impossible, but the syntax/structure of modules make it sound (and
  feel) a lot weirder than it is.

---

I could be misremembering because I can't find the original link (she's changed
her site), but I credit author [Karen Traviss][23] with an old "advice for young
writers" checklist she had for on her site. It had some lovely, memorable lines
like (paraphrasing) "writing really is like having homework for the rest of your
life," and "the competition isn't _really_ as fierce as you think it is: for
every 100 wannabe novelists, only 10 will finish their novel, 5 will submit, and
2 of them will be disqualified for using 9pt Comic Sans on pink paper."

One that stuck with me while working side projects was "for every novel, you'll
heavily consider trashing it at the 25% and 75% points. Fight through it."
Ghostlight is there — I have a cute, if ugly, demo; but I hear little birdies in
my head telling me I should scrap it and do it with [Phoenix][24] (Elixir is
Erlang's future!), or just write an Express Node server like I've done twice
professionally (Speed matters more than engineering — Node sucks terribly but I
work fast in it, I'll tell you that).

I've **killed** those little birdies for saying that. Too many promising things
chase Perfection and never hit that better thing, Completion. So I'll keep
pushing on. But there's still so much work to do…

<p id="persistence"><small><strong>1:</strong> If minimizing data
representations was really my priority, I could have implemented a simple prototype in <a href="http://www.erlang.org/doc/man/mnesia.html">Mnesia</a> (allows Erlang terms) or a JSON store, like <a href="http://www.postgresql.org/docs/9.4/static/datatype-json.html">Postgres JSON columns</a> or, God forbid, <a href="https://www.youtube.com/watch?v=b2F-DItXtZs">Mongo</a>. If this was a VC-backed boondoggle and needed to <em>ship yesterday</em> and find product-market fit, I probably would have done one of these.</small></p>

<p id="proplists"><small><strong>2:</strong> Use of the <code>record_info</code> option lets you ostensibly pass in records instead, but that's harder to configure in a program that's already tedious to configure, and you'll end up defining a bunch of nested, intermediary records anyways since your template will usually contain more than just the basics of a resource or list of them.</small></p>

   [1]: https://www.destroyallsoftware.com/talks/boundaries
   [2]: http://www.evanmiller.org/why-i-program-in-erlang.html
   [3]: https://medium.com/@jlouis666/solving-the-go-challenge-1-in-erlang-8b1e0a0a5044
   [4]: http://steved-imaginaryreal.blogspot.com/2015/06/the-flub-paradox.html
   [6]: http://www.erlang.org/
   [8]: http://learnyousomeerlang.com/maps
   [12]: https://github.com/erlydtl/erlydtl
   [13]: http://www.erlang.org/doc/man/proplists.html
   [14]: https://www.elastic.co/products/elasticsearch
   [15]: http://www.erlang.org/doc/man/dialyzer.html
   [16]: http://www.rebar3.org/
   [17]: http://www.cs.cornell.edu/courses/cs312/2006fa/recitations/rec08.html
   [18]: https://erlangcentral.org/wiki/index.php?title=Parameterized_Modules
   [19]: https://github.com/pablo-meier/ScrabbleCheat/blob/master/code/server/src/bin_trie.erl
   [20]: http://www.erlang-in-anger.com/
   [21]: http://ferd.ca
   [22]: http://ferd.ca/it-s-about-the-guarantees.html
   [23]: http://karentraviss.com/
   [24]: http://www.phoenixframework.org/


