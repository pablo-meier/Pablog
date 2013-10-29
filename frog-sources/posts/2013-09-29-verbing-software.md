    Title: Verbing Software
    Date: 2013-09-29T13:41:13
    Tags: engineering

I've mentioned that often people will often
[use a language to describe their new one][1], hoping to invoke some feeling
from the reader. It's obviously done with software too, and I'd like to "verb"
two particular projects attack certain software problems, and hope more software
tackles similar problems.

### CoffeeScript

<!-- more -->

**What it is:** JavaScript sucks. While there are deep implementation issues
that are unavoidable no matter what you do (all numbers are floats, strings must
be comprised of 16-bit code points...), there are also just crappy and confusing
surface pieces of the language, like the four meanings of `this`,
function-not-block scoping, and the `==` operator. Furthermore, some facets
(like having to declare `var` everywhere, and semicolons) pass without error or
even necessarily incorrect behavior, leaving bugs that lurk behind the curtains.

[CoffeeScript][2] approaches this in a novel way: be _essentially_ the same
language, just remove the warts that you don't like. In CoffeeScript, `==`
compiles to JavaScript's `===`. Undeclared variables get `var`ed and placed at
the top of their declaring function. It handles semicolons sensibly. If you know
JavaScript, there's little semantic overhead in learning CoffeeScript, you'll
just (usually) write fewer bugs since the most confusing features of the
language have been scrubbed.

**And verbing it?** I wish we "CoffeeScripted" more languages. C and C++ come
to mind: there are a number of ways to shoot yourself in the foot that could be
statically detected, or a number of legal expressions that almost never mean
what the programmer meant. Yes, we have linters, but we could do better,
especially since you'll want to break the rules sometimes and it's hard to tell
a linter "here, I _meant_ it."

Imagine declaring/assigning variables like in Ruby or Python, and the preprocessor
for the language includes `auto` and the semicolon. Imagine having your
call-by-reference and move semantics expressions done automatically.
Forward declarations! Preprocessor guards! It'd be a bit more like Java or
Groovy, but _it'd still be very much C++_. If you wanted to use something beyond
the default (i.e. declaring a call-by-value function), you could just write it
in a seperate C++ file that speaks with whatever this mythical "Coffee++Script"
would talk to.

But C++ as-is is so noisy (and all the noise is there for a good reason), and I
feel it'd be nice to have a simple preprocessor language like CoffeeScript to
clean it up.

### Clang

**What it is:** It should first be explicitly stated that [gcc][3] is software
that's changed the world for the better by making a free, world-class compiler
available and hackable to all. And it's good at what it does -- it's very
reliable, and produces fast executables.

The problem wasn't so much that it failed its purpose, it's that it achieves it
_just well enough_ to leave it be. There was no reason to write a new compiler
because you could just hack this one, and it works _fine_. But hacking gcc
became difficult over time, and many static analysis tools would have been
excessively difficult to implement given all the legacy.

Enter [Clang][4]. Built on [LLVM][5], it's code is much more modular, provides
a better UI (everyone has a moment when they see their first Clang errors), and
more amenable to "sharing its parts" so the writers of programming tools can
better leverage the compiler. Maybe it's a bit of a stretch, but the whole
project reminds me of [destructive programming][6].

**Why would I want to "clang" a project"?** Because much of my _absolute favorite_
software, the programs that enrich my life and are hardest to pull myself apart
from, are far too opaque to hack at easily, and suffer from incredible wartiness.

The biggest case for me is [vim][7]. Lord do I love vim. I never could learn to
play the guitar or piano but my fingers have learned the chords, progressions,
and Zen of vim to love editing text, such that I feel impaired if I'm writing in
another editor.

But good lord Vimscript is an undocumented, semantically muddy mess. How do you
advance from the simple act of editing text to richer features for programmers,
authors, or screenwriters? How do we extend this? Some brave souls rough it
out through Vimscript, and theoretically Vim is open source so you can do what
you like. But Vimscript is confusing, limited, and a peek at the Vim source code
shows you this is a hard mess to hack.

And while Emacs has a much better scripting language, for many, ELisp is also a
little muddy (woo dynamic scope!) and many users want to change it out.
And [they're][8] [trying][9].

But here's where we can learn from Clang: re-implementation is just one part of
this. But what about breaking your core work into libraries, much like Amazon
[does everything with services?][11] Clang is built on LLVM, and [a look at the codebase][12]
demonstrates that clang (and other compilers on LLVM) is built by attaching
well-considered components.

Paul, isn't that just good, modern software design? Yes, but let's apply it
**retroactively, to codebases that do their job just "well enough."**

I bring this up because I love software that enables Vim keybindings (such as
[Pentadactyl][10]) but if I ever wanted to implement support for Vim keybindings
in software of mine, I'd have to learn all of Vim's keybindings and
its entire state machine, then write duplicate code to implement it. Everyone
who uses Vim-like plugins in their software knows that none of them get it
"just right." What if Vim could easily expose the same logic it uses to other
developers?

Many large systems are structured this way -- game engines, and what I've seen
from the developing [Servo][13] code. I just wish we did it in retrograde more
often, like game [demakes][14], for indispensable, old software.

   [1]: http://www.morepaul.com/2010/07/languages-to-describe-languages.html
   [2]: http://coffeescript.org/
   [3]: http://gcc.gnu.org/
   [4]: http://clang.llvm.org/
   [5]: http://www.llvm.org/
   [6]: http://dpm.pen.io/
   [7]: http://www.vim.org/
   [8]: http://www.emacswiki.org/emacs/GuileEmacs
   [9]: http://common-lisp.net/project/climacs/
   [10]: http://5digits.org/pentadactyl/
   [11]: https://plus.google.com/112678702228711889851/posts/eVeouesvaVX
   [12]: http://llvm.org/docs/GettingStarted.html#llvm-lib
   [13]: https://github.com/mozilla/servo
   [14]: http://en.wikipedia.org/wiki/Video_game_remake#.22Demakes.22
