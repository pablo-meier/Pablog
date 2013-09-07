    Title: Common Lisp
    Date:2010-04-06T18:43:00
    Tags: pablolife, plt, engineering

I've been playing around with Common Lisp recently, using [Practical Common Lisp][1]
and [Let Over Lambda][2] as guides (not gonna lie, having LOL on the
spine of your book is wonderful). Last year when I went through my Scheme
phase (the original URL of this blog was littleschemer.blogspot.com), I never
thought I'd see the day that I'd switch sides.

<img src="/img/2010/04/iPhoneBackgroundSqueeze.jpg" alt="A big ole lambda" />

FWIW, this is my iPhone background image.

I do feel like a traitor though, since even though I'm a theory-head and
advocate of FP, **I'm loving Common Lisp.** There are a few reasons for this:

* Simpler macros. I'll bet some hardcore Schemers will disagree with me on this, but I feel that defmacro is much, much simpler to learn than syntax-case, and syntax-rules always leaves me wanting more. Maybe I'm deficient, but I took to defmacro immediately, whereas when I want to do anything non-trivial in Scheme, I feel myself always going back [to Dybvig's explanations][5], taking far longer than I'd like. <br /><br /> While in principle I'm for hygiene as the default, it's not too big an issue in practice. Hoyte gives a great little macro (one of the first in his book) that ensures you fresh variables whenever you want them, without even having to declare them!

* Language libraries. CL comes with every function you could ever want. It comes back to what Peter Norvig said in [Paradigms in Artificial Intelligence Programming][6] (paraphrasing): Scheme is one of the smallest languages to define (< 50 pages), whereas CL is one of the largest (> 1200 pages). <br /><br /> While some Schemes provide these, since they aren't part of the standard you aren't guaranteed anything across implementations. In fact, my favorite Scheme in terms of libraries (good ole' [PLT][7]) even broke across versions when they enforced module declarations at the top of every file. <br /><br /> Besides, once a Scheme gets these, [they stop wanting to be called Scheme][8].

This isn't to say its all peaches and cream: I still prefer Scheme's single
namespace over Common Lisp's, I prefer Scheme's naming conventions (map vs.
mapcar, or worse, loop for elem in list collecting). And issues with lambdas,
namely sharp-quoting and not being able to place functions in the function
position (especially after learning [the beauty of Scheme's semantics][9] so
well last semester) still throw me for a loop.

But after a year of mounting tension with the residents of [Shelbyville][10],
I realize they've got quite a bit right ^\_^.


   [1]: http://www.gigamonkeys.com/book/
   [2]: http://letoverlambda.com/
   [5]: http://www.scheme.com/tspl3/syntax.html#./syntax:h3
   [6]: http://norvig.com/paip.html
   [7]: http://www.plt-scheme.org/
   [8]: http://www.plt-racket.org/new-name.html
   [9]: http://redex.plt-scheme.org/
   [10]: http://en.wikipedia.org/wiki/Shelbyville_(The_Simpsons)
