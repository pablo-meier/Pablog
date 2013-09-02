    Title: Software and Evolution
    Date:2010-04-08T09:59:00
    Tags: pablolife

I think the software is growing, and will continue to grow, the way lifeforms have grown
and evolved on Earth.  By tthis I mean we started with a single
ancestor, likely of a few proteins or perhaps a single cell, only to become a
planet housing humans, echidnas, sponges, fungi, insects, trees, and more.

This mostly comes to mind when I look at essays like [this][1] [series][2], by
Mike Taylor, on how so much of coding these days is just playing plumber
between various libraries, fixing leaks and disasters that occur when the
piping isn't perfect. The argument is stated well by jdietrich commenting on
the story (where else?) on [Hacker News][3]:

> My biggest gripe with modern programming is the sheer volume of arbitrary
> stuff I need to know. My current project has so far required me to know about
> Python, Django, Google App Engine and it’s datastore, XHTML, CSS, JQuery,
> Javascript, JSON, and a clutch of XML schema, APIs and the like.Don’t get me
> wrong, I’m grateful for all of it, but it just doesn’t seem like what I was
> promised when I followed SICP for the first time. It just feels like I spend
> most of my time scouring through documentation and trying to remember umpteen
> different sets of syntax and class names rather than actually thinking in
> code.
>
> Back in ye olden days, most programming tasks I performed felt quite natural
> and painless, just a quiet little chat between me and the compiler. Sometimes
> longwinded, sometimes repetitive, but I just sat and though and typed and
> software happened. The work I do these days feels more like being a dogsbody
> at the tower of babel. I just don’t seem to feel fluent in anything much any
> more.
>
>
> We talk about ‘flow’ quite a lot in software and I just have to wonder what’s
> happening to us all in that respect. Just like a conversation becomes stilted
> if the speakers keep having to refer to their phrasebooks and dictionaries, I
> wonder how much longer it will be possible to retain any sort of flowful state
> when writing software. Might the idea of mastery disappear forever under a
> constant torrent of new tools and technologies?

I happen to agree with most of the posts, but their symptomatic of something
that's been on my mind: _our code is really inefficient._ But more
importantly: _that's okay_, and further, _we will have to live with it in
order to reach software at the level that humans are at biologically_.

Allow me to clear up the mapping. When we started with computers, we wrote in
raw, unadulterated binary. Every machine instruction was treasured, coddled,
and several [amazingly clever][4] [hacks][5] were developed so operations
could use minimal resources.

This was a necessity! We had to! But then we moved up to assembly, then the
Capital Languages (FORTRAN, COBOL), and so on, until computers got powerful
enough that we could afford ourselves some abstractions. What level of
abstractions? Imagine how Mel the Real Programmer and other hackers of the
binary era must feel when we're using languages with immutable strings, and
someone writes code like:

```java
    String container = "";
    for (String suffix : suffixes)
        container += suffix;
    return container;
```

In which _every iteration of the loop allocates a new string!_ And the code
doesn't render the program unusable!

How does Mel feel? Probably how a bacteria (or other single-celled organism)
would feel when I scratch an itch, and kill or damage hundreds of skin cells
ostensibly for nothing.

Single cell organisms are still with us, and will almost certainly outlast us.
We still have them in programming as well. To this day, if you want to really
bust out the performance, you still gain lots by living close to the metal: I
know a student in the introductory graphics class who implemented his linear
algebra package by including x86 in his C. And almost all projects for my
combinatorial optimization class are done in C only because, true or not, we
believe "it's the fastest." (it is really fast).

The truth is, while people are still busting out assembly and squeezing
whatever hardware gains they can, most of us can now get away with being
pretty wasteful. And its the only way we can build the truly large, monolithic
systems people pay big money for.

What am I trying to communicate with this metaphor?

First, **stop arguing that speed be the limiting factor of a language or
technology's eventual success.** Every abstraction we use today (structured
programming, object-orientation) was painfully slow during its introduction,
but it will be one of these abstractions that will be the key to the next step
in software evolution.

I recognize there are many good arguments against the use of functional
programming, logic programming, and other alternate paradigms. Having speed
comparable to other non-C languages today and calling it slow is not one of
them.

Second, the diversity of software will propagate. Bacteria, fungi, plants, and
eagles all live in radically different ways. Learn this and love it. Saying
'my form of programming is the **real** way' is like saying fungi are a
**real** life form, but plant life isn't. Embedded systems have different
needs than white-collar users of 'enterprise' software, different than
logicians.

Finally, as it relates to Mike Taylor's article, what we are seeing now with
library hell is the bad mutations of software evolution, the ones that will
die out until we figure out how to do it right. If software at this point is
at a jellyfish level, us sorting out library or framework programming are all
the failed experiments to grow bones, gills, feet, and wings. One of them will
work eventually, but lots and lots of our software will die until it does.


   [1]: http://www.pragprog.com/magazines/2010-04/tangled-up-in-tools
   [2]: http://reprog.wordpress.com/2010/03/03/whatever-happened-to-programming/
   [3]: http://news.ycombinator.com
   [4]: http://www.hackersdelight.org/
   [5]: http://www.cs.utah.edu/~elb/folklore/mel.html
