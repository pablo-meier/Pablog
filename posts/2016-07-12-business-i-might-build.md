    Title: Businesses I don't hate the idea of building
    Date: 2016-08-18T19:24:00
    Tags: biz, pablolife

I referred previously to the desire to maybe build my own business one day, and
here are two ideas that I don't entirely hate (which, if you know me, is a rare
thing).

<!-- more -->

## Motivation — Why do you, Pablo, want to found a company?

Let's be clear on a few things: I don't consider myself particularly
entrepreneurial. I've met many people who get _fired up_ at the thought of
starting a business. This has never, ever been me.

I don't particularly love risk (except for student loans, I've never been in any
debt). I'm pretty quick to shoot down ideas. Almost every major social problem I
hate dearly has a pretty thick line pointing back to capitalism.

So why is this where I'm headed? **Anger, mostly.** I've become pretty convinced
that we won't see the overthrow of US-style capitalism into a more fair system
in this lifetime. Even if I made achieving this my main objective, I don't have
the skills, patience, or background to be a particularly effective activist
(private school + Ivy League college positions me as [an excellent sheep][2]).

My background doesn't position me well to understand or substantively withstand
structural hardship of any serious degree. I have [my][3] [traumas,][4] sure,
but that's hardly comparable to the massive scale of structural issues. But! My
background _does_ position me well to play this game.

So given that I don't really have much of a choice to play this game, why lose
it? Corollary: if _some_ group of people have to win this game, do I trust
myself or The Usual Suspects more in that group? Rather than complain about the
Koch brothers, why not _be_ the Koch brothers?<sup><a href="#fn1" id="ref1">1</a></sup>

Every bone in my body feels pretty repulsed by wearing sharkskin and chasing the
same silly shit People Who Bother Me do, but like Pascal's Wager, the
alternative of [continuing to get exploited by cruel people way stupider than
me][5] is a fair bit worse. And hey, if I win, suddently _I_ have some of that
power that I see everyone else abusing mercilessly. Surely I could resist
temptation and not become the kind of fuckup I hate, amirite?!

On a more micro level: even if I labor for someone else, most companies don't
have cultures (on issues of inclusivity, fairness of compensation, etc.) that I
would find sufficiently good anyway. Better than searching for that from someone
else, by playing this game, I could create it.

So after years working for companies that clearly relied on me for their success
while owning none of them, years of working for companies that had cultures
ranging from barely acceptable to downright shitty, and the promise of years
more of _that_, I think I'll bite the bullet and play this shitty game.

## Enough of that: what will you build?

I have two ideas I like, one way more possible than the other. In my very
miniscule business understanding, there are two ends of a spectrum: attack a
crowded market where there very much _is_ a market (David vs. Goliath style,
trying to outmaneuver established players, eventually make them irrelevant) vs.
be a first-mover in an unexplored space, risk nobody wanting to pay for it.

The first tends to be easier to build (solved problems) but you have trouble
going against the Big Muscle of the established players, particularly on Sales &
Marketing, and particularly because people are slow to change their habits. The
second has trouble building a product for which there isn't really a market yet;
usually, the founder built their company around a made up a problem that didn't
really exist (or alternatively, couldn't convince people that the problem was
worth paying to solve).

My two ideas fall in along those lines:

### ProngFork, or, "I will kill you, MindBody"

Virtually every gym I know uses [MindBody][6] to manage their classes. Everyone
I speak to hates it. Some of the reasons it's an attractive target:

* The software isn't _hard problems._\* While dates, times, permissions, and
  other features needed to build such a system have tons of edge cases, it's not
  like we're re-inventing networking or asking the world to join a
  cryptocurrency.

* There's obviously a market: MindBody hit [$100M][9] in revenue last year.

* Global possibility. There are gyms/yoga studios/masseuses in Guatemala,
  Sydney, Jakarta, Peru…

[I'm not the first][7] to think of upending them: many of those replies go back
to 2012 or 2011. Seeing this is the equivalent to walking by a bunch of
skeletons on the way to fight the dragon: they weren't put there for decoration,
those were _people_ who thought, as you do right now, that they can take it
down. Now, they're a skeleton, and you're [ignoring the warning.][11]

\*= Note that building correct, dependable, performant, useful software is
Fucking Hard independent of problem domain. It's just _also_ hard when your
problem domain requires innovation.

#### "Prongfork"?!

Okay, I don't really call this ProngFork, but **wow** "MindBody" is about as
silly a name.<sup><a href="#fn2" id="ref2">2</a></sup> Other names I've
considered concern a feature that I like, suggested to me by [a most brilliant
co-worker][12] I spoke to about this: integrating with your Google/Outlook
calendar, the app will find classes (Yoga, Karate, Crossfit…) within X distance
from your location that fits into your calendar, including travel time.

With that in mind, internally I've called it _Oddly Satisfying_, after the
[subreddit of the same name][8], where disjoint things often fit well together.
Another name was _Ribcage_, since that's what I call days on my calendar that
look like this:

<img src="/img/2016/08/ribcage.png" alt="many appointments with small gaps" style="max-width: 450px; margin: 15px auto;" />

### Goblins: spreadsheets as if you care about what's on them.

What's the most popular programming language in the world? Or in any case, the
most impactful? That's right, [Excel!][10]

Virtually every suit-wearing business relies like crazy on Excel and or Google
Sheets. So why are we so okay with the fact that [the vast, vast majority of
these have crippling bugs?][13]

If you've had any exposure to software, you know that it is _impossible_ to ship
anything meaningful without any bugs. So imagine a language with the type safety
of Python being used to write a program without test cases, by someone who's
never written large-scale software before. Terrifying, right?

The solution would be to apply lessons in programming to the tools: either an
extension for Excel (does it support that?) or something like a Chrome extension
for Sheets. The most obvious addition would be something like a static type
checker (here's [a master's thesis][14] on it, there's plenty of research).

There's also a more ambitious path.

A… new spreadsheet program?

Wait! Come back! This could solve another Big Problems that comes with
spreadsheets: Security!

Excel is super easy to hack. Many Flash security vulnerabilities that we
encountered were using exploits in MS Office to own the machine, and only
embedded a SWF in the document to cause it to crash (Flash did that pretty
well!). Writing something in Rust would preserve efficiency and wildly reduce
the unsafe memory.
  
Furthermore, there's often sensitive data on these documents: Sheets means you
have to use a Google Account, and the security features of Excel are not
particularly friendly.

I'm less confident in this as a business for a few reasons:

* Way, way harder tech.

* Way, way harder sell (can you imagine going into a large firm with a straight
  face and saying "get off of Excel and trust my new product"?).

But! There's some novel value to be had here, and I think if it was adopted our
businesses would have their practices and numbers be much more tied to reality.

#### Goblins?!

Like in Harry Potter; I doubt Gringotts has accounting errors on the same level.

<sup id="fn1">1. There are a million great, valid answers to this, but part of what I feel when
I recite them is <em>How convenient, now you don't have to even test if you could
if you wanted to.</em><a href="#ref1">↩</a></sup>

<sup id="fn2">2. Oddly, I have a positive association with the phrase "MindBody,"
if only because I had <a href="http://aaroniba.net/articles/tmp/how-i-cured-my-rsi-pain.html">a
similar experience to Aaron Iba</a> when trying to treat my RSI, and have more
faith than I should in something I still consider 91% jiggery-pokery.<a href="#ref2">↩</a></sup>

   [1]: https://www.youtube.com/watch?v=cjd8E1rD3m4&t=1m53s
   [2]: http://www.newyorker.com/magazine/2014/09/01/poison-ivy
   [3]: /2013/10/on-depression-mine.html
   [4]: https://www.bostonglobe.com/lifestyle/health-wellness/2013/05/26/when-brain-attacks-newly-discovered-disease-can-mimic-psychosis/dyixxnwdHJJIUITsNYJC3O/story.html
   [5]: https://www.jwz.org/blog/2011/11/watch-a-vc-use-my-name-to-sell-a-con/
   [6]: https://www.mindbodyonline.com/
   [7]: https://www.quora.com/Does-Mind-Body-mindbodyonline-com-have-competitors-Who-are-they
   [8]: https://www.reddit.com/r/oddlysatisfying
   [9]: https://www.mindbodyonline.com/company/press/mindbody-surpasses-100-million-with-record-year-end-revenue
   [10]: https://products.office.com/en-us/excel
   [11]: http://cdn.shopify.com/s/files/1/0535/6917/products/mistakesdemotivator.jpeg?v=1416776264
   [12]: https://twitter.com/scrollie
   [13]: http://lemire.me/blog/2014/05/23/you-shouldnt-use-a-spreadsheet-for-important-work-i-mean-it/
   [14]: https://cs.brown.edu/research/pubs/theses/masters/2003/antoniu.pdf
