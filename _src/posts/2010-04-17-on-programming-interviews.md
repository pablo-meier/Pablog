    Title: On Programming Interviews
    Date:2010-04-17T11:19:00
    Tags: pablolife

Lots of great things have been written on the subject of programming interviews, 
but since I'll be entering the workforce very soon, I've taken
away a few notes on how I would like to conduct them in the future, having
just run the job search gauntlet.

Regarding phone screens, I learned a lot from [Steve Yegge's post][1] on his
process. To summarize, he believes the candidate should demonstrate some basic
proficiency and understanding in five areas to get the on-site: coding, OO
design, scripting/regexes, data structures, and binary. It's alright if the
candidate struggles a little, but if their answer to 'describe a function to
sort an array of integers' is 'Collections.sort(array),' you might want to
think twice about bringing them in.

Another advantage of living in 2010 is that we can actually see some code
during a phone screen: one interviewer had me use [EtherPad][2] while on the
phone with them, and I would probably do something similar.

More generally, diversity in the phone screen process will help you eliminate
candidates who can talk big in one or a few fields, but don't have (or can't
form) a more complete picture of what's going on.

If the candidate makes it to on-site, I would extend the diversity principle,
but probably ask a few questions not listed above (if they demonstrated that
they can write a regular expression in the phone screen, they don't need to
show me one on-site). Here you could look at another round of fun brain-
warpers that [Joel Spolsky points out:][3] pointers and recursion. I would
love to write out a few problems [as he has][4] that just show they can
read/write programs that use these techniques.

Brain teasers are a contested form in the interviews, but I love them too.
Well, good ones anyways. I would like a candidate who smiles when they know a
puzzle is headed their way. They would be very hintable, so I'm not
anticipating an 'aha!' moment. An example of one of these that I think would
rock, [comes from Skorks][5]:

> Write a [quine][6], in whatever language you like (for those who don't know, a
> quine is a program that prints its own source code without reading itself).

Now I've written about it, I probably wouldn't use it. A risk you run with any
type of programming question that is meant to challenge is that they've run
into it before, or researched the standard questions before arriving. While
there's nothing wrong with researching beforehand, you probably want to see
the candidate think, not just what they can remember. For this reason:

* **Pick nonstandard problems.** For coding samples, probably avoid direct
library functions, or anything [from here][7]. They should be simple, so maybe
library functions with a twist. A favorite of mine was "write a function that
takes a string, and returns whether the braces, brackets and parenthesis are
matched." Challenging, but appropriate, and more applicable to any job than
reversing a string.

* **Have backups.** One interviewer asked me what a good data structure
would be for the search function of an address book. Given that I'd just
finished the [Facebook Breathalyzer puzzle][8], we were finished with what
might have been twenty minutes of material in five.

A few more notes:

* **I personally don't like whiteboard coding.** I get nervous, can't
edit/iterate the function rapidly, and can't go at an appropriate speed. So
when my time comes, I might minimize that. Regardless, you can't be an actor
unless you audition, so it'll stay.

* **A short quiz, on paper, would probably be included.** This wouldn't be
multiple-choice or anything silly, just a block of code, and ask the candidate
to comment on all of its qualities.

The only flaw in my plan is, with all the material I've mentioned, I'd
probably need more than 45 minutes to get a feel for a candidate, and I doubt
I'd be given more than that at a time. I'll have to find a way to resolve this
^\_^


   [1]: http://sites.google.com/site/steveyegge2/five-essential-phone-screen-questions
   [2]: http://etherpad.com/
   [3]: http://www.joelonsoftware.com/articles/ThePerilsofJavaSchools.html
   [4]: http://www.joelonsoftware.com/articles/TestYourself.html
   [5]: http://www.skorks.com/2010/03/an-interview-question-that-prints-out-its-own-source-code-in-ruby/
   [6]: http://en.wikipedia.org/wiki/Quine_(computing)
   [7]: http://maxnoy.com/interviews.html
   [8]: http://www.facebook.com/careers/puzzles.php#!/careers/puzzles.php?puzzle_id=17
