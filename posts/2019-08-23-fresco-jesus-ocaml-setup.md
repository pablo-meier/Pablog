    Title: 🐸 Fleaswallow 2, and an OCaml setup 🐫
    Date: 2019-08-23T02:21:46
    Tags: engineering, culture, projects, plt
    og_image: https://morepablo.com/img/2018/2/fleaswallow.png
    og_description: I decided to step up my OCaml game, here are lessons I learned; this post is a monstrosity.

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=fKHKaBM54IU">Swing Me Another 6</a>, by chipzel for the game Dicey Dungeons.</em> 🎵</small>

Everyone knows I stan for Erlang, but for most people I'd sooner suggest
Elixir _because the tooling and conventions are that much nicer._ While I
personally prefer Erlang the language, there's a lot more to development than
"formulating solutions in source code" and those other things (managing and using
dependencies, running tests, running a REPL, hell, even _typing that source
code_), are a fair bit easier in the newer toolchain.

While [rebar3][1] cleans a lot of this up (it's really the best thing to happen
to Erlang in years), the fact is, lower barrier to entry and great tools count
for a lot. It's not enough to have fabulous semantics.

I mentioned [trying OCaml last year][53] and successfully finishing a project in
it. It's still a language I want to use more! I recently picked it up again to
polish off the old blog software, but this time, I'd do things _right_.

Getting velocity in OCaml? Oh boy.

## A sample OCaml project that has top-level commands configured.

This post goes over how I finally got what I _hope_ is a reproducible build and
development setup for [Fleaswallow][14] that covers most of the bases you want
when writing code. You can look at Fleaswallow and see what's going on
there, if you try to download/install the code and run into bugs, please
let me know what went wrong so I can improve my understanding and update this
guide.

The goal is to make starting or hacking on an OCaml project as "obvious" as
`npm i` or `pipenv shell` and or `mix test` or what-have-you.  Hopefully by the
end of this you can test hypothesis in a REPL, write a test, or install a
package without thinking too hard about how to do it.

Full disclosure—I've _just_ started doing anything in OCaml, and most of this is
from hitting my head repeatedly on docs and experimentation. There may be
simpler ways to do all of this.

**Before we start,** you'll need 2 main tools to get going:

* **[OPAM][2]** acts as a package management tool and environment
  manager.

* **[Dune][3]** is a [Jane Street Open Source project][4] that tries to be an
  end-all build tool for OCaml projects. While I find it extremely technically
  impressive, its ultimate design is very ["programmers and knobs"][6], likely
  because it's trying to unify so many different views of OCaml projects (the
  [evergreen comic about this][5]). I think it's the worst, except for
  everything else.

Finally, you'll want to install OCaml itself. Luckily, this can be done with
`opam`! Most of you are on overpriced Macs like me, so you can run

```
brew install opam
opam init
eval `opam env`
opam install dune
```

And you should have enough to get going. Lets hit the workflows!

### Runtime management ("virtualenv", "asdf", "rbenv") — opam "switches"

**What problem it solves:** While "code in [My Language]" _should_ mean that you
just need "[My language] interpreter or compiler" to run it, in practice, we've
complicated this a fair bit:

* What happens if your code was written for a previous version of the language
  than your installation, or is currently fashionable? I wrote [this terrible
  Ruby][15] in 2011, but [I had to update it a few years later][16] when I tried
  running it again because the `require` statements were changed in newer Rubys.

* What happens if you have two packages depending on a common third package, but
  they depend on different versions of it? So `A` depends on `C` at 1.0, but `B`
  depends on `C` at 2.0? Which `C` do you install? What about if another
  project on your computer uses `C` at 2.1?

To solve the first point, is was fashionable to give each language its own
"runtime manager," much like each has their own package manager. Languages
sometimes even had competing runtime managers, so you could choose between
[rvm][8] _or_ [rbenv][7], or manage your Erlang with [kerl][9], or your node
with [nvm][10] &amp;c; &amp;c;

These days, many people have moved over to [asdf][11] which presents a single
way to manage multiple language runtimes. I've been moving over to this for
Elixir installs and rather like it.

For the second point, we've either designed our language's packaging systems
around this by having each project _and library_ contain their own dependencies
(so `A` would install `C` at 1.0 _and_ `B` would install `C` at 2.0, and your
external project would install `C` at 2.1); this is more-or-less how Node's
`node_modules` works.

But some languages were built with slightly different assumptions of how the
runtime would view its host machine and its "installed libraries" (e.g. Python),
so we created "virtual environments," which mean your shell session is
limited in it sees, and a bit of care is required to keep installed libraries
close to the project that uses them, rather than make them available globally.

**In OCaml…**

opam has [switches][12], which more-or-less cover both of these bases. Your
current "switch" can point to a specific instance of an OCaml installation,
_and_ it contains which packages your project can "see" installed. So
if you've `opam install`-ed [`ocaml-inifiles`][13] in one switch but not the
other, you can build a project with `ocaml-inifiles` as a dependency while the
first switch is "checked out," but it won't find it elsewhere.

You can see your switches right now! Run `opam switch list` to get a looksee!
It's probably at `default`, which is fine. This means any opam packages are
globally available at whatever version you installed them at.

**For your OCaml projects,** you probably want to `opam switch create .` in the
root project directory. This will create a new switch for that project. When you
`cd` into that directory, you'll automatically be using the switch (try listing
switches in and out of the directory to see for yourself), and this will keep
installs in that project local.

If you do this in the Fleaswallow project directory, it'll create a new switch
there that installs the dependencies found in the opam file, which I'll bring up
next.

### Dependencies

**What problem it solves.** You want to use someone else's code!

I frequently shit on dynamic, "hottest startup" tech stacks like Python and
Node, but in fairness, they _really_ changed the game on this. I am
"`./configure && make && sudo make install` + and fiddling with `LD_FLAGS` to
use Boost for smart pointers" years old.

They moved things forward with a few conventions that I miss when I don't have:

- a file at your toplevel naming your dependencies, and tooling to download
  them. This can be `package.json` or `Pipfile` or `requirements.txt` or
  `Gemfile` or `rebar.config`.

- Usually in that file, a way to specify which version to use.

- Some way to convert loose version specifications (e.g. `> 2.1.0`) into a
  reproducible version of your last build, so you're not caught off-guard by
  an upgrade (a lock file).

This supports a few workflows I tried recreating in OCaml:

- It should be straightforward to add a dependency to a project. In Elixir, you
  add a line to your `mix.exs` and run `mix deps.get`. `npm install` will,
  uncharacteristically, do the exact right thing and by default add it
  to your project's `package.json`, unless you use the `-g` flag.

- If applicable, it should be straightforward and well-documented to allow
  "variants." This would include: dependencies for only certain environments
  (dev dependencies), dependencies for only some phases (compile-time only, for,
  say, macros and syntax transformations), dependencies for only some
  architectures (those with native C bindings that are already compiled for
  Linux, for example).

**In OCaml**

The tool for this is opam again, but, _it's a little weird._

While most of those other tools have a single convention for which single file
can run its config (`package.json` or `mix.exs`), opam looks for any number
of toplevel files in your project root that might chnage what `opam install`
might do. Dune, the build tool we'll play with later, prefers
`<project_name>.opam`, but many projects will just have `opam`. The full list is
[here.][17] Whichever file you end up using, you can list your dependencies as a
variable in [`depends`, a variable used in package description.][18]

As for version number, you describe them with [version ordering][19] following
the ["Debian definition"][20].

With this, you can install dependencies into your switch with
`opam install --deps-only`. As for ensuring that your dependencies are the
correct version… this is a little more challenging.

The "simplest" way to do this is to not use loose version comparisons in your
deps, so `"utop" {= "2.4.0"}` instead of `"utop" {>= "2.4.0"}`. Blunt, but it
works. That said, when I run `opam install --deps-only` again, it doesn't always
re-download? There's a step I'm missing here.

The reason I hedge is because opam also has this notion of _pinning_, which, as
far as I can tell, started as a way to say "stop updating this package beyond
the version its aleady at," but is now, more generally, "alter how I fetch this
package from the default."

The first functionality, "stop altering this package," is _local to your
switch._ So if you enjoy your library `utop` at 2.4.0 and want to lock it there
in some kind of lock file, _opam doesn't work like that._ You can pin it, but
the pin is only applied to your switch, and isn't preserved externally in any
other artifact. Someone else cloning your project will run opam install, and
they'll upgrade to whatever the latest version that matches your spec is.

This is useful if you want to stabilize _your_ development, or even if you have
something like a build server that follows a "pets, not cattle" model. But the
lockfile case isn't entirely covered.

(and maybe it's not a great loss? you can already specify exact versions)

The second functionality of pinning goes beyond the scope of what I'm covering,
but you can also use pin commands to change which repos opam searches for a
package. So if you're developing software `A` that depends on `B`, and `B` needs
a change for `A` to work properly, you can clone `B`, make the change, then use
pinning to tell `A`'s opam to read `B` from your filesystem (with the changes)
instead of the global package registry. Go there if you're brave!

**For your OCaml projects** I suggest opam installing without a version
specifier to get the latest versions of everything you like, then affix the
version with a strict equals at publish time. Every once in a while, `git
checkout -b` a new branch to upgrade your packages.

**🔥 the hottest take I'll defend, over and over again, even though I don't
practice it because I am a slave to convention 🔥:** we strayed from the
Correct Path when we stopped checking in our dependencies. All this tooling
could have been avoided with a `deps/` or a `third-party/` and a `git add`. Many
large shops just do this and call it "vendoring," and why Hot Tech Startups
don't continues to be a mystery to me.

### Building

**What problem it solves**, uh, lol. You have to run your code! Transform your
source into actual execution!

Most of these other sections are focused on how other languages do it, but this
is a _big topic_. Radically simplifying:

Every language is designed with a basic way to execute its code, and include
other code. Because software is usually "build on top of what you already have,"
most build systems for a given language have their core constructs radically
influenced by the code inclusion features of the language, what the previous
build story was, and what was fashionable at the time.

**In OCaml**, the language is old, so it follows the pipeline more familiar to C
programmers: compile source, tell the compiler where to find other libraries,
bake it into a binary, choose an optimization flag to tradeoff speed and
efficiency. Just as C "solved" compatibility problems with `configure`
scripts, which were "solved" by `autoconf` into a horrendous nightmare of
compatibility layers (PROGRAMMERS AND KNOBS! ALSO, DO YOU KNOW [I RECENTLY WROTE
ABOUT DOCKER][54]?!), OCaml's history (like Erlang's, like Haskell's…) is
littered with the bodies of every "simple" tool that was going to make building
the code a trivial matter of doing it exactly one way.

The current tool winning the war seems to be [Dune][3], formerly called
JBuilder. Before Dune there was Oasis, there was car, there was `ocamlbuild` +
`ocamlfind` (which was incidentally how I [built the first version of
`fleaswallow`][55]). I have beefs with Dune! I don't think it's very obvious how
to do some obviously-useful things, and its relationship with the other tools
in the ecosystem have been hard to derive. But if you can get it working, it's
much better than its alternatives.

A few things to know about Dune:

* It's in active development, so it's getting better every day, and things may
  change out from under you.

* Like `opam`, it likes to have files without extensions littered about where it
  expects information that it needs. This usually looks like a toplevel `dune`
  file, and one any subdirectory that gets to be a part of your build. It's a
  bit reminiscent of systems like [redo][52].

In most build tools I've used, you can say "sources are in this directory,
output should be named [name]" from your toplevel directory; in Dune, you put a
`dune` file at your root and another one in your sources to compile, and the
output name is prescribed by the tool.

* It uses s-expressions, like a Lisp. Why? lol I don't know. opam doesn't. It's
  not OCaml syntax. Just roll with it.

**For your projects**

Tinker around the Getting Started examples until it works. Like opam, there is a
large quantity of docs that will tell you everything on Earth except what you
care about. I started with a little template from the example, stuck it in my
sources, then put an empty `dune` file at the top.

### Tests

**What problem it solves.** Unit tests! The final frontier! The [_only_ approved
software technique of Uncle Bob][29] (he's the guy who sucks). While the world of
software verification is vast and delightful (property-based tests, formal
verification, fuzzing, defect injection, design-by-contract a la Eiffel…), in
practice most people don't study or use too many techniques; unit tests seem to
be the baseline every working engineer is expected to perform.

I have many a rant on the limits of unit testing and the antipatterns I see in
test suites, but that's for another day! For now, I'll just say almost everyone
does this the same: you have your module, and you have yourself _another_ module
in a different directory that starts with `tests` instead of `src` or `lib`.
That test module imports the subject-under-test module, usually mocks anything
with a side effect using the language's most perverted and intrusive reflection
features, and the build tool plays nicely with the framework to run test suites
at a moment's notice with a command. You can specify output a number of
different ways, and/or calculate code coverage.

A few languages break this mould, but I don't see them get too popular. I've
seen a few Racket codebases with [RackUnit][30] checks directly under the
definitions. The [EUnit example from the docs in Erlang][31] does the same
thing, and Pyret, a new little language from a former professor of mine makes
function definition and function testing [go syntactially hand-in-hand.][32]

**In OCaml.** I'm pretty new to this, so I'll say that there are probably lots
of ways to skin this cat. The experience it most resembles most closely was when
I [wrote C unit tests for ScrabbleCheat][28] using a library called [Check][27].
You wrote your tests as other C source files, had to compile them into a
separate binary, and execute _that_ binary. It was possible! But felt a little
unnatural!

Similarly, to make this work with Dune, you can test libraries with
"inline" tests, or you' can test an executable whole-hog via observing its
side-effects when you run it. If you have a large executable and you'd like to
test its "units" individually? Dune doesn't have a runner that supports this.

The "workaround" is to break your program up into non-public libraries from
Dune's perspective, have "inline" tests on _those_ and use those as dependencies
on the executable. Fleaswallow is [95% contained in `fleaswallow_lib`][57], and
there's about [30 lines that call it in the wrapper executable.][56]

It feels gross! And in my light explorations, it's not very featureful: your
"test" is a named, single boolean expression, and when it fails, the test
reporter only tells you "it was false."

I'll see what else I can find here, but Fleaswallow wasn't a project that
I think _strictly_ needed much automated testing, and it shows!

**For your projects:**

* Have your executable code be a light wrapper around one or many internal dune
  libraries.
* Set your [dune libraries to have `(inline-tests)`][33] so `dune runtest`
  works.
* Tell me if you find any fancier features; reporting an assertion failure
  without stating what the differing operands were is the most OCaml shit on the
  planet.

### Interactive REPL with definitions

**What problems does this solve:** if there's a single low-effort, high-impact
tool I feel most developers miss out on, it's more powerful use of a REPLs.
Most people have run one naively by typing `python` or `node`, but with certain
architecture patterns and a few tooling integrations, it can remove _a lot_ of
pain from testing out your code.

Shells can be a lot better than what shipped in languages natively:
[ipython][34] allows tab-completion of imports and powers [Jupyter][35]; `iex`
for Elixir lets you live-reload modules, and print docs with `h MyModule` or `h
MyFunction`.

One use case for which I find them extremely helpful is integrating code with
third-party services. In most automated tests, you want to mock out your Twilio
or Mailgun calls so you're not actually sending emails, or having to hit a remote
server to run your tests. But you _do_ want to see what the output of those
calls are for your inputs before you ship. In a recent Elixir project where I
had to call Twilio, my flow looked like:

- Type something like `Twilio.send(%{"to" => "+12024442019", "body" => "testtest"})`,
  and see if it worked.
- If it didn't, edit your code.
- Type `r Twilio` to reload with changes in the module.
- Press the up arrow twice to get your previous command, hit Enter to run it
  again, see if it worked. Repeat until you get a text.

It took me 5 minutes of back-and-forth until I got the integration working,
mocked the calls in automated tests, and haven't had any problems since.

There are a few things that make it hard to use REPLs like this in a lot of
languages:

- Many languages don't really support REPLs, either as a shipped tool, or
  because it would be too cumbersome to use even if it existed (what would a
  Java REPL even look like? A lot of Go code would be gross at this).

- Getting your definitions (and those of your dependencies) is cumbersome in some
  REPLs. Reloading definitions after an edit might also be cumbersome, and
  the naive "reloading the whole REPL" might lose your previous state, if you
  were building up to a computation.

- Hardest one: most languages don't encourage programs to be composed in such a
  way to enable iterative development. The behaviour you want to test isn't in
  its own function, or requires some state be mutated as a precondition before
  you can call it, or accesses config that your app requires you to build an
  entire framework around to access, or it requires/performs side effects, or…

It's understandable why it's not on most people's roadmaps. For smaller
projects, it can be a godsend: I wrote Fleaswallow 1 and a web app in Elixir
with minimal tests and pretty excellent uptime/correctness because of quick REPL
testing.

**In OCaml** the winner is [utop][36], which is pretty, has autocomplete for
loaded modules, preserves history, and stores intermediate computations. It's a
pretty fantastic REPL all around. Like most OCaml tools, it was meant to support
many workflows, so it's not _always_ intuitive. When I was moving Fleaswallow to
Dune, it never did load my definitions or dependencies correctly; I had a whole
process I was cooking up for how to hack it all together.

But in getting testing to work above, I learned that dune and utop didn't
play extremely well for Dune _executables_. For libraries, it's able to do
more-or-less exactly what you want.

Without Dune, you need a file somewhere for utop to read (by default,
`.ocamlinit` which tells it which definitions to load with directives like
`#require "library_name";;` or somesuch ([example here][37]). Another option is
to use a [custom toplevel executable][38], like [`ocaml-cmark` does here][39].
Compile and run _that_, then you get a utop with your definitions.

**In your projects** Dune [lets you run `dune utop <dir> -- <args>`][40], so if
`<dir>` is your main library, and you use `-implicit-bindings` as one of your
`<args>`, you can get a shell with all the definitions loaded. So as in testing,
there's benefit in putting everything you care about in a non-published library.

### Source formatting

**What problem it solves.** Do you ever worry too much that your code was
written by _humans_? With, like, _personalities_ and _preferences_?!

Well you're not alone! Whereas the Olden Days of programming languages had
grammars that allowed multiple different styles of code, these days, we're all
using tools to flatten what our code looks like. "Tabs vs. spaces" hasn't been a
holy war for decades, and it's been ages since I've heard of any office
fighting over things like brace placement or naming conventions for different
types of variables (e.g. C++ member variable classes named things like
`m_address` or `m_age`).

I attribute as much to high turnover at companies + the need to
distinguish ourselves as "professionals in industry" as I do to the benefits it
confers, which aren't nothing. Especially in giant, fast-moving codebases with
high employee turnover, enforced consistency is a good thing.

PEP8 for Python was something of a pioneer, when a whole language community set
some standards. You _could_ go non-PEP8, and the Python police wouldn't come
after you, but PEP wasn't just, like, [Airbnb's JavaScript][22] or
[Google's Java][23]: this was _the people who made Python._

The next big leap was Go's [gofmt][24], where they pretty much _did_ send the
police to your house if you didn't use it. Whereas PEP8 checkers let you edit
line lengths or opt out of certain suggestions, gofmt took the Python mantras to
heart and said, "no, literally, there is only on way to do it."

This seems to be where people are going. Python's PEP8 suggestions are now
getting taken over by [Black][25], who's opinionated-ness is exactly its branding
point. Elixir, a terribly hard language to set a standard for,
[recently got a formatter.][26]

For my part, I miss when code was obviously authored by people. But, as I said
before, I'm pulled pretty hard by conventions.

**OCaml** (recently!) got [ocamlformat,][21] which also works with Reason.

**In your projects,** you can just run `ocamlformat` in your root directory.

Kidding! LOL! Of course I'm kidding! Have you read any other section of this
post?! Of course you can't just run it!

_First_ you need to install it in your switch. This isn't so bad: add it as a
dependency in your `opam` file, `opam install . --deps-only`. This might also be
a case where it makes sense to install it globally, since it doesn't run during
the formal build part of your program.

_Then_ you need to tell your root-level `dune-project` file that you want to use
the formatting extension. Add `(using fmt 1.2)` to the file.

_Then_ you can run it from `dune` with `dune build @fmt`. Joking! This is OCaml!
Of course you can't _just_ do that.

`ocamlformat` errors out telling you it wants you to either have an
`.ocamlformat` in your root directory, _or_ you pass the flag
`--enable-outside-detected-project`. You can run `ocamlformat --help` to see the
options it wants set, or just look at the `.ocamlformat` I put in Fleaswallow.
They have a few presets! Try out your favorite!

### Quick-fire topics

I could write more, but jesus this is long enough, so we'll quickfire these.

#### Editor config

The main engine behind OCaml smart editing is [Merlin][41]. The VS Code plugin
will install + use it automatically.

I'm on vim, so I also installed the [ocaml-language-server][42] which requires
Merlin installed, and uses it under the hood. When combine with [ale][43] and
[deoplete][44], I get asyncronous autocomplete, syntax checks, and type checks.
I set vim shortcuts for useful "jump to definition" or "tell me the type of this
expression". More [instructions here][45].

#### Configuration

Erlang and Elixir projects tend to have a standardized way of doing config. Most
dynlangs use JSON or YAML. You're _already_ being a microbrew weirdo by using
OCaml, so why use a substandard format like JSON (no comments?!?) or YAML ([this
shit][46] or [this shit][47]).

So I'm using [INI files][48] (it's good enough for Git!), and [an OCaml library
to parse them.][49] I've heard good things about [TOML][50] but I'm still
[following Julie's lead][51] and eschewing the dude and his work.

#### Unfuck your Standard Library

The standard library that ships with OCaml lacks tail recursion [on things like
List.map][58], which… is funny. Most old languages have some kind of bad default
library (see Google's Guava as Java's "missing standard library," or listen to
[Haskellers talk about Prelude][59]).

OCaml seems to have a slapfight here, with some people going Full Jane Street
and picking [Core][60], and others were picking [Batteries][61]. I picked Core
because it's what [Real World OCaml][62] as using.

#### Asynchronous programming; pick a side

Similarly, there's a slapfight between [Lwt][64] and [Async][63]. Haven't played
with these yet, but be aware you'll have to pick a side!

### Out of scope

I don't know anything about profiling, property-based testing, post-mortem
debugging, many of the fancy monad tricks that I'm seeing get popular, syntax
extensions + term rewriters.


   [1]: https://www.rebar3.org/
   [2]: https://opam.ocaml.org/
   [3]: https://dune.build/
   [4]: https://opensource.janestreet.com/
   [5]: https://xkcd.com/927/
   [6]: https://twitter.com/garybernhardt/status/397499540590178304
   [7]: https://github.com/rbenv/rbenv
   [8]: https://rvm.io/
   [9]: https://github.com/kerl/kerl
   [10]: https://github.com/nvm-sh/nvm
   [11]: https://github.com/asdf-vm/asdf
   [12]: https://opam.ocaml.org/doc/man/opam-switch.html
   [13]: https://opam.ocaml.org/packages/ocaml-inifiles/ocaml-inifiles.1.2/
   [14]: https://github.com/pablo-meier/fleaswallow
   [15]: https://github.com/pablo-meier/ScrabbleCheat/blob/bd75341c97597aa26cee7f38575f57bd2d01e12f/code/clients/curses/painter.rb
   [16]: https://github.com/pablo-meier/ScrabbleCheat/blob/718cb768a910f2ba7ca6cd1d2aae0e342849bf0a/code/clients/curses/lib/painter.rb
   [17]: https://opam.ocaml.org/doc/Manual.html#Public-configuration-files
   [18]: https://opam.ocaml.org/doc/Manual.html#Package-variables
   [19]: https://opam.ocaml.org/doc/Manual.html#version-ordering
   [20]: https://www.debian.org/doc/debian-policy/ch-controlfields.html#s-f-Version
   [21]: https://github.com/ocaml-ppx/ocamlformat
   [22]: https://github.com/airbnb/javascript
   [23]: https://google.github.io/styleguide/javaguide.html
   [24]: https://golang.org/cmd/gofmt/
   [25]: https://black.readthedocs.io/en/stable/
   [26]: https://hexdocs.pm/mix/master/Mix.Tasks.Format.html
   [27]: https://libcheck.github.io/check/
   [28]: https://github.com/pablo-meier/ScrabbleCheat/tree/master/code/server/lib/bingad
   [29]: https://www.hillelwayne.com/post/uncle-bob/
   [30]: https://docs.racket-lang.org/rackunit/
   [31]: http://erlang.org/doc/apps/eunit/chapter.html#an-example
   [32]: https://www.pyret.org/#examples
   [33]: https://dune.readthedocs.io/en/latest/tests.html#inline-tests
   [34]: https://ipython.org
   [35]: https://jupyter.org
   [36]: https://opam.ocaml.org/blog/about-utop/
   [37]: https://stackoverflow.com/a/20938813
   [38]: https://github.com/ocaml-community/utop#creating-a-custom-utop-enabled-toplevel
   [39]: https://github.com/jyc/ocaml-cmark/blob/master/src/cmark_top.ml
   [40]: https://github.com/ocaml/dune/blob/master/doc/usage.rst#launching-the-toplevel-repl
   [41]: https://github.com/ocaml/merlin
   [42]: https://github.com/freebroccolo/ocaml-language-server
   [43]: https://github.com/dense-analysis/ale
   [44]: https://github.com/Shougo/deoplete.nvim
   [45]: https://github.com/ocaml/merlin/wiki/vim-from-scratch
   [46]: https://i.redd.it/0lg04ovga0m11.jpg
   [47]: https://arp242.net/yaml-config.html
   [48]: https://en.wikipedia.org/wiki/INI_file
   [49]: https://opam.ocaml.org/packages/ocaml-inifiles/ocaml-inifiles.1.2/
   [50]: https://en.wikipedia.org/wiki/TOML
   [51]: https://twitter.com/nrrrdcore/status/459358875213238272
   [52]: https://redo.readthedocs.io/en/latest/
   [53]: /2018/02/trying-ocaml.html
   [54]: /2019/08/beefs-with-docker.html
   [55]: https://github.com/pablo-meier/fleaswallow/blob/0bec5969a6c8d628487f05fbcaa9e80d251b98d2/Makefile#L4-L23
   [56]: https://github.com/pablo-meier/fleaswallow/tree/5670783ef3f6e5385771c7da0e935746dc59d4a0/src
   [57]: https://github.com/pablo-meier/fleaswallow/tree/5670783ef3f6e5385771c7da0e935746dc59d4a0/src/fleaswallow_lib
   [58]: https://caml.inria.fr/pub/docs/manual-ocaml/libref/List.html
   [59]: http://dev.stephendiehl.com/hask/#prelude
   [60]: https://opensource.janestreet.com/core/
   [61]: http://batteries.forge.ocamlcore.org/
   [62]: https://realworldocaml.org
   [63]: https://opensource.janestreet.com/async/
   [64]: http://ocsigen.org/lwt/4.3.0/manual/manual
