    Title: Hiatus - And a voyage of vim
    Date:2010-02-15T21:29:00
    Tags: pablolife, engineering

Sorry for the lack of updates.  I hate when blogs say that, but publishing less
than once a month defeats the purpose of a blog. I blame what I always have:
my insistence that what I publish be Significant (the last two posts were more
than epic enough), even when it goes against the interests of a) myself, and
b) my readers (are there any there)?

But let's continue. What am I up to? Oh, yes! These are things I'm working on
in school, and am likely to write about (if I ever do, in fact, write):

**[Solving Hard Problems with Combinatorial Optimization][1]** is one of the
5-6 legendary courses everyone at Brown CS is told to take, something like a
rite of passage. I missed the chance to take one of those classes ([Operating
Systems][2]) in lieu of another ([Programming Languages Seminar][3]), and
while I loved loved loved PL, I won't allow myself to graduate without taking
this course.

I'm also taking an **independent study on Android Game Development**, with
some pretty awesome partners. It's something very different than I'm used to:
whereas I'm used to writing programs that run on your terminal, performing
computation or purely manipulating data, Android is framework programming with
GUI's and graphics. The data in this case is usually mundane plumbing, and the
_easy_ part of your application.

Altogether, good fun. Hopefully I'll still have time (and this is dubious) to
continue pursuing my lovely [programming][4] [puzzles][5].

In the meantime, I'll bloviate some. Today I'll talk a bit about my tools with
a focus on text editing.

I feel like refining and expanding upon your coding environment is something
like building your own lightsaber: you can use someone else's, but you really
only work productively (and more importantly, happily) when you find the tools
to fit your needs yourself, and through much experimentation. For me, that
environment is usually all-out **vim + Makefiles** (or in Java, vim + ant),
and as much from the Terminal as possible.

A lot of junior hackers feel this way, but most 'enterprise developers' (those
who know everything there is to know about the JVM and its classloading
process but have no notion of first-class functions, or final vs. const in C#)
love to stick it to me on their IDE's. Similarly, when I witnessed an emacs
vs. vim brawl (one of our professors left their terminal exposed, revealing
which side they were on), the emacs user felt under attack before I said my
first words.

Here is why I use vim instead of emacs: **because I learned it first.**
Alternatively, you can use any of the equally compelling reasons in the list
below:

* Because I prefer to map Caps Lock to Esc instead of Ctrl.
* Because my brilliant [hacker][6] [friends][7] next to me use vim exceptionally well and inspired me (they could have just as easily been emacs users).
* Because a friend put up a photo of Richard Stallman in the lab and joked about the fact that he used Ctrl^H for Help.

None of these are real reasons, folks. They're all true, and honest-to-Baal
the only things that pushed me to vim. Since I have a soft spot for Lisp, I
hope one day to pick up emacs, and remain open to the possibility that it may
suit me better.

What I learned in the aforementioned editor brawl (and I hope we as an
industry have outgrown the lame fighting\*): if you see someone warring over
their editor, don't feed the animals. It's clear that very smart and
productive people use one or the other; that you don't like it is not reason
for indignation. Further, who cares what someone else uses?

I would extend this to Tabs vs. Spaces as well, or where to put your open
braces in if/else blocks. There are [tools][8] to [convert][9] to your
preferred style. Change it, work on it, change it back.

---

For now, I use vim because I know it, and only started using it last year.
Before that? [Kate][10] on the department filesystems, [SubEthaEdit][11] on my
home computer, and [nano][12] when I ssh-ed from the terminal. I edited Java
in Eclipse.

Do I recommend switching as I did? Yes. Keeping it general, **if you are a
coder who uses a primarily graphical environment, I highly recommend you
become proficient with a serious, terminal-based text editor.** You don't have
to love it, you don't have to keep it, but try it, and give it a fair shot.
Why?

* Learning a Terminal-based editor lets you know you have a comfortable editor with you anytime, anywhere. When I used SubEthaEdit, it was not only Mac-specific, but _commercial_. If I wasn't editing on my laptop, I wasn't editing in my preferred environment.

* Both major players encourage keyboard use. You will never know the shackles of inconvenience that frequent mouse usage is until you've been set free. Doing everything on the keyboard makes using the computer for 6-7+ hour stretches much more tolerable.

* If you are in a resource-scarce environment (say, ssh on a shady connection), you can bet that software written in the early 90's or 70's will load quickly, and leave a small footprint on your resources.

* They are scriptable. Many editors are programmable, but there's a difference to writing a tool in ELisp or Vimscript, and writing an Eclipse plugin.

* Most of all, **you look like a badass.**

Of course, you lose some conveniences as well (especially in the case of
Eclipse), but so far they haven't outweighed the benefits.

Of course, if you are an IDE user, there's a very (very) good chance you're a
more premium coder than I am. I'm not making a value judgement on you; I
simply suggest you try loving your Mother Terminal, who paved the way for the
sexier IDE's.

\* = Open question: What is our generation's equivalent? Ruby vs. Python? More
generally, the static typers vs. dynamic typers? Chip in, as a former actor in
training, the only things I love more than Computer Science is Drama ^\_^


   [1]: http://www.cs.brown.edu/courses/cs258/
   [2]: http://www.cs.brown.edu/courses/cs167/
   [3]: http://www.cs.brown.edu/courses/cs273/
   [4]: http://projecteuler.net/
   [5]: http://www.facebook.com/careers/puzzles.php
   [6]: http://www.cs.brown.edu/people/andrew/
   [7]: http://www.csail.mit.edu/user/2032
   [8]: http://stackoverflow.com/questions/338767/tool-to-convert-python-indentation-from-spaces-to-tabs
   [9]: http://www.peterfriese.de/formatting-your-code-using-the-eclipse-code-formatter/
   [10]: http://kate-editor.org/
   [11]: http://www.subethaedit.net/
   [12]: http://www.nano-editor.org/
