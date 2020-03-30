    Title: 😷 Confinement! 🚪
    Date: 2020-03-16T00:27:05
    Tags: blurb, pablolife, programming
    og_image: https://morepablo.com/img/2020/3/sapo_ears_THUMB.jpg
    og_description: Some topics in mind while I'm confined: remote work, exercise, side project.

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=3pvIKTa5GQI">Flotando</a>, by Francisca Valenzuela.</em> 🎵</small>

<div class="caption-img-block" style="margin: 25px auto">
<a href="https://twitter.com/aedison/status/1238953036820733953" target="blank">
<img src="/img/2020/3/aedison_tweet_THUMB.png" alt="Tweet by aedison: &quot;A lot of people will pressure you to achieve some sort of huge personal growth goal during the isolation/quarantine periods, like learning a language, or reading Moby Dick, or completing a living Pokédex. Please be realistic and kind to yourself, limit it to the original 151,&quot;" style="margin: 15px auto;" />
</a>
</div>

It looks like everyone is finally locking up! Karen has been on this COVID beat
since December; she joined a Facebook group with knowledgeable people and for a
while it seemed like it was finally _her_ who was getting whipped into a
self-induced frenzy over tunnel-vision social media; this was a very short
illusion, by mid-January it was pretty obvious the group she joined was
rightfully alarmed, and that this wasn't a function of _if_ but _when._ No joke,
we stocked up rather early and we've seriously talked about going to her mom's
in Ohio (or somewhere else pretty remote) no fewer than 8 times.

And now… it's all anyone talks about! I can't remember the last time this
happened. I want to say the release of _Harry Potter_ book 7, when the whole
country just stopped what they were doing to do the same thing, at the same
time, together. It was pretty marvelous. Well, we're here, and I'm even getting
calls from my grandfather about this, who's bravely fighting early signs of
dementia and having a hard time remembering things. He's remembering this!

I just got [this meandering email][1] from Mike Isaac's mailing list, suggesting
it's not just me who's feeling the lifestyle impact, and is responding to it
by writing. Join us! You're free from your commute! Start a blog! Write blogging
software! [Remix one on Glitch][2]! Have some fun with it! 😄

Some thoughts on being homebound, remote working, and what's happening on this
end.

### On working remotely

I worked full-time remote for four months in 2013, and I absolutely loved it.
The company hadn't planned to: they tolerated it because they wanted to hire
me, and I lived in Philly at the time, so they asked me to move to NYC when my
lease ran out (how I got here in the first place). But it was instructive:
because [I often model programming as highly creative work][4], when my job is
writing code, home offers a lot to help with this. Mostly, a quiet space away
from distractions: I'm _very_ easily jostled by social energy and people's
needs, when I'm around people, I often have to "wear the human suit" and its
impossible for me to either feel comfortable, or get meaningful work done.

The shorthand I often use is: when remote, I work better, _and_ I goof off
better. I can sit down and work on a problem without office or social
distractions, and if I need 20 minutes of "hammock time,"<sup id="place1"><a href="#footnote1">1</a></sup>
I can literally lay down comfortably and not get judged. In an office, I just
have to mill about or sit at my desk refreshing articles to calm an anxious
brain. [Pam Selle wrote a good article with many points I agree with][3]
connecting remote work to autonomy.

This isn't universal: many people are much more easily-motivated by the
energy of others, and the reason many people feel distaste for many
remote-working practices (writing decisions down, or clear asynchronous
communication) is because it's legit work. There's also, candidly, an entire
class of managers who don't realize how heavily they lean on social cues when
determining how to evaluate their reports.

Last caveat is that "working in software" becomes less and less about "writing
meaningful code" as a company, codebase, or career grows. Having a
well-specified feature that you're left to implement is more or less
the definition of a task you can give to a junior engineer; even as an "IC,"
you're often spending much of your professional time doing things like:

- Negotiating requirements and coordinating timelines with stakeholders.
- Getting informed on the "state of the world" from other ICs for those
  conversations with stakeholders.
- Informing stakeholders of all of 👆. Getting informed about 👆. With
  redundancies and "requires clarification" in both directions.
- Mentoring more junior engineers.
- Reviewing PRs, Design Docs, RFCs if your company has them.
- While line managers tend to do most of the project management associated with
  startup engineering work (standups! grooming! planning! retros!), senior ICs
  are expected to lead and participate more actively in these.

For all of that, "hammock time" is less important.<sup id="place2"><a href="#footnote2">2</a></sup> 😛

### I suck at jogging

One of the bigger discoveries of the past two years was _how much_ exercise
helped me manage my mental health struggles and feel happy to be alive and
engaged. I went head-first into acting as a teenager, and am glad I did, but
I'd never guessed that what I needed to hear then was "no dude, become a jock."

Unfortunately! Gyms are a place where you and a bunch of moist people pant
heavily and touch surfaces. So now I'm resigned to half-hearted bodyweight
routines in the one section of open floor I have, and jogging.

When I do it I'm reminded of that meme: the first step to getting good at
something is kinda sucking at it. I don't like feeling like I'm bad at things;
an inability to get over that has been a major obstacle. So here's to pushing
past it 🏃🏼‍♂️

### The dog fucking loves it

<div class="caption-img-block" style="margin: 25px auto">
<a href="/img/2020/3/sapo_ears.jpg" target="blank">
<img src="/img/2020/3/sapo_ears_THUMB.jpg" alt="My dog has ears." style="margin: 15px auto;" />
</a>
</div>

I mean: we're home all the time now!

I fucking love it too.

### Projects

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2020/3/panacea_screenshot_THUMB.png" alt="Screenshot of the output of my Pandemic bot." style="margin: 15px auto;" />
</div>

I started a bot to play [the board game Pandemic][9]. It's called [Panacea][10],
and it's written in OCaml.

A few things motivate this. Work code isn't always fun. To quote [my buddy
Saurya][11]: "Becoming a software engineer because you love coding is a lot like
becoming a butcher because you love animals." Writing code for myself in weird
languages is fun.

Why a bot? [ScrabbleCheat][12] was a project that taught me a lot and opened a
few doors for me. I didn't plan it that way! I thought it was a weekend project
😛

Why Pandemic? lol. But also, like Scrabble, it's a game I love but find super
frustrating to play. It's also very different than Scrabble! It's cooperative
rather than contentious, and the domain of forming strategies is considerably
wider than in Scrabble.

I often think about NaNoGenMo. You've heard of National Novel Writing Month
([NaNoWriMo][13]), but [NaNoGenMo][14] is about writing a _program_ that
generates a novel in a month. I'm tempted to host a contest: with 10,000
Pandemic "scenarios" (player assignments, deck shuffle configurations), how many
times can your bot win? It wouldn't be totally deterministic (Infection Deck
gets reshuffled on Epidemics) but it might be fun. I'm pretty confident I
wouldn't win! But maybe other programmers would have fun while holed-up.

---
<span id="footnote1">1.</span> <a href="#place1"><strong>^</strong></a>
"Hammock time" isn't mine, it's [a thing in the Clojure community.][7] I poke a
lot of fun at them because I think (like any other community) [they're full of
some nonsenses][8]; but they're also Weird Language Likers and think there's a
lot of good to take from their stuff too.

<span id="footnote2">2.</span> <a href="#place2"><strong>^</strong></a>
Matt Klein, one of the lead developers behind Envoy, wrote [a great tweet
thread][6] about career as a senior IC who never wanted to manage. Twitter sucks
and no longer shows you the thread of a linked tweet by default, so he said he
wrote a blog post. Turns out, [he just links Twitter like I would have][5],
putting us back where we started. And if you have privacy protections in your
browser, Medium won't render the tweet he links. Write blog posts, people! On
domains you control!!

   [1]: https://mikeisaac.substack.com/p/day-four
   [2]: https://glitch.com/search?q=blog&activeFilter=project
   [3]: https://thewebivore.com/impressions-on-working-remotely/
   [4]: /2018/08/working-hours-for-engineers.html
   [5]: https://medium.com/@mattklein123/career-advice-for-ics-558989a79464
   [6]: https://twitter.com/mattklein123/status/1130206773078421504
   [7]: https://melreams.com/2017/05/rich-hickey-hammock-driven-development/
   [8]: https://twitter.com/leonidasfromxiv/status/1234488198782386176
   [9]: https://www.zmangames.com/en/games/pandemic/
   [10]: https://hg.sr.ht/~srpablo/panacea
   [11]: https://twitter.com/Saurya/status/1121188147826573312
   [12]: https://git.sr.ht/~srpablo/ScrabbleCheat
   [13]: https://www.nanowrimo.org/
   [14]: https://nanogenmo.github.io/
