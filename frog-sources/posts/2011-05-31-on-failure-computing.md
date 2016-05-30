    Title: On Failure (Computing)
    Date:2011-05-31T12:00:00
    Tags: pablolife, plt, engineering


While I'd also like to speak of [personal failures][1] today, I've been thinking
a lot more about system failure.

<!-- more -->

Alan Perlis famously wrote that you shouldn't bother to learn a programming
language unless it changes the way you think about programming, and Erlang
delivers in spades.  Almost a year in\* to [ScrabbleCheat][2], only now do I
feel like I'm understanding the value (and love) of Erlang. Namely, what it
means to write _dependable software_.

Another blog post said it best: _["Erlang is about building reliable
systems."][3]_  Singling it out to concurrency, or distributed systems, or
hot-code loading, or simply for it's functional nature is _missing the point._

It's not immediately obvious: the most used and referred-to book for
newcomers trying Erlang is Joe Armstrong's [Programming Erlang][4]. This was my
first book learning Erlang, and while it has a great tone and expresses many of
the introductory concepts clearly, it sadly seems a bit out of date, and has
it's priorities in the wrong order.  If you only read the first 200-300 pages,
you come out not knowing exactly how big a deal the OTP is.

As an example, an entire chapter on using Makefiles to build your code is
probably unnecessary: any developer worth their salt knows enough about
Makefiles to compose shell commands, and that's essentially all he demonstrates.

I don't mean to be too hard on it, but here are some tips/resources for those
interested in exploring Erlang:

* [Learn You Some Erlang][5] is an excellent, excellent introduction. It starts
  slowly with the language, but always gives you context of how Erlang fits with
  other programming models, simple but direct writing, common pitfalls, and even
  "Don't drink the Kool-Aid" sections where he brings Erlang away from the hype
  and back down to Earth.  And while the language sections are fine enough, the
  OTP chapters near the end have you understanding exactly why gen\_server and
  gen\_event are the way they are.

* [Erlang and the OTP in Action][6] is another good choice, though un-free.
  They walk you through generating an Erlang release by hand with the default
  tools, which is good to do at least once or twice. They also have an excellent
  focus on the OTP, though with more emphasis on it's practical use in
  production applications rather than the important ideas behind it. If you feel
  like you want to buy and work through something to understand Erlang, I would
  recommend this.

* [Rebar][7] as a build tool.  It's lean, it usually does just what you want it
  to, and the source code is embarassingly clear and easy to read if it doesn't.
  The mailing list is friendly, and it's easily extensible. _Much_ better than
  raw Makefiles.

* Get to learn the tools: [Appmon][9], [Dialyzer][10], [Common Test][11], and
  others. It'll boost your productivity, and give you a sense of confidence you
  won't get often.

You'll never really love the language until you design a proper application with
OTP. While _every_ book/tutorial wants you to write a chat server, I rather
enjoy optimization problems, like ScrabbleCheat.

Back to failure: after programming in Erlang, I feel naked in other languages
without supervisors and trap\_exits. Lack of proper Actors means distribution
(and therefore fault-tolerance) is a chore, never mind the concurrency benefit.
Erlang has been a dream to play with, and I would recommend you do a hobby
project or two in it ^_^

\*= Madly Brilliant and I joke about the fact that I've been working on this for
so long.  Really, it's been about a year since the initial commit, where I
implemented trie using [gb\_trees][7], way before I had even heard of a
[GADDAG][8]. While I like to say "a year in" to make it sound like a major
commitment, I've sadly only gotten to work on this very rarely. Were I someone
who hadn't just moved into a city and started my first job while maintaining an
overseas-then-cohabitating relationship, I would call this 2-3 months of real
work.

   [1]: http://morepablo.com/2011/05/on-failure-personal.html
   [2]: http://github.com/paul-meier/ScrabbleCheat
   [3]: http://www.javalimit.com/2011/05/erlang-is-not-a-concurrent-functional-programming-language.html
   [4]: http://pragprog.com/book/jaerlang/programming-erlang
   [5]: http://learnyousomeerlang.com/
   [6]: http://www.manning.com/logan/
   [7]: http://alancastro.org/2010/05/01/erlang-application-management-with-rebar.html
   [8]: http://en.wikipedia.org/wiki/GADDAG
   [9]: http://www.erlang.org/doc/apps/appmon/appmon_chapter.html
   [10]: http://www.erlang.org/doc/man/dialyzer.html
   [11]: http://www.erlang.org/doc/apps/common_test/basics_chapter.html

