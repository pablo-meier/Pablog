    Title: STOP IT WITH YOUR STATE
    Date:2010-12-07T21:57:00
    Tags: pablolife

Alright forks, time for some smugness.  I know, on this blog?!?  But bear with me.
I'm just completely [frakking][1] pissed at a number of bugs I've been chasing
down, at work and at home, and after looking for the more general problem,
it's all about state. ALL OF IT.


Okay, not all of it. Most of it has to do with poor abstractions at the
programming language level. But the _primary_ one is state, and mostly, I
think it's about time just done gone outgrown that shit.


Java was such a rousing success in part because it was so completely idiot-
proof. When you remove memory management and pointers from C++, and sandpaper
a few of its edges (no header files or need to declare methods, for example),
virtually everyone can program in it and not make _too_ big a mess. While I
think Java is a completely neutered language (not to mention a [liability
issue][2]), I think it really didn't go far enough. No, forks, **let's learn
from our friends in the 1970's and 80's and just flat out remove mutable state
already, since most programs don't need it and most programmers can't handle
the responsibility of it. The same goes for pointers, but you already knew
that.**


Despite it being un-rantey, let's qualify this for a second: I'm not saying
_all_ programs should be written statelessly, or that _nobody_ should be using
pointers. And Lord knows all programmers would ideally know more than just the
basics on these topics. We'll always have a need for embedded systems,
operating systems, very fast media processing, and scripts we'll use only once
and not want to think too hard about.


The problem comes with all the rest of the programs, that don't _need_
instruction-level efficiency; many are still written with mutable state as the
default rather than a last resort. This is like solving your problems with
beatings before you try reason. Most programmers use it willy nilly, thinking
they're holding firecrackers when they're really holding grenades.


Here's ultimately the reason: **in today's day and age, knowing what we know
and writing the programs we want to write on the hardware we have, state is an
abstraction that is too easily broken for the power it gives you, and it's
about time we outgrew it.** Let's look at the popular programming paradigms
from the abstractions they rested on, and you notice a trend:


[![][3]][4]


**Structured programming:** this was at first met with resistance: why would
you eliminate [goto][5]s? The answer was the best noun-made-command I know:
[goto hell][6]. As programs got larger and larger, there came a point where
there was just too much complexity associated with being able to arbitrarily
jump to any lexical location in your code. Since this was often in languages
with file inclusion, this meant _you could jump anywhere in any file you were
including from anywhere else!_


What was the solution? Was it [moar][7] gotos? IDE's to help with goto-related
programming? No forks, **they just cut that shit out** and started [structured
programming][8]. This led to a great bloom in software, where we got all our
delicious \*nix dinosaurs we know and love even today.


But what about GIANT programs, like Word? What made that possible? Because
again, **at a certain scale, this paradigm got unmanageable.** Namely, keeping
track of all the data associated with a function got to be way too complex.
Structs of structs of structs would lead to [3-star programmers][9] that made
code a vile mess to work with and debug. It was only when we decided to
encapsulate data with its related function in objects that we got to **Object-
Oriented programming.**


And that led to its _own_ bloom of awesomeness. But really forks, have we
solved software? Is it too unreasonable to think that maybe **objects* rely
too much on state to be as scalable as the programs we want to write these
days?**


(Never mind the other, non-state objections to OOP, such as [modeling programs
that _do_ things entirely with _nouns_][10], or the [avoidable lame hoop-
jumping][11] called Design Patterns that objects make us use).


It sounds extreme, but you don't know the shackles you're programming with
until you break free of them. **Once the outputs of a function depend entirely
on its inputs, it _actually_ becomes reusable.** You only have to test the
outputs for every set of inputs, not the outputs for every set of inputs at
every possible state the whole rest of your program can be in!


Further, once you eliminate the null value or null pointer, a function call
_must_ return "Whatever I promised," not "Whatever I promised or NULL lol go
debug that."


And the sooner we do this, the sooner we don't have to sit at our debuggers
stepping through reentrant code looking at register values for the exact
moment the memory's [head a splode][12].


Most of all, I'd have to find another way to be inflammatory, rantey, and use
too much formatting markup.


\* = Note that my beef isn't entirely with objects, per se. there are object-
oriented languages that don't rely on state. [Scala][13] is the most popular
that encourages functional programming, and [Reia][14] has immutable objects.


(for those curious, I'm mostly up to proverbial here with my last bug on a
major [ScrabbleCheat][15] feature. I veered away from Erlang to write the UI
in Ruby with an [ncurses][16] [wrapper][17], and now that I've dabbled in a
stateful solution I'm fighting memory corruption in a language without
explicit memory management. Bleh.


Meanwhile, I'm hating on C++ because a) I use it at work, b) in the playtimes
I've used it, I've only ever regretted it, and c) it's C++, what kind of
language snob would I be if I treated it fairly?)


   [1]: http://en.wikipedia.org/wiki/Frak_(expletive)

   [2]: http://news.cnet.com/8301-30684_3-20013546-265.html

   [3]: http://3.bp.blogspot.com/_3ys1dwfzc2w/TP8zNIIdO0I/AAAAAAAAAHw/YV1Z7kIMiDw/s400/DefectiveC%252B%252B.png

   [4]: http://3.bp.blogspot.com/_3ys1dwfzc2w/TP8zNIIdO0I/AAAAAAAAAHw/YV1Z7kIMiDw/s1600/DefectiveC%252B%252B.png

   [5]: http://xkcd.com/292/

   [6]: http://www.satyamnayak.com/?p=117

   [7]: http://www.urbandictionary.com/define.php?term=moar

   [8]: http://en.wikipedia.org/wiki/Structured_programming

   [9]: http://www.c2.com/cgi/wiki?ThreeStarProgrammer

   [10]: http://steve-yegge.blogspot.com/2006/03/execution-in-kingdom-of-nouns.html

   [11]: http://norvig.com/design-patterns/

   [12]: http://www.homestarrunner.com/sbemail94.html

   [13]: http://www.scala-lang.org/

   [14]: http://reia-lang.org/

   [15]: http://github.com/paul-meier/ScrabbleCheat/

   [16]: http://www.youtube.com/watch?v=2FH4-Ik27lU

   [17]: https://github.com/eclubb/ncurses-ruby
