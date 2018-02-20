    Title: 🗣 Meetings, Part 2: Behind the symptom
    Date: 2018-02-08T22:49:53
    Tags: culture, engineering, management

<blockquote class="twitter-tweet" data-lang="en">
<p lang="en" dir="ltr">&quot;You likely have to get management approval for a $500 expense
... but you can call a 1 hour meeting with 20 people and no one
notices.&quot;</p>&mdash; Vala Afshar (@ValaAfshar)
<a href="https://twitter.com/ValaAfshar/status/618826783799025664?ref_src=twsrc%5Etfw">July 8, 2015</a>
</blockquote>

<small><em>🎵 The song for this post is [FANTASTIC BABY][1], by
BIGBANG 🎵</em></small>

[I wrote a bit about meetings][2] with a focus on people and incentives. Take
out ineffective people, reward good people, make sure incentives align. Once
you've done that, [you still need to clean up the oil spill that was left
behind.][3] Removing the source of a problem is necessary, but not
sufficient.

"Too many meetings," like having a fever, is a widely relatable idea because
both meetings and fever are each symptoms of a large category of dysfunctions.
Here are a few weaknesses and restrictions I've observed to make meetings appear
necessary.

### Incorrect org structure

This is the easiest one to understand, and the one that most absolves leadership
of having to think critically of their behavior: we just have the wrong team
structure! It's simply a matter of the right re-org!

Weak leaders love assigning this as the reason there are too many meetings,
partially because the solution requires substantial effort to execute.
Deciding to re-org means managing career/political ramifications for a lot of
folks, renewed compensation negotiations, the announcement(s), and waiting
months to see the effect. When you don't know what to do, it can buy time; all
you have to do is sufficiently convince yourself and others of a thesis that's
not really testable ("is this the optimum org structure" has far too many
possibilities to be sufficiently answered, and your company + the market is
always changing to make comparisons moot anyways). The person initiating a
re-org is also seen to be Taking Action in front of their superior, playing into
[the preference to manage up instead of down.][14] Lastly, one can also re-org
without much firing, another thing weak managers avoid.

Despite the above, this is sometimes the correct diagnosis. If excessive meetings
are always happening between the same two teams or individuals and you
absolutely can't give up any process, take a critical look at
their responsibilities and evaluate if they're so distinct. Look at the last
initiative your unit executed (or failed to), where it snagged, and tweak as
necessary.

That said, one of the other reasons might still be at play, because in theory,
these two chatty teams could just use email, or Google Docs?

### 10 generals planning a battle for 12 soldiers

One broken org structure deserves special attention.

In some companies the people who _do the work_ leave or consider leaving, but
the people who _make the work_ enjoy their gigs enough to stay. If this goes on
for long enough you end up with the incorrect workforce, where you get a surplus
of strategy but not enough people to execute.

Compare the satisfaction of employees who execute and those who assign: speak
with them, look at attrition, and/or use something like [TinyPulse][4] or Google
Forms. If you're losing people who shovel coal into the engine, your train won't
move, no matter how good your conductors are.

While any re-org is challenging, I suggest taking pretty drastic measures
in this case to accommodate what your workers need. If you're at this point
already, each loss costs more than the last, is harder to rebuild from, and the
ones vocalizing their discontent are probably already on their way out anyways.

### Lack of feeling safe when making or announcing decisions

Variations of "lack of trust" and "lack of safety" should be one of your first
guesses when considering virtually any cultural issue. Cultural wrongs exist
in a company because its people, consciously or subconsciously, decide it costs
more to acknowledge or address a problem rather than live with it. It lines up
with [a ton of Google research][10] and [years of management theory.][9]

Meetings are often used as a mechanism that forces something your culture is
lacking. "Why couldn't this be an email?" Because the culture (either of an
individual, or the company as a whole) has most folks feeling…

- "Stakeholders won't engage with a doc"
- "My asks aren't precise, and I can't make what I want precise."

#### "Stakeholders won't engage" = Permission vs. Intent, Bad Prioritization

Here's very common one: meetings that largely go over the content of a
doc. One could presumably just send out the doc and eschew the meeting, but
there's little confidence that the right people will read it, or meaningfully
engage. It gets worse if meeting participants are then on their phones or laptops.

As a tactical fix, you can try switching to RFCs, which stands for ["Request For
Comments"][8]. They're pretty popular in engineering circles: a team writes up what
they intend to do, and invite others to comment. There's no meeting over this
document: past a certain date, new comments are closed, existing discussions get
wrapped up, then work starts. NPM [has some lessons][6], as does
[Juan Pablo Buriticá][7]. Google Docs has excellent collaboration/comment
features, and Good Ole Email works.

I want to stress that I find success when the RFC doc is light. You want it to
be meaningful, so go beyond simple high-level concepts; on the other hand,
everyone will appreciate brevity, and you won't know many of the real obstacles
to your problem until you're actually working on it. After some practice you'll
find the Goldilocks level of detail.

Moving meetings to RFCs usually gets pushback or surfaces bugs; investigation
into who pushes back and why is where you'll often find where Meeting Culture
comes from.

In my experience, it's a combination of teams needing permission from their
bosses for too much, and their bosses not prioritizing correctly so
they're always "too busy" to read email or docs. If management is top-down,
meetings become a way to _get permission_ instead of _state intent,_ and the
company fails to scale because the workers don't feel like they have ownership
or autonomy (which also [makes them leave][13]). Because Leader's permission 
is needed to move forward, and all teams need that attention, Leader gets busy
and can't read the prepared docs adequately. The only way to get their full
attention is to put them in a meeting. So.

### "My asks aren't precise" = Lack of direction or vision

Sometimes the initiator of a meeting can't write it in a doc because they're not
clear on what they want, or has dependencies they can't satisfy without putting
people in a room.

Debug as normal:

* Were there obstacles (concrete or cultural) that made it hard to satisfy
  dependencies they had before the meeting?

* Is that person (or others at their level) given enough autonomy to resolve
  ambiguities?

* Does the initiator have too many other responsibilities to adequately prepare
  for and structure the meetings their role requires them to call?

[It's very hard to clarify one's thoughts.][12] There's a good chance meetings
with imprecise premises are largely a result of this. Investigate this with the
initiator of the meeting, and per the bits above about psychological safety and
trust, be abundantly clear about the fact that this is coming from a place of
collaboration, support, and improvement.

It may also signal trouble with overall vision and direction with the team, or
at the company: it may be that meeting premises are imprecise because a team or
business unit is unclear on what their team is meant to achieve, what they own
vs. what other teams own, or how they fit into the company's greater objectives;
and they use meetings as an ad-hoc way to clarify these. Be mindful of this
possibility.

### #NotAllMeetings

Reminder that many meetings are necessary, many that are part of your core
structure (sprint planning, sprint retro, manager 1:1s) aren't bad
_existentially_; if they feel bad, consider "why is it not effective?" instead
of "how can I get rid of it?"

There's also this standard advice to making meetings more effective:

* Decide and state explicitly whether a meeting is a decision meeting or an
  exploration meeting.

* Set an agenda, put it in the invite. "The outcome of this meeting is to _x_,
  with _y_ outcome/deliverable."

* If you have docs that need reading ahead of time, put them in the invite.

* Don't feel the need to use all the time you booked. If you booked a half hour
  and finish in 14 minutes, feel free to let folks go.

* Take notes during the meeting (please for the love of God [don't ask one of
  the women in the room do to it][11]) and send them to the participants when
  you finish.

* Put emoji in your meeting invites. My meetings always look like "Victor /
  Pablo 1:1 ☕️" or "💾  Data Team Planning." People love this, you're people too,
  you might love it.

Good luck!

   [1]: https://www.youtube.com/watch?v=AAbokV76tkU
   [2]: /2018/02/meetings-baby.html
   [3]: /2017/12/company-culture.html#the-electric-bananas-experiment
   [4]: https://www.tinypulse.com/
   [5]: https://en.wikipedia.org/wiki/OKR
   [6]: http://blog.npmjs.org/post/153881413635/some-notes-on-rfcs
   [7]: https://buriti.ca/6-lessons-i-learned-while-implementing-technical-rfcs-as-a-management-tool-34687dbf46cb
   [8]: https://en.wikipedia.org/wiki/Request_for_Comments
   [9]: https://www.tablegroup.com/books/dysfunctions
   [10]: https://rework.withgoogle.com/print/guides/5721312655835136/
   [11]: https://www.nytimes.com/2015/02/08/opinion/sunday/sheryl-sandberg-and-adam-grant-on-women-doing-office-housework.html
   [12]: https://xkcd.com/568/
   [13]: https://www.nbcnews.com/better/careers/research-says-secret-being-happy-work-n762926
   [14]: /2018/02/meetings-baby.html#why-not-address-the-core-problems
