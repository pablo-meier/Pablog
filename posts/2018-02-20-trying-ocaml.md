    Title: Trying OCaml 🐫
    Date: 2018-02-20T11:01:12
    Tags: culture, engineering

<small><em>The song for this post is [][], by</em></small>

My most popular original tweet is from 2013:

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Haskell
holds me, a hysterical mess, crying and wailing over SML&#39;s body. &quot;It
should&#39;ve been you!!&quot; I yell, knowing it won&#39;t change
anything.</p>&mdash; 💣 b∀BГO 💣 (@SrPablo) <a
href="https://twitter.com/SrPablo/status/342341342694883329?ref_src=twsrc%5Etfw">June 5, 2013</a></blockquote>

I really love playing with and thinking about programming languages.<sup id="place1"><a href="#footnote1">1</a></sup>
I often get asked which my favorite is, and while I struggle to
answer, I often say that if I designed one, it'd look most like Standard ML.<sup id="place2"><a href="#footnote2">2</a></sup>
Even by Pablo standards, it's a dead language.

It was always a dodge that I avoided [OCaml][26] this long. That said, I'm
happy to announce that **this blog is now built on OCaml, after years of being
built on Racket.** [I wrote a static site generator][] that still has plenty of
holes, and while I don't recommend anyone else use it in its current state, I
feel comfortable enough to build my site with it going forward.

### What's great

#### Closing the gap: correctness

All of engineering is an exercise in tradeoffs, and while you can have
preferences, it's dangerous to let yourself believe they are Objectively Better.
I'll state that **my preference is to maximize correctness when possible, and
static types with strong correctness guarantees are a great way to achieve this.**
While I love how fast I am when working in something like Python, Ruby, or
JavaScript, my least favorite tasks in programming are a) writing tests with a
ton of mocks, and b) debugging bad state.

If you're familiar with OCaml, you'll know that these are tasks the languages
greatly reduces. Your programs are a little harder to write, but much easier to
maintain. You'll note my codebase, at this point in time, has no tests. This isn't
ideal!  Testing is great! But I'd never even conceive of writing other software
this way in another language, because I wouldn't have confidence that the system
I build would have its invariants preserved.

#### Closing the gap: performance

If you spend enough time in dynamic, interpreted languages, you forget how fast
computers really are. I didn't think I'd get to "launch" this project until I
implemented a cache, much like [Frog][10] has, that determines what files have
changed and only rebuilds the parts of the site as necessary. A clean build in
Frog takes me about 16 seconds, and one from cache takes about 3.

When I first ran a complete build, my OCaml project built the entire site in
about .2 seconds. This is not a burn on Racket or Frog! They are _amazing_
products by amazing people that I wholeheartedly admire! But there is a real joy
in seeing optimized, compiled code work as quickly as it does.

I'm committed to continuing to try as much as I can in OCaml this year.

### What's not great

#### Impacts of smaller community

This is undeniable: working in Python/Ruby/JavaScript/Java means almost every
problem you can imagine has been solved by multiple other people. Your package
managers just work. There are a million StackExchange answers on every
permutation of tool connections.

When using an OCaml library, my process was

* Can I install this with [OPAM][11]? If not, I didn't include it: I really would
  prefer to stick to reproducible builds.

* How do I use this? I'd download it, look at its signatures in [utop][12], and
  usually look at the source code itself (like [this file in the Markdown
  parser][13], or [this one in the ISO8601 date formatter][14]). This is _kind
  of_ the System Working As Designed, but it's a bit more exploratory than
  working in many other ecosystems.

#### Getting a working setup

There are several different ways to install OCaml's tools, and when you do
install them you find that there are dozens, each individually handling a different
part of the build chain. I misunderstood an instruction on the [merlin
install][17], so I was coding blind for a longer time than I would have liked.

In fairness, this is broken _everywhere_ (though [Haskell Platform][15] and
[Racket's single download][16] are quite pleasant). Telling folks to download
[nvm][20] or [rvm][19] or [virtualenv][18] and how to `pip install` or `bundler install`
or `npm install` for these tools has a learning curve too. But they more-or-less
follow the same conventions, and per above, have a lot more resources online to
debug where they don't work.

#### OCaml/Reason split

OCaml is getting some new attention since [Facebook released Reason, a
comrade of OCaml][21], where you effectively write OCaml and it compiles down
happily to JavaScript. It [plays well with React][22].

While I think Reason and all the subsequent new attention is a good thing, it
causes some angst over which to use, and exacerbates a lot of the above since
it's yet another fragment in that ecosystem.

### Resources

If you want to give it a try, I'd take a look at [Real World OCaml][23],
available online and very comprehensive.

When you need to look up a library, consider using the [Jane Street OCaml
Core][24] library, or [Batteries][25]. I used Core since that's what _Real World
OCaml_ was using. You'll be Googling those docs a ton.

If you can, try to get Merlin set up, and work with a `utop` instance nearby.
They'll really shorten your dev cycle.

---

<span id="footnote1">1.</span> <a href="#place1"><strong>^</strong></a>
[Previously][1], [previously][2], [previously][3], [previously][4], [previously][5],
[previously][6], [previously][7], [previously][8], [previously][9].

<span id="footnote2">2.</span> <a href="#place2"><strong>^</strong></a>
Dream language would have SML modules and types, Erlang-like VM and OTP, Lisp
syntax. Such a combination is probably impossible and I'm probably missing a few
other features, but those are a few of my favorite things.


   [1]: /2016/12/advent-of-code.html
   [2]: https://github.com/pablo-meier/Invisible-Thief
   [3]: /2015/07/using-erlang.html
   [4]: /2015/05/i-like-java-fine.html
   [5]: /2010/11/road-to-lisp-survey.html
   [6]: /2010/09/some-professor-layton-prolog.html
   [7]: /2010/07/languages-to-describe-languages.html
   [8]: /2010/06/feet-high.html
   [9]: /2010/06/keep-up-that-racket.html
   [10]: https://github.com/greghendershott/frog
   [11]: https://opam.ocaml.org/
   [12]: https://opam.ocaml.org/blog/about-utop/
   [13]: https://github.com/ocaml/omd/blob/master/src/omd.mli
   [14]: https://github.com/sagotch/ISO8601.ml/blob/master/src/ISO8601.mli
   [15]: https://www.haskell.org/platform/
   [16]: https://download.racket-lang.org/
   [17]: https://github.com/ocaml/merlin
   [18]: https://virtualenv.pypa.io/en/stable/
   [19]: https://rvm.io/
   [20]: https://github.com/creationix/nvm
   [21]: https://reasonml.github.io/
   [22]: https://github.com/reasonml/reason-react
   [23]: https://realworldocaml.org/v1/en/html/index.html
   [24]: https://github.com/janestreet/core
   [25]: http://batteries.forge.ocamlcore.org/
   [26]: https://ocaml.org/
