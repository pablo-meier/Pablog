    Title: Done with Compilers
    Date: 2013-12-04T14:21:12
    Tags: engineering

I'm on a bit of a professional hiatus right now, having left Google in August
to pursue Big Life Things. I had some ideas for a big engineering project to do
in the meantime, and like any language nerd, I wanted to write my own language.
This is daunting -- L. Peter Deutsch [recommends otherwise][1], and a perusal of
the [Programming Language Checklist][2] does a good job to scare you away.

I had a few designs, some template code, and may revisit the project. But I'll
blog about part of what I was hoping to achieve, in case someone else gets
inspired.

<!-- more -->

Notably, while I certainly had some opinions and ideas of the _features_ of the
language (static vs. dynamic types, manual or automatic memory management, all
things syntax), I was hoping to make a bigger dent on on how its
_implementation_ and _user interface_ could assist programmers more than other
languages have. It's not often that PLT folks discuss UI since, in most
contexts, _UI_ usually applies to some graphical element, but I think it's often
overlooked, and where the next real big gains will be.

<h3 id="user-interface-in-a-programming-language">User Interface in a Programming Language?</h3>

What do I mean by this? Namely, we tend to view language implementations as
source files -> compiler -> binary (or bytecode), and all other elements of interacting
with your program has to come from the outside. I'll write C code, but someone
had to write `valgrind` for me to profile it, someone else wrote `ctags` for me
to have access to the variables while editing, and someone else has to string
them together in Vim or Emacs for me to use them seamlessly. Java has `javac`
and the whole JVM, but IBM had to write Eclipse to access a bevy of features,
and without a really funny (and impressive!) [patch job][3], I can't do the
editing portion in Vim.

Mostly, we seem to seperate the language labor as _designers work on features_
and _compiler writers find a way to translate those features into machine code_,
so almost all discussion that immediately follows "my new language is X" is
"what features does it have?" followed by "what does Hello World look like?"

But when you consider the experience of writing and maintaining large programs,
the features or syntax or even programming model of the language is hardly what
you find yourself wishing to be different -- you immediately get stuck on
"where is the test for this function" or "I want to open the applicable
definition here" or "where else does this function occur?" You'll spend a few
hours or days looking for your environment's plugin to have a REPL or
integration with compiler errors, and pray that whoever is maintaining it is on
top of things.

And we _do_ have tools that help with these, but they always come from _outside_
the compiler. Ctags and valgrind are mentioned above, but how many of us Vimmers
use Eclipse for Java, DrRacket for Racket, and Visual Studio for C++ because it's
just a much better experience?  

Some other motivating questions, after working jobs in C++ and Java:

* **What assumptions are language implementors making that 'offload' so much work
  to their users?** Consider build systems -- Google uses [their own custom one][5],
  and one project I worked on had me learning three different purportedly "cross-platform"
  tools that try to solve the same problems ([ant][6], [CMake][6], and [gyp][7]).
  Yes, the respective compilers "build" the code, but they don't, really.

* **What architectural or systemic assumptions are we making that are no longer true?**
  Consider that most compilers are programs we run locally on local files, when most
  code is written by teams on many computers, sometimes in many offices, who tie
  to test instances, continuous build servers, and the like.

The system I hoped to build used an idea I called the "Companion Server," which
is succinctly described as a constantly-running headless IDE.

<h3 id="properties-of-the-companion-server">Properties of the companion server</h3>

You could run your companion server locally and only run it on your local files,
and in this way it would serve like a more traditional compiler. But using a
command-line client to the server, you can

* Build your project.
* Test your project.
* Upload it to the package manager.
* Download and build dependencies via the package manager.
* Run a linter, style checker, or documentation generator.

If this sounds familiar, it's because we're seeing work on this already with
`go`, `rust`, and `raco`. The idea that your command-line tool should do more
than simply compile to a binary is, so far, a great success. But we can go further.

<h4 id="thick-server-thin-clients">Thick Server, Thin Clients</h4>

Most features of an IDE are very useful, like

* Semantically-aware autocomplete.
* Jump to definitions, declarations, test cases, other references in the code base.
* Integration with version control.
* A convention for building and packaging your project (i.e. source layout, asset location, etc.)

The issue with most current IDEs is that the authors of the tools need to
re-write too much of the functionality of the compiler, this doesn't always keep
up with language changes, and it locks you in to the IDE even if you prefer
other environments for other features. In pictoral form:

```
                 ---------------------------------
                 |            Compiler           |
                 ---------------------------------
               /                  |               \
  |-------------|          |-------------|         |-------------|
  |   *Env 1*   |          |   *Env 2*   |         |   *Env 3*   |
  |  Feature A  |          |  Feature B  |         |  Feature C  |
  |  Feature B  |          |  Feature C  |         |  Feature E  |
  |  Feature D  |          |  Feature F  |         |  Feature F  |
  |  Feature E  |          |             |         |             |
  |-------------|          |-------------|         |-------------|
```

Here, the compiler is _thin_, in that it only compiles code, and all the
features are built on re-written parsers on the client side (or worse, regular
expressions), which is often very _thick_ (who doesn't love Eclipse start-up times?).

The Companion Server would work by implementing the features for language
development _in the server itself_, and each environment would simply be a thin,
unintelligent plugin that gets its orders from the companion server:

```
                 ---------------------------------
                 |            Compiler           |
                 |           Feature A           |
                 |           Feature B           |
                 |           Feature C           |
                 |           Feature D           |
                 |           Feature E           |
                 |           Feature F           |
                 ---------------------------------
               /                  |               \
  |-------------|          |-------------|         |-------------|
  |   *Env 1*   |          |   *Env 2*   |         |   *Env 3*   |
  |    Plugin   |          |   Plugin    |         |    Plugin   |
  |-------------|          |-------------|         |-------------|
```

As an example, say you're editing in your favorite editor (Vim, Eclipse, VS) and
you push the shortcut for the autocomplete. The plugin will note the buffer
you're in, the position of the cursor, and what you've already typed, and send
it to the server. The server knows your code already on a semantic level,
creates a list, and sends it back for the plugin to present to you in an option
menu.

Alternatively, suppose you want to jump to a definition: the plugin sends the
location, token, and buffer you're currently in, and the server sends back a
location and buffer where it's defined. The plugin opens the buffer, and places
the cursor where it was told.

The advantages to this are manifold:

* Features for development keep right up with the language itself.
* You don't _need_ to be "in the know" for an advanced development setup, nor would 
  you have to buy fancy tools -- once you've downloaded the runtime, you have all
  you need already.
* If the feature system is designed well enough, you could have a rich third-party
  ecosystem by letting people write their own dev features.
* You get to work in the environment you want, and writing a plugin for new environments
  is dead easy, since you only have to write to an API provided by the companion
  server.

This is partially why DrRacket is such a fantastic IDE -- it's written by the
authors and implementors of the language itself, in the language itself!

<h4 id="use-the-butt4-luke">Use [the Butt][4], Luke</h4>

The other idea of using a server model would be to take advantage of yet another
architectural change that seems to get ignored: we're all multicore, usually
online, and usually running in multi-machine environments. We're also (almost
always) working on teams that are accessing the same codebase.

Using [Google's build system][5] was pretty inspiring, since you'd be compiling
and deploying codebases with hundreds of thousands of computers. Compile times
were still non-trivial, but considering the size and scale of the code and its
dependencies, it was a monumental improvement.

Given this, I think it would be a huge net win if **language figureheads
included a server-farm ready build solution that figures in packages, dependencies,
and incremental builds for teams.**

<h4 id="done-with-the-current-model">Done with the current model</h4>

The actual implementation details for these are naturally pretty complicated, 
and I don't doubt this would be a challenge. You also don't want to lock people
into a set of "standard tools" and kill competition (what if profiling functionality
was in C companion servers, but was awful compared to valgrind?). That said, I think
it's a cute ideal. When learning a new language, I'd like to feel like I'm in
2013 while still using Vim (not Vim keybindings, actual Vim) to do the text
editing portion of programming.

   [1]: http://stackoverflow.com/a/3662539/196469
   [2]: http://colinm.org/language_checklist.html
   [3]: http://eclim.org/
   [4]: https://chrome.google.com/webstore/detail/cloud-to-butt-plus/apmlngnhgbnjpajelfkmabhkfapgnoai?hl=en
   [5]: http://google-engtools.blogspot.com/2011/08/build-in-cloud-how-build-system-works.html
   [6]: http://ant.apache.org/
   [7]: http://www.cmake.org/
   [8]: http://code.google.com/p/gyp/
