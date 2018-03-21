    Title: 🐍 Python, classes, tuples
    Date: 2018-03-21T18:02:12
    Tags: engineering
    og_description: Resources I used to learn (and kind of enjoy) Python

<small><em>The song for this post is <a
href="https://www.youtube.com/watch?v=VUkl-oZljOo&index=13&list=PLlDSFdWOYJjxNQ8-V4lc4z2F1Mxj-uGQq&t=0s">Classical Thump</a>, by Victor Wooten.</em></small>

During my "learn as many languages as quickly as possible" phase, I never got to
Python. For most of its use cases I chose Ruby or Racket. But then I
started work at [Reonomy][1], built on [Flask][2]. Then I left to work at
[ClassPass][3], using [Pyramid][4] and Flask. Then I left to work at Lyft; my
team uses Flask. I couldn't get away with winging it anymore.

### Favorite resources

The lowest-effort thing I did was install [vim-flake8][5] and set it so I'd run
[PEP8][6] validations on Python. That way, even if my code was bad, it wasn't
_bad_ bad. With a lot of Googling for syntax and Stack Overflow answers, I was
producing code that structurally looked like Scheme (but with
way less function-mangling), or Ruby (with way fewer objects).

The next "big break" for Python-specific knowledge was literaly
called "Beyond PEP8." The full title was **Beyond PEP8: Best practices for
intelligible code,** by Raymond Hettinger:

<iframe width="560" height="315"
src="https://www.youtube-nocookie.com/embed/wf-BqAjZb8M?rel=0" frameborder="0"
allow="autoplay; encrypted-media" allowfullscreen></iframe>

It clearly demonstrated the Python aesthetic and how well it could work when it
does. In particular, I enjoyed the example of iterating on a block of Python
code that looked fine to my eye, and learning what assumptions from other
languages I was baking into it.

After that, one talk that _spoke to me_ was **Stop Writing Classes,** by Jack
Diederich, which I've watched many times and shared all around:

<iframe width="560" height="315"
src="https://www.youtube-nocookie.com/embed/o9pEzgHorH0?rel=0" frameborder="0"
allow="autoplay; encrypted-media" allowfullscreen></iframe>

By talk standards, it's short! But it showed me, again, something Python shines
at: many problems don't inherently need design patterns. This goes back to an
old narrative Peter Norvig surfaced, stating "Design patterns are bug reports
against your programming language" in [his presentation in 1998,][7] where he
showed many design patterns from languages like Java or C++ don't make sense in
languages like Common Lisp.

If I had to succinctly describe Python, it's a language that tries to
eliminate the need to use formal design patterns. This doesn't mean Python
programs don't have recipes or designs, just that the ones the language ships
with cover a large number of very common programming cases. Per the above video,
you absolutely can use objects, but there will be many cases when a function
will do, or tuples, or a dictionary.

These days, I tend to use a [namedtuples][8] for compound data, and [enums][9]
for sum types. I don't love that everything is effectively typed Optional, but
Python 3 has type annotations, and projects like [mypy][10] help as well. If
_absolutely_ necessary, I'll write with objects.

### Grinds my gears

I also enjoyed **How Python was shaped by leaky internals,** by Armin Ronacher:

<iframe width="560" height="315"
src="https://www.youtube-nocookie.com/embed/qCGofLIzX6g?rel=0" frameborder="0"
allow="autoplay; encrypted-media" allowfullscreen></iframe>

This is lovely, because sometimes you need to override or dig deep into some
Python internal to modify its existing behavior, or even understand the behavior
of your system. Ruby gets a lot of hate for monkey patching, but the secret is
Python lets you futz with its internals also, they just furrow their brows
more. With all that said, it does grind my gears how this can bite you.

Many of the things that people love about Python are also what makes it not
my favorite language: with one exception, most of my startup experiences were
after a company received funding, and the initial code was written by rockstars 
who'd burnt out, been purged, or got promoted to work on new shiny things, and I
had to maintain their codebase. Inevitably when I attribute specific
frustrations during these times to Python, folks say things like "you can write
shitty code in any language" or "a poor craftsman blames their tools" and I get
all that, but in 2018, the statement "guarantees help you reason about large
systems" shouldn't be controversial, and Python gives you few of them.

[Here's Khan Academy spending 2 months moving files around.][11] Think of how
many blog posts are written about companies moving from Python 2 to Python 3.
[2to3][12] and [six][13] and similar facilitate, but that it's still such a
challenge, this late in the game, with blessed tools, tells you _something_ about
how easy it is to reason about these codebases. Not all programs need to
have easily-understood behavior and correctness semantics! But it's something
I like, especially in roles that have me performing the code equivalent of 
[viscera cleanup detail.][14]

Oh, and I hate [GIL][15] and wish Python had a better story for concurrent and
parallel computations.

### All that said

I actually rather enjoy Python, especially on 3, especially with few
abstractions. I'd almost always prefer static types, but if you want to fly
without them, this is the one to beat (until I try Elixir, idk).

   [1]: https://www.reonomy.com
   [2]: http://flask.pocoo.org/
   [3]: https://classpass.com/
   [4]: https://trypyramid.com/
   [5]: https://github.com/nvie/vim-flake8
   [6]: https://www.python.org/dev/peps/pep-0008/
   [7]: http://norvig.com/design-patterns/
   [8]: https://docs.python.org/3/library/collections.html#collections.namedtuple
   [9]: https://docs.python.org/3/library/enum.html
   [10]: http://mypy-lang.org/
   [11]: http://engineering.khanacademy.org/posts/python-refactor-1.htm
   [12]: https://docs.python.org/3.1/library/2to3.html
   [13]: https://pythonhosted.org/six/
   [14]: http://www.runestorm.com/viscera
   [15]: https://wiki.python.org/moin/GlobalInterpreterLock
