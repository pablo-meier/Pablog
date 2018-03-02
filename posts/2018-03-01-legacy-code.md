    Title: What developers mean when they say "Legacy Code"
    Date: 2018-03-01T18:24:03
    Tags: management, engineering
    og_description: I talk a bit about meanings behind the phrase "legacy code."

<small><em>🎵 The song for this post is <a href="https://www.youtube.com/watch?v=Hy8kmNEo1i8">Scatman</a>, by Scatman John.</em></small>

In 2014, I [built two Android apps][1] for a 5-person startup in about two and a
half months. In part because of lessons learned from the iOS app, was able to
architect it such that it had some features iOS didn't. When the CEO asked the
CTO if it was possible to port some of the features back into iOS, the CTO said 

> The iOS app has a fair bit of legacy code that makes this extremely challenging.

The iOS app was _6 months old._ 🤔

---

I've mentioned my belief that [most startups move to microservices due to
cultural factors more than tech ones][2]; I think a similar thing happens
with the phrase "legacy code." It gets brought up as if merely stating the
phrase communicates challenges usefully. Like the phrase "tech debt,"
I see it most often used with non-tech stakeholders, who can only
challenge the assessment in metaphors.

When I hear "legacy code," I _actually_ hear "this feels hard" or "I don't want
to work on this." Lets go over some of the reasons this might be true.

### "I didn't write this code"

Let's start directly in the deep water: _many engineers hate working on existing
code they have little context for, and will reach for reasons to avoid it._ In
the typical case, I don't think this happens consciously; it's like buying more
groceries if shopping while hungry. [Most people don't read code
recreationally][8], and figuring out how a system works requires a different set
of skills than building one out. Additionally, there's a sentimental factor:
when looking at your own code, you know all the decisions leading to its current
state, and are personally proud of the working product in front of you. You
don't have that context with someone else's code.

I assume good faith, so I model this as engineers using the conscious brain to
construct and rationalize narratives to get what they subconsciously want.
Sadly, this is extremely challenging to address directly: by definition of
"subconscious," the engineer isn't aware of what is motivating them, and has to
confront that their rationalizations may simply be their lizard brain saying
"but I don't wanna."<sup id="place1"><a href="#footnote1">1</a></sup>

**If you're an engineer:** Remember to challenge yourself and ask how much
of your decision to label something as "legacy" or "awful code" is based on your
lack of understanding of it? This is true beyond code: [ignorance is a common
cause of fear.][4] And as with all fear or pain, ask yourself why it's present.
You'll probably unearth learnings (about yourself, about your team/company
culture, about the project) that will pay back in spades.

**If you're a manager:** You'll mostly be hearing true things said to you, and
you have the challenging job of determining whether they're really unbreakable
roadblocks, or whether they're rationalizations of your report largely not
wanting to work on it. Be open to the possibility that it is the former: maybe
there are extremely solid technical reasons not to work on the old project. If
the latter, gently-but-persistently challenge the points brought up. And as
always, remember to emphasize, repeatedly, that this isn't a question of the engineer's
competence; you're mostly trying to find a solution with the biggest wins for
both them and the org.

### "I'm not confident the org will recognize the impact"

Legacy systems, by definition, are already running and providing enough value to
justify their existence. While everyone intellectually understands the
importance of keeping a system running, it doesn't feel as satisfying, for
employees or stakeholders, than being responsible for the Hot New
Thing. That new revenue stream, that UI redesign, that architecture rewrite:
all of them are easier to pin hopes and dreams to than what's old and known.
This is human: [we're terrible at valuing maintenance and infrastructure.][5]

**For managers:** Demonstrate, over and over, that you value infrastructure and
maintenance as highly as new initiatives. Do as much as possible to sweeten the
gig of working on something that is already running.

**For engineers:** As with always, whatever you work on: recognize the value of
your work and ensure your employer does the same. If you feel like
infrastructure and maintenance are undervalued, make a case for yourself. I don't
mean this to be adversarial! Most managers, being human, need nudges and
reminders. Assume good faith when you bring it up, but _do_ bring it up.

### "I'm not confident the org will support me"

Slightly a combination of the previous two, but: working on legacy systems is
hard! Engineers have to wade through complex systems that often lack
documentation, tests, specs, or monitoring ("it works because it works"),<sup id="place2"><a href="#footnote2">2</a></sup>
and their managers have few yardsticks to measure or determine impact.

Additionally, non-engineering management tends to have a skewed view of
engineering maintenance, where they expect someone to go in and fix
it like a plumber repairing a leak: a sufficiently smart engineer
can find the bug, patch it, and the component will work as normal. In reality,
they have to learn the system, build fixtures to determine and subsequently work
around its existing behavior, architect and (re)implement the solution, then
gradually remove the fixtures, documenting the whole process. It's more akin to a
jockey doing surgery on a racehorse as it's running a race.

So many engineers (rightfully!) fear that they won't get the time, space,
autonomy, and error budget to do the job effectively. They fear management
will get cold feet partway through and cancel the project.

**For both engineers and managers**, be clear that this is a marathon, not a
sprint. Most working relationships require more communication than is typically
comfortable, and legacy code projects require _more than that._ Be prepared to
challenge each other and stand up for each other for many months to come.

## It's just code

Despite the old truism, [successful rewrites of old codebases are possible][6].
And there's [a playbook or two for working with Legacy Systems][7]. Whether
you're the engineer in charge or their manager, recognize that with diligence
and significant investment, getting what you need from an old codebase is very
possible.

Ruby from 10 years ago is just as readable in your editor or terminal as Ruby
today. If everyone involved can keep a marathon mentality, there's no reason
projects on legacy systems shouldn't work.

---

<span id="footnote1">1.</span> <a href="#place1"><strong>^</strong></a>
My favorite examples of subconscious wants driving conscious discussion is when
two engineers fight over which tool or language to use for a task. They'll both
say true facts back and forth at each other but _really_ it's about how they
feel. So if the choice is "should we build the Frobulator in Go or Java?",
you'll hear

> "Java has the whole JVM ecosystem of libraries!" <br />
> "Go enables soft real-time with thread-local garbage collection!"<br />
> "All things considered though, it is _so much easier_ to hire Java developers."<br />
> "Go's quick compile times enable fast iterations!"

when what they're really saying is something closer to

> "I want to write in Java because I like it better." <br />
> "I'm bored with Java and wanna learn some Go."

or

> "I want to feel like the more senior engineer." <br />
> "No <em>I</em> want to feel like the more senior engineer!"


<span id="footnote2">2.</span> <a href="#place2"><strong>^</strong></a>
New code lacks docs/tests/specs/monitoring too, but the engineer either wrote
that code, or being new, it's so small and does so little that it's pretty easy
to comprehend.

   [1]: /2014/12/tech-of-sup-android.html
   [2]: /2018/01/services-monoliths-modularity.html
   [4]: https://getyarn.io/yarn-clip/96561391-aa34-4498-b371-9a8373fa16d9
   [5]: https://www.youtube.com/watch?v=Wpzvaqypav8
   [6]: https://programmingisterrible.com/post/73023853878/getting-away-with-rewriting-code-from-scratch
   [7]: https://www.goodreads.com/book/show/44919.Working_Effectively_with_Legacy_Code
   [8]: http://akkartik.name/post/comprehension
