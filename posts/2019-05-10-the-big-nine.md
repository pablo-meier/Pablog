    Title: 💻 That Consumption life: The Big Nine 9️⃣
    Date: 2019-05-10T17:32:41
    Tags: culture
    og_image: aba
    og_description: I read The Big Nine, liked it fine, but with many qualms.

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=_Z4G7z1Ojlw">Frog Fractions</a>, by Khotin.</em> 🎵</small>

<div class="caption-img-block" style="margin: 25px auto">
<a href="/img/2019/5/big_nine_cover.jpg" target="blank">
<img src="/img/2019/5/big_nine_cover.jpg" alt="Cover of The Big Nine." style="margin: 15px auto;" />
</a>
</div>

The [Flash Forward][3] book club continues! (I wrote up the last one [here][4]).
Two books in, it's now lasted twice as long as [my last distributed book
club!][5]

April's book was [The Big Nine: How the Tech Titans & Their Thinking Machines
Could Warp Humanity][7], by Amy Webb. This was more of a challenge for me.
There's a good chance many of you would like reading it but I personally have
trouble feeling great about it. Apart from this book and its arguments, I
[previously wrote about the hype in AI][6] with an eye to what it actually _is_,
and why I'm skeptical about it.

After some talk of the current state of AI, Webb presents three possible
futures: an optimistic one, a middle-ground one, and a catastrophic one, and
AI's role in it. She concludes with some prescriptions to steer us the Good Way
and not the Bad Way. As much as there can be spoilers in a non-fiction book,
they'll be included going forward!

### Basic Correctness

There's a lot in this book that ranges from "not how I've seen it described" to
"flat-out wrong."

Benign: many uses of "AI" or "algorithm" suggest a fuzzy understanding of them
and their boundaries. Small examples include suggesting a company's values are "its
algorithm" (an algorithm is a finite set of repeatable steps to achieve a
concrete result; what "company values" provide are fuzzier inputs, fuzzier
outputs, and not well-described as "finite set of executable steps") or
suggesting that AI-enabled dating would allow us to screen partners for certain
properties ("Jewish, lives within 50 miles of Cleveland"—this is just
search filters). It's not that these two very specific examples undermine the
whole work for me, just that my notes contain a couple dozen of them around a
lot of other concepts related to computing. Reporting on something you don't
work on every day + having readers who do is hard.

The futures chapters presume the idea of a "Personal Data Record:" a record of
all the data a person generates (their clicks, pageviews, medical
records, photos, etc.) which, in the optimistic scenarios, is something a
citizen has control over, gives companies permission to use, can revoke
permissions for, etc. This… can't exist as described: you can't share this data
with companies without them being able to copy it (this is what Cambridge
Analytica did). Even if they copied "anonymized" versions, data anonymization
really, really hard, and usually fails against even unsophisticated attacks.
She handwaves a bit with the word "blockchain" in chapter that introduces the
idealized version of this, but not only would that mad inefficient (look
at how much energy Bitcoin uses, a relatively niche game for speculators;
compare that to all of the data hundreds of millions of people would generate)
it would also make all that data immutable and undeleteable, which goes against
other requirements of the PDR.

While someone can say the above are overly-pedantic, some more clear-cut
examples of incorrectness are the use of Moore's Law or Conway's Law. Moore's
Law hasn't been true for years. She uses Conway's Law to mean "the values of a
company's employees are reflected in the product," which I absolutely agree
with, but _it's not Conway's Law,_ which is a much more boring and limited
statement about codebase structure. This mistaken use of Conway's Law and its
implications gets several pages of treatment.

There are major practical concerns about any of the AI futures as she
speculates: the sheer amount of computing resources and energy it would take to
power them would conservatively require the building of dozens of datacenters
and several millions of dollars of networking infrastructure; doing this while a
younger generation is looking very critically at energy use for a boiling planet
is a complicated prospect. Almost everyone I know in the Big Data game says
that it's not so much about collecting data or training models, it's about
_cleaning_ data and that's not immediately automatable and scalable, and our
early efforts in that are demonstrating massive issues of bias and accuracy, to
say nothing of the philosophical questions of how models based on existing data
are mostly built to reinforce their own structures.

<div class="caption-img-block" style="margin: 25px auto">
<a href="/img/2019/5/bad_stock_image_ai.jpg" target="blank">
<img src="/img/2019/5/bad_stock_image_ai_THUMB.jpg" alt="A bad stock photo of zeroes, ones in a wave next to a generic CGI face." style="margin: 15px auto;" /></a>
<p style="font-style: italic; text-align: center; font-size: small">Between two articles on AI, let me just once use a Bad Stock Photo of AI</p>
</div>

### China

China gets a lot of treatment in the book. A lot of the "horror scenarios" are
of China becoming a global colonial power doing many of the same things the West
did during their expansionist colonial days. While I don't want to be ruled by a
colonial, authoritarian state, to talk breathlessly about how horrible it would
be and not give much awareness to how it's just following the Western playbook
(that many would argue _we still largely follow_) isn't my favorite way to read
about a country's politics.

Additionally, there's a lot of confidence that China (through its
authoritarianism) will succeed in many of its projects. I only
feel this is optimistic because [half of all software projects fail][9], and
like I said [in my last post on AI][6], you can see the cracks in the surface to
how AI makes long-term building and maintenance even harder. Even if
they have many things that the West lacks (political will and investment),
meaningful software construction is still _incredibly hard_, AI produces
specific challenges, and I'm not sure it's something they'll just cruise past.

There's a lot less substantiating this, but I got a whiff of "yellow panic"
about the treatment of China. Yes, it's an authoritarian state, and maybe my
brain is poisoned and beaten-down by too much Twitter, but is that really the
bigger threat to our democracy and "way of life," as it were? Is China becoming
a giant global empire within 30-40 years bigger than how our current companies
enable fascism and are susceptible to state attacks? Consider companies like
[CloudFlare harboring white supremacists.][13] Consider [Jack Dorsey can't
recognize right-wing grift][11] for [what it is][12]. Consider [Facebook is
going "what about the Jews like Soros?!"][10] in response to understandable
civilian criticism?

Additionally, if AI _is_ the next big thing and they become a global superpower,
we presumably don't and… is that so bad? The US can be just another place that
used to have gobs of power but now has people mostly doing their thing, like
France? How horrible!

Again, I appreciated a lot of ideas I hadn't given much thought to, and I don't
think about China and the trends there as much as I should. But in the context
of the treatment of the other book's subjects, I didn't view its
ascendance as a threat, given how the US itself is dismantling its own
government and sliding into fascism.

### The Benevolence of American Tech Companies

<div class="caption-img-block" style="margin: 25px auto">
<a href="/img/2019/5/person_does_not_exist.png" target="blank">
<img src="/img/2019/5/person_does_not_exist_THUMB.png" alt="A smiling face of someone generated by AI. Click for full size." style="margin: 15px auto;" /></a>
<p style="font-style: italic; text-align: center; font-size: small">From the
delightful and creepy <a href="https://thispersondoesnotexist.com">This Person Does Not Exist</a>, where you can refresh the page and see a new face of someone completely generated by AI.</p>
</div>

Where I mostly clawed my face at was the treatement of Google, Microsoft, Apple,
Facebook, IBM, Amazon (she shortens it to G-MAFIA). From reading this book,
these companies can only one thing wrong, which is be bad at diversity. But
anything else? No, that's because someone else is making them that way. They'd
totally be willing to compete with China if only _Wall Street_ didn't make them
accountable to quarterly returns. How can they keep doing any long-term work if
_the people who literally own them_ demand they make money in the short-term?

This is also why they won't collaborate and share AI resources or data:
Mean Old Wall Street and returns on revenue! The leaders of those
companies hate being billionaires who get richer every quarter, they'd rather
work on hard AI problems for the benefit of society.

That phrase, by the way, is maddeningly underspecified: there's a lot of talk
about how and we must steer AI to the "betterment of humanity" and not get too
lost on the politics, without acknowledging how intrinsically political any
interpretation of that phrase would be. We can't even get people to agree with
"fascism is wrong" anymore, so I don't know what hope we have for "is this good
for humanity?"

The truth is, the leadership of these companies can do a lot of things: take a stand and tell
shareholders to hold tight for a few quarters while they fix their culture or
start long-tail research. They could work to change the system that leads to so
many corrupt boards and/or makes growth hacking/IPOs attractive (SV has no
problem getting into lobbying). They could start new companies that aren't
publicly-traded or VC-funded. There's a **ton** of extremely straightforward
things tech leadership could do that they take off the table because it would
mean dropping share price in any way (in other words, _if they were willing to
give literally anything up_); they'd rather be rich and/or friendly with people
they make rich (I go further into this [here][1] and [here][2]).

Another theme: the lack of focus on Bigger Problems in AI is because of
consumers (especially those damn millenials!), with their Face Books and their
Snap Chats and their selfies. Page 180, explaining the causes of a less-good
future, emphasis mine:

>  **None of us—not individual consumers, journalists, or analysts—give the
>  Big Nine any room for error.** We demand new products, services, patents, and
>  reserach breakthroughs on a regular cycle, or we register our complaints
>  publicly. It doesn't matter to us that our demands are distracting AI's
>  tribes from doing better work.

page 190, same chapter

>  Around the world, everyone is talking about our learned helplessness in the
> age of AI. We can't seem to function without our various automated systems,
> which constantly nudge us with positive or negative feedback. **We try to blame
> the Big Nine, but really, we're the ones to blame.**
>
> It's been especially hard on Millenials, who thirsted for feedback and praise
> when they were kids and initially loved our varied AI systems—but developed a
> psychological tick that's been hard to shake. When the battery in our
> AI-powered toothbrush dies, a Millenial (now in her 40s) must resort to
> brushing her teeth the old-fashioned way, which provides no affirming
> feedback. An analog toothbrush gives no feedback, which means she can't get
> her expected hit of dopamine, leaving her anxious and blue.

🙄

> By 2023, we have closed our eyes to artificial intelligence's developmental
> track [...] We helped the Big Nine compete against itself **as we indulged in
> our consumerist desires, buying the latest gadgets and devices, celebrated
> every new opportunity to record our voices and faces, and submitting to an
> open pipeline that continually siphoned off our data.**
> 

And remember: when employees at Google get free lunches of poké bowls and
champagne gelato, we shouldn't berate their perks!

> [...] The food on the G-MAFIA's campuses isn't remotely comparable: organic
> poke bowls at Google in New York, and seared diver scallops with maitake
> mushrooms and squid-ink ride at Google's office in L.A. _For Free_.
>
> [...]
> 
> My point is this: it's really hard to make the case for a talented computer
> scientist to join the government or military, given what G-MAFIA has to offer.
> We've been busy funding and building aircraft carriers rather than spending
> money on talented people. **Rather than learning from G-MAFIA, we instead mock
> or chastise their perks.**

I actually strongly agree with the larger point of people investment, but the
bolded part is tonally what irked me. You can think government should invest in
people a lot harder and also think that tech's benefits are more for a crèche
than a workplace, and a sign of some kind of market failure when they make
enough money to do that and pay no taxes.

<div class="caption-img-block" style="margin: 25px auto">
<a href="/img/2019/5/deep_dream_photo.jpg" target="blank">
<img src="/img/2019/5/deep_dream_photo_THUMB.jpg" alt="Deep Dream of spaghetti and meatballs, with dog heads. Click for full size." style="margin: 15px auto;" />
</a>
<p style="font-style: italic; text-align: center; font-size: small">Little Deep Dream break. Found the image <a href="https://killscreen.com/articles/what-deepdream-everyone-getting-weird/">here</a>.</p>
</div>

She does frequently criticize the lack of representation of AI's key shops and
encourages them to do better. But where does it figure in that they absolutely
haven't in the decades we've been having that conversation? Is there any
awareness of the zero improvement of the numbers they were publishing in the
mid-2010s? That you can [fit all the Black people Facebook hired in 2015 on a
bus?][20] That Twitter's (at the time) [only Black Engineering Manager left
specifically naming this as something they were hopelessly bad at?][17] A Black
Facebook executive writing ["Facebook is failing its black employees and its
black users"][18]? 

We should trust the people who [paid Andy Rubin $90m to leave after abusing his
power][14]? The people [who colluded to keep engineer wages down][15]? The
culture that produced [the James Damore memo][19] (which, as a Xoogler, I can tell you
was only remarkable in that it leaked. `eng-misc` was full of opinions like
this)?

There are Bad Actors in her world, but they're oddly never these people.
Living in this world and paying attention, I promise you: if you look long
enough from pig to man and man to pig, you soon see there isn't a difference.
Many of the people on the boards and senior leadership of tech _are responsible
for why its bad,_ and can't be trusted to make ethical decisions on their own
unless another monster with some teeth arrives.

I think this would be regulation, but she's solidly in the camp of NEVER EVER
REGULATE. The "don't regulate" note gets hit many times in the book, but
this, at the very end, is literally the deepest dive into _why_ it would be bad
that I could find:

> Lastly, regulations, which might seem like the best solution, are absolutely
> the wrong choice. Regardless of whether they're written independently by
> lawmakers or influenced by lobbysists, a regulatory pursuit will shortchange
> our future. Politicians and government officials like regulations because the
> tend to be single, executable plans that are clearly defined. In order for
> regulations to work, they have to be specific. At the moment, AI progress is
> happening weekly—which means that any meaningful regulations would be too
> restrictive and exacting to allow for innovation and progress. We're in the
> midst of a very long transition, from artificial narrow intelligence to
> artificial general intelligence and, very possibly, superintelligent machines.
> Any regulations created in 2019 would be outdated by the time they went into
> effect. They might alleviate our concerns for a short while, but ultimately
> regulations would cause greater damage in the future.

The above paragraph is unspecific on why government is unsuitable to tackle
these problems but the lumbering giants of G-MAFIA are (who, by the way,
frequently fight _within_ themselves—look at Google's failed chat
apps or payment products over the last decade). Decisions are slow to come out
of tech giants too (see the W3C), tech companies also like plans to be specific
an actionable, and limiting "innovation and progress" might also limit "damage,"
which Facebook and Twitter and Google have more than demonstrated they're
capable of producing.

The main argument, as best as I can read it, is that AI moves too fast to
regulate, and that regulations would slow them down. But slowing them down to
limit damage is something she not only understands well, she herself advocates
for it if done by an independent body she wants to exist but currently doesn't
(she calls it GAIA, emphasis mine):

> GAIA members should voluntarily submit to random inspections by other members
> or by an agency within GAIA to ensure [a values framework] is being fully
> observed. [...] **This process would most assuredly slow down some progress,
> and that's by design.**

And when she talks about freeing these Nice Tech Companies from Wall Street, she
once again says slowing them down is not only Just Fine, but Necessary (emphasis
mine) if it comes from market-based solutions via controls on investment:

> [...] any financial investment accepted or made by the Big Nine should include
> funding for beneficial use and risk mapping. For example, if Google pursues
> generative adversarial network research, it should spend a reasonable amount
> of time, staff resources, and money investigating, mapping, and testing the
> negative consequences. A requirement like this would also serve to curb the
> expectations of fast profits. **Intentionally slowing the development cycle of
> AI is not a popular recommendation, but it's a vital one.**

There's no acknowledgement of the various kinds of regulations one could
impose (it's just "regulation: no"). There isn't comparisons of where we've
regulated other industries (e.g. has HIPAA hurt the tech medical sector?). 
There could be mention of how regulation can shape behavior independent of how
well or poorly its enforced (tax laws aren't enforced very well, does it mean it
was bad to draft them?). There's no mention of how moralsuasion has
failed.

It's disappointing to see such a dismissal of the only mechanism with teeth
citizens already have, specifically for that purpose, _which already exists_
(GAIA doesn't), especially after seeing government mobilization and civic
engagement at record highs after Trump's election.

### What is a "futurist"?

This all got me thinking about what a "futurist" even is, and what expectations
one should have of them. Like treating Fox News as a reputable journalism
outlet, or calling mid-aughts Daily Show/Colbert Report "just comedians," I feel
like "futurist" lets someone do the fun parts of journalism and
fiction while evading the accountability of either.

The interviews, the supporting evidence, the anecdotes are all _of Earth, today_
but as shown above can be pretty wrong or missing important context. In a
reporting context, I feel like there'd be more care to avoid overreaching, and
some of these errors would be considered misleading or embarassing. I don't know
if we hold "futurism" to the same standards.

Similarly, the futures presented at the end take pretty great liberties both
with what's possible given what we already know, but also fails to demonstrate a
solid understanding of how volatile and multifaceted the future really _is_
(do we really think nobody new will disrupt this space and it'll be These Nine
the whole time? Remember that in the 90's nobody had heard of Google or
Facebook, and even in the mid-aughts we'd not heard of Uber, Spotify, or Slack.
Do we think people will really be so uniform in their adoption and acceptance?
How will other global politics play it out?).

In the context of pure fiction, this is fine, but part of our brains are
supposed to presume "this could really happen, on our real Earth!" and the power
given to that presumption irks me. It's like taking Malcolm Gladwell too
seriously.

### You might still like it

Broadly speaking, my beefs with the book fit into two categories:

* Its politics don't align with mine, particularly on accountability for what
  sucks about the world today and what we could do to make it better.
* It gets a lot of particulars wrong.

But, broadly speaking, I feel that:

* Most people's politics don't align with mine and are more centrist or
  classically liberal, so this probably won't bother them at all.
* Most people are content to call the monster "Frankenstein"; and find the guy
  telling you Frankenstein was _actually_ the doctor to be a killjoy they're
  just fine without.

<div class="caption-img-block" style="margin: 25px auto">
<a href="/img/2019/5/not_wrong_asshole.png" target="blank">
<img src="/img/2019/5/not_wrong_asshole.png" alt="The Dude from The Big Lebowski saying &quot;You're not wrong, you're just an asshole.&quot;" style="margin: 15px auto;" />
</a>
</div>

I'm personally inclined to believe self-described futurists who produce work
like this aren't doing us a favor: it feels like cheerleading the powerful with
vague, non-collectable promises of candy. I'd rather go to the candy that exists
today, in front of me (the present, with lots of cool shit happening), or the
fun promises that know they're just fun promises (fiction).

But there's a good chance I'm just being an asshole, and I feel like if you _do_
enjoy consuming this kind of thing, you should absolutely go with Amy Webb. The
book is entertaining, it's clear she's done a ton of research; I was pleased to
see [my favorite adversarial example][16] namechecked. It obviously provoked a
lot of thinking and will probably steer how I follow some topics going forward.


   [1]: /2018/03/nyer-article-on-communities-social-media.html
   [2]: /2018/12/tumblr-banning-porn.html
   [3]: https://www.flashforwardpod.com/
   [4]: /2019/04/city-in-the-middle-of-the-night.html
   [5]: /2018/01/that-consumption-life-culture-lectures.html
   [6]: /2019/04/machine-learning-programming-s-asbestos.html
   [7]: https://www.publicaffairsbooks.com/titles/amy-webb/the-big-nine/9781541773752/
   [8]: https://www.oreilly.com/ideas/anonymize-data-limits
   [9]: https://www.cio.com/article/3068502/more-than-half-of-it-projects-still-failing.html
   [10]: https://www.forbes.com/sites/forbes/2018/11/21/facebook-admits-it-asked-definers-to-look-into-george-soros/#130c636937c8
   [11]: https://gizmodo.com/jack-dorsey-apologizes-to-far-right-activist-candace-ow-1825624453
   [12]: https://splinternews.com/facebook-does-not-understand-the-conservative-grift-1825725673
   [13]: https://www.wired.com/story/free-speech-issue-cloudflare/
   [14]: https://www.nytimes.com/2018/10/25/technology/google-sexual-harassment-andy-rubin.html
   [15]: https://www.cnet.com/news/apple-google-others-settle-anti-poaching-lawsuit-for-415-million/
   [16]: https://openai.com/blog/adversarial-example-research/
   [17]: https://techcrunch.com/2015/11/03/twitter-engineering-manager-leslie-miley-leaves-company-because-of-diversity-issues/
   [18]: https://www.facebook.com/notes/mark-s-luckie/facebook-is-failing-its-black-employees-and-its-black-users/1931075116975013/
   [19]: https://gizmodo.com/exclusive-heres-the-full-10-page-anti-diversity-screed-1797564320
   [20]: https://www.theguardian.com/technology/2015/jul/01/facebook-diversity-black-employees
