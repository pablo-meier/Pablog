    Title: Product, metrics, and who to serve 📊
    Date: 2018-04-12T16:02:57
    Tags: management, culture
    og_image: https://morepablo.com/img/2018/4/sc2_screenshot_THUMB.jpg
    og_description: Feeling like smart things are happening doesn't mean they're happening

<small><em>The song for this post is <a href="https://www.youtube.com/watch?v=0qXmxVySMzw">Stress</a>, by Justice.</em></small>

I wrote [a few thoughts on Twitter][3] the other day and I think I'll elaborate
on them.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Feel
like a lot of my dissatisfaction with Product culture in tech companies is
similar to my understanding of consultants + focus groups in Democrats&#39;
politics/strategy</p></blockquote>

<blockquote class="twitter-tweet" data-conversation="none" data-lang="en"><p
lang="en" dir="ltr">organizations losing sight of their goals and instead
serving employees wearing ties who tell stories and need to feel important, get
high on their own supply</p></blockquote>

<blockquote class="twitter-tweet" data-conversation="none" data-lang="en">
<p lang="en" dir="ltr">➡️ Obviously Good Policy<br>&quot;It must be validated with a
focus group. David Brooks will write a scathing column. Donors will be
mad.&quot;</p><br><br><p>➡️Obviously Good Feature<br>&quot;Does this impact our
team&#39;s specific metrics? Can we put it behind an experiment? Do we have a
Product Spec?&quot;</p>&mdash; 💣 b∀BГO 💣 (@SrPablo) <a href="https://twitter.com/SrPablo/status/983563751780741120?ref_src=twsrc%5Etfw">April
10, 2018</a></blockquote>


### Metrics

#### Paperclips at all costs

There's a risk when you pick a specific metric that is anything but the core of
your org's mission, you'll end up taking away from your org's ability to succeed
in _that_ mission. If your mission is "to remove Weebles" and you measure that by
some other value "Pobbles", you'll end up with a strategy based on Pobbles
instead of Weebles. It sounds obvious, but this doesn't prevent it from
happening, especially in larger orgs with lots of nested teams.

As an example, let's consider MMR in video games:

<div class="caption-img-block" style="margin: 25px auto">
<a href="/img/2018/4/sc2_screenshot.jpg" target="blank">
<img src="/img/2018/4/sc2_screenshot_THUMB.jpg" alt="StarCraft II. Click for full size." style="margin: 15px auto;" />
</a>
</div>

When you queue up for a match in _StarCraft_, the algorithm does its best to
match you up to someone of a similar skill. But "skill" is fuzzy; you could
judge a player by any number of dimensions:

* Management and positioning of army during a battle
* Army management outside of battle
* Map awareness
* Reconaissance and effectively forecasting opponent's strategy.

All of these matter, but for determining your matchmaking rating, the only
thing the game cares about is **did you win** or **did you lose**. The rest of the
metrics are useful to me as a player, but if any of the above was weighed into
rating me in the matchmaking system, weird things would happen. For example,
suppose they weighed players who killed more units somewhere into the rating:

* Players who play longer games (with more units to kill) would be treated as
  higher-skilled than players who employ rush strategies, even if their winrates
  are lower.

* Groups of players can game the system, matching up until they face each other,
  then prolong the game artificially while sending hordes of forces to die to
  boost each other's ratings at the game's conclusion.

Suddently, your MMR system becomes some weird hybrid that isn't _totally_
removed from skill, but it isn't entirely about someone's ability to win a game,
either.

If your organization is large enough, it'll need teams with specialized roles,
and it stands to reason that they can't all have the exact same goals. However,
if you go too many levels removed from the top-level metrics, your company as a
whole may end up with lumpy results. You also risk teams with competing or
zero-sum metrics having an unhealthy, undercutting relationship.  

#### Rat Effect

[The Wikipedia description][2] is pretty good:

> [...] in Hanoi, Vietnam, under French colonial rule [...] the
> colonial regime created a bounty program that paid a reward for each rat
> killed. To obtain the bounty, people would provide the severed rat tail.
> Colonial officials, however, began noticing rats in Hanoi with no tails. The
> Vietnamese rat catchers would capture rats, lop off their tails, and then
> release them back into the sewers so that they could procreate and produce
> more rats, thereby increasing the rat catchers' revenue.

If you do _everything_ with metrics, your organization risks becoming [a
paperclip maximizer][1]: if you attack anything but True North, you'll go
somewhere other than True North.

#### Kind of Blue

Do you feel like Google was a leader in the Design space in 2009? Do you know
many amazingly-designed Google products from then, or meet any folks who did
design for them who went on to make a splash?

Most didn't because [it was so data-driven][4], and designers weren't allowed
to design:

>  [...] With every new design decision, critics cry foul. Without conviction, doubt
>  creeps in. Instincts fail. "Is this the right move?" When a company is filled
>  with engineers, it turns to engineering to solve problems. Reduce each
>  decision to a simple logic problem. Remove all subjectivity and just look at
>  the data. Data in your favor? Ok, launch it. Data shows negative effects?
>  Back to the drawing board. And that data eventually becomes a crutch for
>  every decision, paralyzing the company and preventing it from making any
>  daring design decisions.

<p style="margin:0;padding:0;height:1px;">&nbsp;</p>

> Yes, it’s true that a team at Google couldn’t decide between two blues, so
> they’re [testing 41 shades between each blue][5] to see which one performs better. I
> had a recent debate over whether a border should be 3, 4 or 5 pixels wide, and
> was asked to prove my case. I can’t operate in an environment like that. I’ve
> grown tired of debating such minuscule design decisions. There are more exciting
> design problems in this world to tackle.

Doing things in the absence of data or process is foolish, but you also can't
use data to substitute vision or leadership. Use data as a tool to improve your
product, _not_ to abdicate responsibility.

### Why does this happen?

#### Ass covering

Product Managers and Engineering Managers, like most people in a job they like,
don't want to get fired. One way not to get fired is to reduce risk in product
launches, and to have an unimpeachable process to determine your product
offering.

Deferring to data is a good way to achieve both of these goals: nobody will
fault you if can point to data, whether or not the feature succeeded. Like
[security theater][7], it matters most that you were seen to implement a sound
process. A solid negotiation strategy is to appeal to a higher authority:
what higher authority is there than data?

#### Visible impact, narratives around intelligence

PMs and EMs, like most people in a job they like, enjoy feeling impactful,
important, and necessary. One way to do that is to insist on process and
documents, and to make them as fancy as possible. Much like an engineer applying
`SingletonAbstractProxyFactory` patterns for creating an object with two variants,
if you ship process, it's tempting to ship a featureful, complex process when
your team and its goals may be served by something simpler.

I mentioned a related point in [my bit about meetings][6] (emphasis not in
original):

> [...] there are people who thrive in
> dysfunctional meeting cultures like fungal spores in moisture, and will (often
> subconsciously) perpetuate and defend it, since it keeps the spotlight on
> where they are strong rather than where they are clueless. **Commanding a high
> salary while always being in Important Meetings is one of the most accepted
> and desirable narratives in professional life,** so to many people, this is
> success. It shouldn't surprise that there's an unwillingness to question
> whether all these meeetings are the expensive illusion of success. [...]

For many people, producing slick documents with Professional Language that spin
tales about industries and consumer habits, full of percent signs and bar charts
_is_ what intelligence and risk reduction looks like. Many sell their value to
organizations along these lines: without these charts, docs, or appeals to data,
your org will make Bad Decisions.

There will be times when intuitions are incorrect and data will save the day.
However, there also exist good decisions that don't require weeks or months of
validation, product specs, and experimentation.

### Just be careful

I ended my Twitter thread with "this is all wildly reductive," and this expanded
blog post is too. Most of the processes I'm alluding to are themselves
excellent responses to capricious, poor leadership, where an org will build
things based on how the boss felt about the article they read over breakfast.
Hiring competent and charming people who use data effectively is still a great
strategy, all things considered.

That said, be wary if your org swings the needle too far the other way. It'll be
a slow death, and you'll feel smart marching to it every step of the way.

   [1]: https://hackernoon.com/the-parable-of-the-paperclip-maximizer-3ed4cccc669a
   [2]: https://en.wikipedia.org/wiki/Cobra_effect#Rat_effect
   [3]: https://twitter.com/SrPablo/status/983563748597256193
   [4]: http://stopdesign.com/archive/2009/03/20/goodbye-google.html
   [5]: https://www.nytimes.com/2009/03/01/business/01marissa.html?pagewanted=print
   [6]: /2018/02/meetings-baby.html#parasites
   [7]: https://en.wikipedia.org/wiki/Security_theater
