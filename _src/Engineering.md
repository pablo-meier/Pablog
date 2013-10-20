# Engineering

I learned to write software at [Brown University's](http://www.brown.edu)
[Computer Science Department](http://cs.brown.edu) around 2008. I graduated in
2010, worked at Adobe Systems for about two years, and Google for one.

I'd say my interests are primarily in programming languages, though most of my
professional experience is in the mid-level application domain.

## Projects

All these projects are available on [my Github](https://github.com/paul-meier),
but here's for the descriptions/opinions that don't belong in the README.

### [ScrabbleCheat](https://github.com/paul-meier/ScrabbleCheat)
This is probably the coolest thing I've written, which wasn't the original plan.
I was playing Scrabble with my then girlfriend, and frustrated, stumbled out
something like "it's just -- I'm -- I feel like --"

"Oh, I know, you could write a program that would beat me in like a weekend,
right?"

"... actually, why not?"

Having written something like a spell-check bot (for Facebook's
[now-defunct](http://www.davideisenstat.com/fbpfaq/#rip-puzzle-robot)
engineering puzzles, problem spec reproduced
[here](http://xorswap.com/questions/150-facebook-engineering-puzzle-breathalyzer)),
I figured this would be pretty easy -- create anagrams from your rack using a
dictionary, then place the words onto the board. I'll use a weird language for
this. Hell, I'll use Erlang!

**Turns out, writing a decent bot for Scrabble is pretty hard.** As expected,
generating the anagrams from a rack was EZ, but then I scratched my head for
months on how to place words on the board. The problem explodes in complexity
once you realize you have to form legal words using letters currently on the
board as well.

The answer lies in a weird, custom data structure called a
[GADDAG](http://en.wikipedia.org/wiki/GADDAG) (fun fact! I created that Wikipedia
page on it!). It's a variation on a Trie that lets you look for words starting
from any point, rather than just the middle. This lets you traverse the board in
a slightly complex, but deterministic, way.

Along the way, I learned a **ton.** GADDAGS are memory-hungry, so I naively
implemented them using Erlang data structures. This was a mistake, causing
~300MB allocations if you were to mutate them (and an edge case required that I
did). Since it's essentially a read-only structure, I defined a compact binary
format for a GADDAG and wrote code on the Erlang side to interface with it. See
`code/server/lib/bingad` for a C program to generate a binary blob GADDAG from a
dictionary file, and `code/server/src/bin_tries.erl` for how we interface with
it. This shrunk the structure to ~30MB, without superflous allocations at
runtime.

I also learned about the Zen of Erlang. The first version of the program was
naked executions of BEAM files, and I later worked to use proper OTP principles.
Much of the codebase reeks of "Baby's First Erlang," but working through this
taught me exactly why the Erlang VM and the OTP libraries form such a fantastic
little environment.

I also wrote a Spaghettitacular Ruby client, using an ncurses library.

Altogether, **so** much fun.

### [Ebooker](https://github.com/paul-meier/Ebooker)

This is a simple Markov chain bot, taking in a Twitter username as input, and
posts tweets to an account where you have write access. There isn't much to this
one, but I _did_ write all my own OAuth code for access, which was buckets of
fun.

I wrote what was attempting to be an accessible post on Markov chains
[here](http://morepaul.com/2012/10/loving-yourself-with-ebooks.html).

For a higher-level engineering audience, the most interesting part is the OAuth,
since until you implement it yourself you can't really get a proper appreciation
for how it achieves it's goals of verifying access credentials without revealing
them to the third party. You also see the motivation for OAuth 2...

## Articles

Most of us are pretty jaded having been on Hacker News or /r/programming and
seeing a million "Why I switched to X" articles. That said, a few have really
shaped how I approach programming and the industry in particular.

* [Don't Call Yourself A Programmer, And Other Career Advice](http://www.kalzumeus.com/2011/10/28/dont-call-yourself-a-programmer/), by Patrick McKenzie. I was pretty bright-eyed and bushy-tailed as a college graduate, and I feel that this is a pretty no-nonsense look into what coding for industry can be like.
* [How many Microsoft employees does it take to change a lightbulb?](http://blogs.msdn.com/b/ericlippert/archive/2003/10/28/53298.aspx) by Eric Lippert. Another 'college is not industry' one, it expresses very clearly how challenging working for a BigCo can be. The [StarCraft](http://www.starcraft.com) community loves to tell Blizzard that they're lazy for not implementing X, which should take 10 minutes, and I always link them to this article.


