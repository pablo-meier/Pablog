    Title: The Road to Lisp Survey
    Date:2010-11-13T14:57:00
    Tags: pablolife

I, Paul Meier, do solemnly offer these responses to
[the Road to Lisp Survey][1]:

**When did you first try Lisp (meaning here and throughout the survey "any
member of the Lisp family") seriously, and which Lisp family member was it?**


I took Lisp seriously after my first exposure to it, in [Shriram
Krishnamurthi][2]'s [programming languages course][3], based on his [excellent
book, PLAI][4] (download it! it's free!). We mostly used Scheme for the course
(the implementation now called [Racket][5]), and while I could call the
programming from that class my first exposure, I really only explored it
during self-study after the course.


In the Preface to his book, Shriram mentioned _[The Little Schemer][6]_ as a
good introduction to thinking in Scheme. In the Acknowledgments, he said
"Please read those magnificent books even if you never read this one" of two
books, one of them being _[Structure and Interpretation of Computer
Programs.][7]_ I picked them both up that Winter, and I was hooked.


**What led you to try Lisp?**


The answer is really in the next question, but I'll also mention that this was
not just my first exposure to Lisp, but functional programming as a whole.
While I enjoyed programming to a point, what really interested me in Computer
Science was the strong theoretical results we'd achieved: the fact that we
could prove undecidability kept me awake for weeks.


So part of my migration to Lisp wasn't just to homoiconic syntax and dynamic
type systems: it was also the wonders of functional programming I would find
prominently in Scheme.


**If you were trying Lisp out of unhappiness with another language, what was
that other language and what did you not like about it, or what were you
hoping to find different in Lisp?**


I took the languages course at the same time I took [our excellent graphics
course,][8] where we used C++. I found I spent much, much longer debugging the
C++ programs, for a much less interesting class of bugs. You'd pull your hair
out, looking at memory addresses and pointer values only to find you did your
pointer arithmetic wrong (we were investigating a two-dimensional matrix
stored as a linear array), or that a state change occurring in an edge case
was leaving your program in an inconsistent state. It was frustrating, to say
the least.


In Scheme, I was only fixing logical bugs. I spent more time [thinking than
typing][9]. My programs were shorter and elegant. It's as if, by framing the
problem differently, hundreds of edge cases and corner cases _simply ceased to
exist_.


And there's something to that. Removing state means putting a lot more effort
up front, but ultimately makes your programs worlds easier to write and
maintain after you've invested. Not to mention spending your brain cycles
_modeling_ is worlds more fun spending them _debugging_.


Of course, I didn't know that back then; I moved because I just had the
feeling they were doing something right, and I could learn something valuable.


**How far have you gotten in your study of Lisp? (I know, that is hard to
measure)**


This is very hard to say. In many ways, I'm still a novice, since most of my
Lisping doesn't take full advantage of macros, Lisp's crown jewel. I'm still
much more comfortable in Scheme than CL, Clojure, or Arc; I'd call myself a
competent Lisp programmer having written a few small programs and baby
scripts, with a toe in advanced and a longing to go expert.


**What do you think of Lisp so far?**


I think it's still a very advanced, progressive way to approach programming,
at least with smaller engineering teams. I'm completely unsurprised it's not
used in industry as much; it's a large investment, and languages rely heavily
on community. Incidentally, I feel the only real rival to Lisp in caliber
would be Haskell, who's unofficial motto is "avoid success at all costs." ^_^


-


Also, any of you see [atomo][10]? It looks pretty hip, if ambitious...


   [1]: http://www.cliki.net/The Road to Lisp Survey

   [2]: http://cs.brown.edu/people/sk/

   [3]: http://cs.brown.edu/courses/cs173/

   [4]: http://cs.brown.edu/people/sk/Publications/Books/ProgLangs/2007-04-26/

   [5]: http://racket-lang.org/

   [6]: http://www.ccs.neu.edu/home/matthias/BTLS/

   [7]: http://mitpress.mit.edu/sicp/

   [8]: http://cs.brown.edu/courses/cs123

   [9]: http://blogs.law.harvard.edu/philg/2005/03/07/how-long-is-the-average-internet-discussion-forum-posting/

   [10]: http://atomo-lang.org/

