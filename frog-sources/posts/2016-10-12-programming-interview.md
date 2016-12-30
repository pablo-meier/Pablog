    Title: Observations after another go-round of tech interviewing
    Date:2016-10-12T12:34:00
    Tags: pablolife, engineering

Ha! So I'm leaving Reonomy. Not what I thought I'd write after the way [that
last post][29] ended. But we muster the most hope when it's most desperately
needed, and I was needing it then.

This means, hopefully for the last time, I went through the famed Tech Interview
Experience again. Here are some findings and reactions; most of this is old hat
for anyone with the ear to the ground, but hopefully someone finds this
interesting.

<video src="/img/2016/10/skeletor_exit.webm" loop="true" autoplay="true" />

<!-- more -->

## "Hopefully for the last time"?

There's a great passage in a favorite essay [_"Don't Call Yourself A Programmer,
And Other Career Advice"_][1]:

> **"Read ad. Send in resume. Go to job interview. Receive offer.” is the
> exception, not the typical case, for getting employment:** Most jobs are never
> available publicly, just like most worthwhile candidates are not available
> publicly (see [here][2]). Information about the position travels at approximately
> the speed of beer, sometimes lubricated by email. The decisionmaker at a
> company knows he needs someone. He tells his friends and business contacts.
> One of them knows someone — family, a roommate from college, someone they met
> at a conference, an ex-colleague, whatever. Introductions are made, a meeting
> happens, and they achieve agreement in principle on the job offer. Then the
> resume/HR department/formal offer dance comes about.

Perusing my public code, I've written [C code to build an obscure data structure
in a custom binary protocol][3], [Erlang code to read it][4] and [subsequently
play Scrabble with it][5], and [a terminal client in Ruby that wraps ncurses][6]
to interface with it. I've written [Go code to do OAuth on the Twitter API
without a library][7]. Most of that was done ~3-5 years ago, more recently I
wrote [a web app in Erlang][8].

And while I try to be humble, if I'm being honest it's hard to come out of the
last two startups I've had and feel anything other than that I was one of the
most effective and impactful engineers there. I wrote [the API backend that
powered two products][9], and for the previous gig I wrote 2.5 Android apps,
each in about 4-5 weeks ([1][10], [2][11], [3][12]).

So while I understand employers need to protect themselves and [too many
applicants can't program _anything_][13], it still feels pretty demeaning to
have to log into CoderPad and have someone ask me to write a function to
flatten a list while they watch, then get rejected because I had shaky fingers
hiding from a current employer at a Starbucks, or because I burned 15 minutes
because that was when I got bitten [that Ruby `puts` does something different
when you feed it an array][15] or somesuch.

So a personal goal of mine: for gigs after this one, either [start my own
company][14], or have built a network (and subsequently leverage it) to keep
these shenanigans to a minimum, because they are shenanigans.

## Observations

There is an **extremely high correlation** to anyone who looked up my work
before an interview and getting an offer. Anytime someone indicates to me that
they read a blog post of mine and/or clicked any of the above links into my
work, they almost always extend an offer.

Similarly, **there's never been a time when I was allowed to describe
[ScrabbleCheat][25] and not be offered a job after that.** That 6 year-old
project was a hell of an investment.

(the above two means that I get a little sad and frustrated when a company I
have interest in send me people who don't look into my work or let me show them
myself, since the probability of getting an offer after that dips to lower
levels).

**The most dangerous part (maybe generally, but I can say definitively for me)
is the phone screen.** By virtue of being on the phone, neither side is able to
make themselves too human to the other. My biggest issue with this is that I
think phone screens are misapplied: companies try to make them full-blown
programming tests rather than, well, simple screens to weed out non-programmers.
You're almost always asked to write an extremely artificial problem (usually
some standard library function like [flatten][16] or an LRU cache) or something
with a minor trick in it (interval coalescing in an array of arrays) in some
shared coding environment. The candidate has to "think out loud" while they do
it, and the interviewer watches them, often bored for most of it.

My favorite treatment of this is [the approach Steve Yegge outlined years
ago:][17] be specific about a few areas you want to test, then test for a
_complete vacuum_ there, everything else is a pass. In his example:

* Can the candidate write syntactically valid code? FizzBuzz is just fine here,
  or even "write a function that returns the highest number in an array."

* Can the candidate speak intelligently about Object-Oriented Design? Naturally
  this may not apply to your firm if you're a Haskell shop or something, but
  then look for other "building blocks," like function composition.

* Does this candidate know the _basics_ of most data structures? Trees, lists,
  vectors, hashes…

* Does the candidate know about regexes, scripts, and command-line tools?

He adds a section on binary, I think that matters less for most application
programmers: other domains will want to check for that.

In short: your main duty is to ensure that you're not sending up a one-trick
pony, a cultural wasteland, or someone who can only talk about code at extremely
high levels but can't really produce it. After you've established that the
person knows enough to write code in a more comfortable environment, check more
rigorously for the strength you're looking for during onsites.

## Smarter people than me on this topic

* Cate Huston's [_How I Interview_][18] is pretty fabulous, as is her [_Things
  You Don't Learn In Technical Interviews_][19]. She also wrote [_this essay for
  Model View Culture_][20]. She's one of my favorite people to blog on tech and
  the industry, and hiring is no exception.

* I think diversity matters. Most Engineering teams are terrible at it. Carlos
  Bueno has written wonderfully about it on [_Inside the Mirrortocracy_][21] and
  [_Refactoring the Mirrortocracy_][22].

* Ann Harter [wrote and expanded on][24] a fabulous series of tweets on how to
  _engineer_ a tech interview using SCIENCE. Most processes are cargo-culted
  from what Big Companies do or what we ourselves have been subjected to,
  without much critical examination; it's especially jarring when tiny startups
  that build boring apps _insist!_ you hire someone who can write code fit for a
  space shuttle.<br /><br /><small>Pssst… past a certain point, the writing of
  your code is probably not what the success of your business hinges on.</small>

* Peter Seibel, likely inspired by the above bullet point, published a Gist of
  [what he wants in a candidate.][23] If you're looking to hire: on which do you
  agree? Is your process hitting some/any of those points? How?

* An excellent treatment of mistakes made during phone screens by Jocelyn
  Goldfein is [here][26].

* I find a lot to like in Dan Luu's [_Developer hiring and the market for
  lemons_][27] and [_We only hire the best means we only hire the
  trendiest_][28].

## So… what's next, Pablo?

Why, [ClassPass][30]! Thanks for asking, imaginary Pablo!

   [1]: http://www.kalzumeus.com/2011/10/28/dont-call-yourself-a-programmer/
   [2]: http://www.joelonsoftware.com/articles/FindingGreatDevelopers.html
   [3]: https://github.com/pablo-meier/ScrabbleCheat/tree/master/code/server/lib/bingad
   [4]: https://github.com/pablo-meier/ScrabbleCheat/blob/master/code/server/src/bin_trie.erl
   [5]: https://github.com/pablo-meier/ScrabbleCheat/blob/master/code/server/src/movesearch.erl
   [6]: https://github.com/pablo-meier/ScrabbleCheat/tree/master/code/clients/curses
   [7]: https://github.com/pablo-meier/Ebooker/blob/master/src/ebooker/oauth1/oauth1.go
   [8]: https://github.com/pablo-meier/ghostlight
   [9]: https://morepablo.com/2016/01/dropwizard-rollbar.html
   [10]: https://morepablo.com/2014/12/tech-of-sup-android.html
   [11]: https://morepablo.com/2014/12/tech-of-sup-android-libraries.html
   [12]: https://morepablo.com/2014/12/tech-of-sup-android-misc.html
   [13]: https://blog.codinghorror.com/why-cant-programmers-program/
   [14]: https://morepablo.com/2016/08/business-i-might-build.html
   [15]: http://ruby-doc.org/core-2.2.2/IO.html#method-i-puts
   [16]: http://erlang.org/doc/man/lists.html#flatten-1
   [17]: https://sites.google.com/site/steveyegge2/five-essential-phone-screen-questions
   [18]: http://www.catehuston.com/blog/2015/04/01/how-i-interview/
   [19]: http://www.catehuston.com/blog/2015/07/15/things-you-dont-learn-in-technical-interviews/
   [20]: https://modelviewculture.com/pieces/we-hire-the-best
   [21]: http://carlos.bueno.org/2014/06/mirrortocracy.html
   [22]: http://carlos.bueno.org/2014/06/refactoring.html
   [23]: https://gist.github.com/gigamonkey/359e35c36770ca6e9a0c
   [24]: https://storify.com/anyharder/disrupttechinterviews-using-psych-methods-maybe
   [25]: https://github.com/pablo-meier/ScrabbleCheat
   [26]: https://jocelyngoldfein.com/screening-youre-doing-it-wrong-70de1f797c1c#.t7kz0tyie
   [27]: http://danluu.com/hiring-lemons/
   [28]: https://danluu.com/programmer-moneyball/
   [29]: https://morepablo.com/2016/08/six-months-of-managing.html
   [30]: https://classpass.com
