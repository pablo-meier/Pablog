    Title: 📊 Squads, pods, and the Spotify model 🗣
    Date: 2020-04-26T03:33:21
    Tags: blurb, culture, engineering, pablolife
    og_image: https://morepablo.com/img/2020/4/banana_with_butter_THUMB.jpg
    og_description: We used something like the Spotify model at CP, had some experiences that match (and others that don't) the issues brought up in the viral blog post.

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=bBwYQFjC-nI">Horse Race</a>, by Yang Ying. Also, does anyone click these? lol</em> 🎵</small>

Some ex-Spotify people have written about ["the Spotify model"][1]
and how it failed at the place that named it. A lot of Engineering Manager
Twitter jumped on it with ideas and conclusions ([Camille][8], [Marco][9],
[Kellan][10]). While the scrolljacking is hellish, it's otherwise a great little
read and I recommend it.

We had "squads" at ClassPass, with slight differences to the model described
above: Engineering Managers were (usually) placed on the squads themselves; the
ex-Spotifier mentions not doing this as a weakness (where engineers have
managers outside the team, based on their engineering domain, like "client,"
"backend," "data science," etc.).

This, as always, led to a different set of tradeoffs. While it avoided some of
the Spotify failure modes ("[...] Managers in this model had little
responsibility beyond the career development [...]") it introduced a few new
weaknesses:

**Engineering Managers often could better support and evaluate the work of those
in their "domain" on their team:** e.g. if you were an EM who was a backend IC,
you had reports who did client work, and you tended to have better luck
supporting other backend engineers and judging their work, because you knew
their domain and probably how it was practiced at your org.

**Those "eng disciplines" had more trouble communicating and agreeing on
"commons" work, since there wasn't a formal heirarchy for it.** We had opt-in
"guilds" with a weekly meeting and "guild lead" who ran it, but your first team
was always your Squad, and it required an inordinate amount of effort to get
things adopted across them.

A motivating example of this was "value objects" in Java. Java, by default,
does reference equality, so if two objects represent the same value (e.g. a
`Coordinate(x,y)` type, and you had two instances with the same x and y
coordinates) you'd have to overwrite the `equals()` method to compare them. This
is super cumbersome (you're normally calling `equals()` on all its members) and
if you add or remove members to the class without also changing
`equals()`, you break comparison. So a lot of tools will autogenerate it.

We had… idk, a dozen Java services when I was there? We were just moving to
microservices, and it was [the main motivator behind this post][7] (Reonomy and 
Lyft experience contributed a bit as well). I started a conversation (but never
finished!) getting some consensus on how we do value objects in
Java: I supported [Immutables][2], another engineer [used AutoValue][3], and a
third used [Project Lombok][4].

Since we were all on separate squads with different managers who looked
after their Squad OKRs, we always had another primary duty than moving
forward on technical questions like this. We talked about it once in a meeting,
but whatever action items involved in actually reaching a decision or
implementing it was at the expense of all our other work, which made it hard to
even know what buy-in looked like.

The other tradeoffs in the ex-Spotifiers article were definitely there though:

### "It fixated on team autonomy"

> Allowing every team to have a unique way of working meant each team needed a
> unique way of engagement when collaborating. 

This was _a bit_ true. Maybe to avoid this very fate: ClassPass
didn't really allow each team to have "a unique way of working:" all databases
had to be append-only, all services had to be written in Java or Python, all
teams had to have standups and two-week sprints, and the Product Process
required we needed 4 meetings before starting substantive work (a Goal Gate, a
Product Gate, an API Review, and Design Gate). Each of these required some
Senior Stakeholder to approve it, which was a bit driver for these posts
([1][5], [2][6], and as before, Reonomy and Lyft colored these ideas too).

We did have _some_ ability to make independent choices on minor technical things
(e.g. the Value Objects issue above, or one team who was into BDD and wrote
Cucumber specs, or some initial differences across teams in whether to use
response envelopes or not). Holistically, the teams were only a little
autonomous due to the top-down Product process. Said another way: the Spotify
post talked about how challenging it was to have Engineering heirarchy exist
outside of the squad model; that was _somewhat_ mitigated at CP by having line
managers on the team. But the PM's had a lot of the issues in the original post
with having their bosses and professional development commanded from the
somewhere else, while they were lone islands in charge of executing it. They
weren't "mini-CEOs," they were given strict rules about how to execute on a
team, whoever was on it, or whatever its directive or greater goals were.

If you looked at retention during my year there: I never saw a line PM last
more than a year and a half. Most burned out and went on to have a better job
elsewhere (one went to FB, two to Squarespace). The Design org had similar
issues as well.

To be clear: _this is not to shit on ClassPass at all._ I had a great
time there, met many amazing people I'm still friends with, love the product,
and most of 👆 was a result of smart and well-intentioned people trying to work
under the constraints of VC-backed hypergrowth. A fun thing about the Spotify
post is to remember _even after the issues described, they're still Spotify,_
and until COVID, ClassPass was poised to become a worldwide mainstay. They
might still do it! Also, I left in 2017, and I wasn't the only one who noticed
these things: I hear they work pretty differently now.

But! We should talk about our experiences. It shouldn't be shameful to say "we
were human; also, here are things I learned." So! These are things I learned
about the "squad model."

### "Collaboration was an assumed competency"

This is a brilliant phrase, and is true of virtually every organization I've
ever worked in, squad model or not. The best company I've worked at, re:
collaboration? lol Adobe. Turns out if your company doesn't have an employee
base that suggests a ton of ageism, and retains employees for any amount of
time, your employee base might cultivate collective wisdom, form relationships
with themselves, and subsequently work together effectively. Weird.

This isn't so focused on my time at ClassPass, but literally everywhere I've
worked since Adobe<sup id="place1"><a href="#footnote1">1</a></sup>. At most
places, an employee with a tenure of 2 years or more is "a long time," and
startups like to hire younger for a variety of reasons (cheaper, more available
as more people learn to code, tech's bias for youth). The natural consequence of
this is an entire company of people figuring shit out for the first time.

And collaboration? Man, they do **not** teach you this shit anywhere else but
doing it.

---

Also, this line made me laugh:

> I was excited to see the Spotify model in action when I interviewed for a
> product management role at its Stockholm headquarters in 2017. However, the
> recruiter surprised me before the first interview. She cautioned me to not
> expect Spotify to be an Agile utopia.

I had the same experience when I joined Google in 2012 and seemed excited about
20% time 😛

### "Startup within a large company"

I meant to write about this, but just gonna publish as-is lol. Discuss in the
comments! How do you react when you hear that phrase? Have you been a part of an
initiative like this?

## Cooking photos

Alright, enough of all that other nonsense. **HERE'S THE CONTENT I KNOW YOU CRAVE:**

<div class="caption-img-block" style="margin: 25px auto">
  <a href="/img/2020/4/chili_ingredients.jpg" target="blank"><img src="/img/2020/4/chili_ingredients_THUMB.jpg" alt="Several ingredients going into a chili. Click for full size." style="margin: 15px auto;" /></a>
  <a href="/img/2020/4/boiling_chili.jpg" target="blank"><img src="/img/2020/4/boiling_chili_THUMB.jpg" alt="A boiling pot of chili. Click for full size." style="margin: 15px auto;" /></a>
  <p style="font-style: italic; text-align: center; font-size: small">Made a beef chili. It seemed so promising and even tastes alright, but I didn't cook the beef separately + drain this time, just cooked it in the pot. That, and a mistake on broth meant that it's pretty fatty, and the there was too much raw broth, not enough tomatoes. I'll be more diligent on fluid levels.</p>
</div>

<div class="caption-img-block" style="margin: 25px auto">
  <a href="/img/2020/4/out_of_oven.jpg" target="blank"><img src="/img/2020/4/out_of_oven_THUMB.jpg" alt="Fresh banana muffins coming out of the oven. Click for full size." style="margin: 15px auto;" /></a>
  <a href="/img/2020/4/banana_with_butter.jpg" target="blank"><img src="/img/2020/4/banana_with_butter_THUMB.jpg" alt="Banana muffin cut in half, with some butter. Click for full size." style="margin: 15px auto;" /></a>
  <p style="font-style: italic; text-align: center; font-size: small">These banana muffins came out better. Not my best muffins, but not my worst either. Butter is a blessing, man.</p>
</div>

---
<span id="footnote1">1.</span> <a href="#place1"><strong>^</strong></a>
A bit less so for Google, which does retain people better than your typical
VC-backed startup, and, while still trending younger than Adobe, is steadily
seeing their median age of employee rise. As with any Google comparison though,
one must remember they print money and have for decades. Like trying to mimic
any of their tech, they can learn any lesson as expensively as they like; most
of us can't afford to do that.

   [1]: https://www.jeremiahlee.com/posts/failed-squad-goals/
   [2]: https://immutables.github.io/
   [3]: https://github.com/google/auto/blob/master/value/userguide/index.md
   [4]: https://projectlombok.org/
   [5]: /2018/02/meetings-baby.html
   [6]: /2018/02/meetings-part-2.html
   [7]: /2018/01/services-monoliths-modularity.html
   [8]: https://twitter.com/skamille/status/1253676711050428418
   [9]: https://twitter.com/polotek/status/1253743403361136641
   [10]: https://twitter.com/kellan/status/1253687327693639680
