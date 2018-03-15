# Engineering

I studied Computer Science software at [Brown University's Computer Science
Department](http://cs.brown.edu), starting around 2008 after some existential
angst, graduating in 2010.

I'd say my interests are primarily in programming languages, though most of my
professional experience is in the mid-level application domain, working on large
projects in Python, Java, and C++.

## Projects

### ScrabbleCheat

_Your neighborhood friendly Scrabble solver._

August 2010-2011. Erlang, Ruby, C. [GitHub](https://github.com/paul-meier/ScrabbleCheat)

---

This was my first major side project after graduating college. I wanted to write
a bot for Scrabble, and I wanted to learn Erlang. I did it! Here's how it breaks
down:

* The solver is in Erlang, lives [here][1], and speaks to clients via [Apache
  Thrift][2] (Facebook Thrift was big at the time).

* I wrote a terminal client using an [ncurses][3] library in Ruby, which lives
  [here][4].

* Finally, the data structure required was ~300MB when built with Erlang, so I
  designed a compact binary representation that I constructed in C. It lives
  [here][5].

It's actually pretty challenging to do this! Boggle is a common interview
puzzle, but Scrabble has a lot trickier constraints. The trick is to use a
variation of a Trie called a [GADDAG][6], a bizarre data structure more-or-less
invented for this kind of problem in 1995. I wrote the Wikipedia page for it!

### Ebooker

_Markov-chain Twitter bots_

Fall 2012. Go. [GitHub](https://github.com/paul-meier/Ebooker),
announcement/explanation [blog post.][9]

---

I was miserable at Google and thought I might find love if I joined a
programming language team. Issue is, I didn't actually know any Go. So I learned
by writing this!

Generating Markov chains is not particularly challenging in Go (it's literally
[one of their codewalks][7] to teach the language), but I learned a ton writing
[my own OAuth1 client for Twitter's API.][8]

### Fleaswallow

_Static site generator in OCaml._

January 2018. OCaml. [Github][10].

---

Baby's first OCaml project: I used to generate this site with [Frog][11], an
amazing site generator by the inimitable [Greg Hendershott][12], but decided I
wanted a few other features (like adding [OpenGraph][13] tags per-post) and/or a
different templating model.

I started hacking and kept waiting for my sense to catch up to me; it never did
and I finished!

### Invisible Thief

_A [Whitespace][15] interpreter in [Racket][16]._

August 2012. Racket. [GitHub][14].

---

Did I mention I was miserable at Google? I was miserable at Google.

The daily commute had me on a Google Bus for ~4 hours every day where I couldn't
work on company code: you _must_ tunnel into their machines (no company code in
your laptop), my team's project was in Java and needed a graphical environment
like Eclipse, and I was competing with ~80 other Googlers to use the bus Wi-Fi.
It wasn't conducive to tunneling a full X session.

So I read two blog posts (one on [creating languages in Racket][17] and one on
[Racket macros][18]) and got to work on building a silly language interpreter.

### Advent of Code 2016

_22 languages in as many days._

December 2016. [GitHub][19]. Features Standard ML, Factor, Racket, Ruby, Go, C,
Prolog, Haskell, Erlang, C++, Common Lisp, Rust, Python, Java, JavaScript, Pyret,
Scala, Elixir, Mercury, Clojure, Lua, Awk, SQL.

---

I challenged myself to do [Advent of Code][20] every day in a new language.
There were 25 days, I got through about 20 to completion, with half-solutions to
another 3 or 4.

### Ghostlight

_IMDb for live performance web app (or most of it, anyways)._

Summer 2015. [GitHub][21]. Erlang, Postgres.

---

I wanted to write a Real App that interested me, and I've always liked the idea
of something like IMDb for live performance and theater. I got pretty far and
modelling the data was super fun, but then I had a tough breakup, put it down,
and haven't picked it up again. Learned a lot about Erlang, and using odd tech
for products.

### PizzaHutTacoBell

_Plugins for StarCraft Streaming._

Fall 2011, [GitHub][22]. Java, ActionScript 3

---

Around when Twitch.tv was rebranded from Justin.tv and StarCraft streaming was
starting to boom, I wanted my stream to have some features like post-game stats.
The most popular streaming software at the time (XSplit) allowed for
ActionScript plugins, and a StarCraft replay tool allowed for Java plugins, so
I wrote two plugins (Pizza Hut and Taco Bell) which communicated over a socket
to provide and display stats.

This was also a way to Get Involved in my company's product: I was working on
the Flash Runtime, and felt like I wasn't engaging the customer enough since I
wasn't a Flash developer, so I built this entirely with our open-source
ActionScript tools.

## Favorite Articles

Most of us are pretty jaded having been on Hacker News or /r/programming and
seeing a million "Why I switched to X" articles. That said, a few have really
shaped how I approach programming in industry.

* [Don't Call Yourself A Programmer, And Other Career Advice][23], by Patrick
  McKenzie. I was pretty bright-eyed and bushy-tailed as a college graduate, and
  I feel that this is a pretty no-nonsense look into what coding for industry
  can be like.
* [How many Microsoft employees does it take to change a lightbulb?][24] by Eric
  Lippert. Another 'college is not industry' one, it expresses very clearly how
  challenging working for a BigCo can be. User communities loves telling
  software publishers that they're lazy for not implementing X, which should
  take 10 minutes, and I always link them to this article.
* Tough Times on the Road to StarCraft, Parts [1][25], [2][26], and [3][27]. All
  of Patrick Wyatt's articles on game development from that time at Blizzard are
  pretty amazing.
* [A Generation Lost in the Bazaar][28], by Poul-Henning Kamp.  I don't care
  that 'Worse is Better' won the macro game, we should all still care about
  quality in the micro game.
* [Don’t waste your time in crappy startup jobs.][29], by Michael O. Church. The
  story of working in startups is multifaceted (it turned my career around), but
  never let anyone sell you on one with lies.
  

   [1]: https://github.com/pablo-meier/ScrabbleCheat/tree/master/code/server
   [2]: https://thrift.apache.org/
   [3]: https://en.wikipedia.org/wiki/Ncurses
   [4]: https://github.com/pablo-meier/ScrabbleCheat/tree/master/code/clients/curses
   [5]: https://github.com/pablo-meier/ScrabbleCheat/tree/master/code/server/lib/bingad
   [6]: https://en.wikipedia.org/wiki/GADDAG
   [7]: https://golang.org/doc/codewalk/markov/
   [8]: https://github.com/pablo-meier/Ebooker/blob/master/src/ebooker/oauth1/oauth1.go
   [9]: /2012/10/loving-yourself-with-ebooks.html
   [10]: https://github.com/pablo-meier/fleaswallow
   [11]: https://github.com/greghendershott/frog
   [12]: http://www.greghendershott.com/About.html
   [13]: http://ogp.me/
   [14]: https://github.com/pablo-meier/Invisible-Thief
   [15]: https://en.wikipedia.org/wiki/Whitespace_(programming_language)
   [16]: https://racket-lang.org/
   [17]: https://www.hashcollision.org/brainfudge/
   [18]: http://www.greghendershott.com/fear-of-macros/
   [19]: https://github.com/pablo-meier/advent-of-code
   [20]: https://adventofcode.com/2017/about
   [21]: https://github.com/pablo-meier/ghostlight
   [22]: https://github.com/pablo-meier/PizzaHutTacoBell
   [23]: http://www.kalzumeus.com/2011/10/28/dont-call-yourself-a-programmer/
   [24]: http://blogs.msdn.com/b/ericlippert/archive/2003/10/28/53298.aspx
   [25]: http://www.codeofhonor.com/blog/tough-times-on-the-road-to-starcraft
   [26]: http://www.codeofhonor.com/blog/avoiding-game-crashes-related-to-linked-lists
   [27]: http://www.codeofhonor.com/blog/the-starcraft-path-finding-hack
   [28]: http://queue.acm.org/detail.cfm?id=2349257
   [29]: https://michaelochurch.wordpress.com/2012/07/08/dont-waste-your-time-in-crappy-startup-jobs/
