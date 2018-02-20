    Title: Advent of Code 2016
    Date:2016-12-29T23:34:00
    Tags: pablolife, engineering

A co-worker linked a few of us to [Advent of Code][1], a coding challenge that
released a new puzzle every day for December, leading to the 25th.

[I participated][2] as best I could, with a twist: try to write every day's
solution in a different programming language. I didn't finish (some explanation
follows), but I'm proud of my entries. The list of languages is:

<!-- more -->

* [Day 1](https://github.com/pablo-meier/advent-of-code/tree/master/day1): Standard ML ([impl](http://mlton.org/), [description](https://en.wikipedia.org/wiki/Standard_ML))
* [Day 2](https://github.com/pablo-meier/advent-of-code/tree/master/day2): Factor ([impl](http://factorcode.org/), [description](https://en.wikipedia.org/wiki/Factor_(programming_language))
* [Day 3](https://github.com/pablo-meier/advent-of-code/tree/master/day3): Racket ([impl](http://racket-lang.org/), [description](https://en.wikipedia.org/wiki/Racket_(programming_language)))
* [Day 4](https://github.com/pablo-meier/advent-of-code/tree/master/day4): Ruby ([impl](https://www.ruby-lang.org/en/), [description](https://en.wikipedia.org/wiki/Ruby_(programming_language)))
* [Day 5](https://github.com/pablo-meier/advent-of-code/tree/master/day5): Go ([impl](https://golang.org/), [description](https://en.wikipedia.org/wiki/Go_(programming_language)))
* [Day 6](https://github.com/pablo-meier/advent-of-code/tree/master/day6): C ([impl](http://clang.llvm.org/), [description](https://en.wikipedia.org/wiki/C_(programming_language)))
* [Day 7](https://github.com/pablo-meier/advent-of-code/tree/master/day7): Prolog ([impl](http://www.swi-prolog.org/), [description](https://en.wikipedia.org/wiki/Prolog))
* [Day 8](https://github.com/pablo-meier/advent-of-code/tree/master/day8): Haskell ([impl](https://www.haskell.org/platform/), [description](https://en.wikipedia.org/wiki/Haskell_(programming_language)))
* [Day 9](https://github.com/pablo-meier/advent-of-code/tree/master/day9): Erlang ([impl](https://www.erlang.org/), [description](https://en.wikipedia.org/wiki/Erlang_(programming_language))))
* [Day 10](https://github.com/pablo-meier/advent-of-code/tree/master/day10): C++ ([impl](http://clang.llvm.org/), [description](https://en.wikipedia.org/wiki/C%2B%2B))
* [Day 11](https://github.com/pablo-meier/advent-of-code/tree/master/day11): Common Lisp ([impl](http://www.sbcl.org), [description](https://en.wikipedia.org/wiki/Common_Lisp))
* [Day 12](https://github.com/pablo-meier/advent-of-code/tree/master/day12): Rust ([impl](https://www.rust-lang.org), [description](https://en.wikipedia.org/wiki/Rust_(programming_language)))
* [Day 13](https://github.com/pablo-meier/advent-of-code/tree/master/day13): Python ([impl](https://www.python.org/), [description](https://en.wikipedia.org/wiki/Python_(programming_language))))
* [Day 14](https://github.com/pablo-meier/advent-of-code/tree/master/day14): Java ([impl](https://www.java.com/en/), [description](https://en.wikipedia.org/wiki/Java_(programming_language)))
* [Day 15](https://github.com/pablo-meier/advent-of-code/tree/master/day15): JavaScript ([impl](https://nodejs.org/en/), [description](https://en.wikipedia.org/wiki/JavaScript))
* [Day 16](https://github.com/pablo-meier/advent-of-code/tree/master/day16): Pyret ([website](https://www.pyret.org/)) and OCaml ([impl](http://www.ocaml.org/)), [description](https://en.wikipedia.org/wiki/OCaml))
* [Day 17](https://github.com/pablo-meier/advent-of-code/tree/master/day17): Scala ([impl](https://www.scala-lang.org/)), [description](https://en.wikipedia.org/wiki/Scala_(programming_language)))
* [Day 18](https://github.com/pablo-meier/advent-of-code/tree/master/day18): Elixir ([impl](http://elixir-lang.org), [description](https://en.wikipedia.org/wiki/Elixir_(programming_language)))
* [Day 19](https://github.com/pablo-meier/advent-of-code/tree/master/day19): Mercury ([impl](https://mercurylang.org), [description](https://en.wikipedia.org/wiki/Mercury_(programming_language))))
* [Day 20](https://github.com/pablo-meier/advent-of-code/tree/master/day20): Clojure ([impl](https://clojure.org/), [description](https://en.wikipedia.org/wiki/Clojure)) 
* [Day 21](https://github.com/pablo-meier/advent-of-code/tree/master/day21): Lua ([impl](https://www.lua.org/), [description](https://en.wikipedia.org/wiki/Lua_(programming_language)))
* [Day 22](https://github.com/pablo-meier/advent-of-code/tree/master/day22): Awk preprocessing + SQL.

Some things left to do:

* Finish the challenges. I'm missing Part 2 on Days 19 and 22, and all of days
  23, 24, and 25.

* Clean up the challenges. Originally I'd hoped to always use file input rather
  than hard-code some inputs, but that went by the wayside. Furthermore, I think
  it'd be fun to see how I can make certain solutions more idiomatic.

* Clean up the READMEs. Most of them have the problem statement, but many are
  missing inputs, and all are missing Part 2.

* **Ambitiously**, follow-up with _Advent of Blog! The Musical!_, wherein I
  write a post about the language I used, some Pablo opinions, things I learned,
  the choices I made, etc.

### Did you learn anything new?

Tons! And I'll hopefully blog about those in the future. Here are a few:

**You can write Scheme in any language!** I learned that the most powerful
influence on my general programming style were those library nights with books
like [_The Little Schemer_][6], [_Structure and Interpretation of Computer
Programs_][7], and [_Programming Languages: Application and Interpretation._][8]

Most of my code:

* Prefers immutability
* Relies on returning values rather than producing effects
* Frequently relies on recursion

and jumping between SML, OCaml, Haskell, Racket, Clojure, and even Erlang hardly
felt like I was using different languages at all.

**Logic programming is a lot more fun than I remember it.** I've played with
Prolog before, but had an absolute blast using it here. Ditto Mercury.

**Wow it's nice working with popular languages.** When you have a bug in your
Mercury or Factor code, you're a bit SOL. It was refreshing getting to, like,
_debug_ again, since you couldn't rely on StackOverflow.

### Miscellanea

**Languages I used for the very first time:** Factor, Pyret, OCaml, Elixir,
Mercury, Lua.

**Languages I've used before _technically_ but only on toy projects, like
this:** SML, Ruby, Prolog, Common Lisp, Rust, Scala, Clojure.

**How did this stack up to other programmer puzzle challenges?** For reference,
I did about 70 problems on [Project Euler][3] back in undergrad. These are a
fair bit easier: past the first 15-20 problems, PE tended to rely on you having
some kind of mathematical or problem-domain insight to massively reduce the
search space. These are far simpler: you can usually just throw the most
straightforward algorithm at a problem, and that is usually brute-force.

My other big experience was the old [Facebook programming puzzles][4] they'd use
for hiring (also described [here][5]), which tended to be more algorithmic
(graph construction/traversal, clever trees, and dynamic programming were
popular in those). Few of these required anything quite like that.

### With that

More to come, I hope! 😛

   [1]: https://adventofcode.com/
   [2]: https://github.com/pablo-meier/advent-of-code
   [3]: https://projecteuler.net/
   [4]: https://www.facebook.com/notes/facebook/solving-puzzles-a-facebook-tradition/43473182130/
   [5]: http://www.davideisenstat.com/fbpfaq/
   [6]: https://mitpress.mit.edu/books/little-schemer
   [7]: https://mitpress.mit.edu/sicp/
   [8]: http://cs.brown.edu/~sk/Publications/Books/ProgLangs/
