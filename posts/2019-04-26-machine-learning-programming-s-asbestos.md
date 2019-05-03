    Title: 🤖 Machine Learning: Programming's Asbestos 🧠
    Date: 2019-04-26T15:03:19
    Tags: engineering, culture, essay
    og_image: https://morepablo.com/img/2019/4/charly_pablo_ml_fail_THUMB.png
    og_description: Recent Machine Learning advances are cool but IMO pretty overhyped.

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=SJwh3erQlyE">the Title Screen theme for Pictionary for the NES</a>, by Tim Follin.</em> 🎵</small>

I'm reading a book about AI's impact on society. I'll write about it when I'm
finished, but I first felt like writing a few things about AI, apart from the
book.

### Revolution in our field!

Many "unsolvable" problems in our field now have great answers. The big obvious
one is image classification: xkcd was joking about how hard this was in 2014,
but now a solution is right there on the homepage of startups:

<div class="caption-img-block" style="margin: 25px auto">
<a href="https://xkcd.com/1425/" target="blank">
<img src="/img/2019/4/xkcd_hard_tasks.png" alt="xkcd where geocoding an image is trivial, identifying objects requires grad researchers. Click for full size." style="max-width: 250px; display: inline-block; margin: 15px auto;" />
</a>
<a href="https://clarifai.com/demo" target="blank">
<img src="/img/2019/4/clarifai_demo_screen_THUMB.png" alt="Clarifai demo screen, classifying a sunset image. Click for full size." style="max-width: 500px; display: inline-block; margin: auto;" /></a>
<p style="font-style: italic; text-align: center; font-size: small"><a href="">xkcd</a> comic and <a href="https://clarifai.com/demo">Clarifai</a> demo page, respectively.</p>
</div>

There's no shortage of emotion-inspiring demos: [Google's Duplex making
reservations][5] is a technical marvel. DeepFakes are [creepy][6] and
their use in porn makes me think of Yet Another Way women's lives in public will
be a special hell. We can [change weather conditions in photos][7].
The dangers are well-illustrated with [world leaders][8]. This is
the end of the "real world" as we know it; at least, it's the end of recorded
media having any veracity (though Photoshop killed this for photos long ago).
[This guy][9] is even calling it "Software 2.0!"

### But, lol

At the end of the day, there's no magic here. It's all just machines, used by
people, which means the same things that have applied to tech advances of the
past will apply to these too. In particular:

- They are software, and many challenges are structurally baked into what neural nets literally _are_.
- We've had hype cycles before, and we almost always hit a wall, comically.
- It's not about their capabilities, it's about the people using them and their limitations.

#### Challenges of Software

First, a two-minute explanation of what modern machine learning is, versus
software systems coded by people:

Standard software is a set of instructions written by people. Another computer
program called a _compiler_ takes those instructions and produces an
_artifact_. The artifact is run on the computer and presumably does what you
programmed it to. If you want to make changes to the artifact, the programmer makes
educated guesses on the initial set of instructions, changes the code, and feeds
it back to the compiler to produce a new artifact. Then they test it to see if
it does the right thing. This iteration happens on human timescales (so a change
can be made in minutes for small projects, or weeks for larger projects), and
its guided by our judgement.

Machine learning also produces an artifact: it's a program that generates
another program, immediately, that tries to do something you aim it at. Its
first version absolutely sucks — it might as well be guessing randomly! But then
you have a stack of questions and answers for the task at hand (think a **huge
stack**, like, millions of examples). It runs the first example through its
shitty program, sees if it got the correct answer (it probably didn't), and in
the case it didn't, like the human programmer, it tweaks its program so it's
more likely to get the correct answer. Unlike the human programmer, there's no
"educated guesses"  based on judgement, the "correction" is a purely mechanical
process based on some math, and it _only corrects its model given what you just
tested it on_. Then it pulls another example from the stack and repeats the
process. It does this on machine-level timescales: millions of times, every hour.

After hours or days of this "training" on a giant dataset, the final version of
the artifact, in theory, does a pretty good job at solving the problem, because
its tweaks have been guided by millions of question-and-answer examples.

Said another way:

<div class="caption-img-block" style="margin: 25px auto">
<a href="https://twitter.com/smaine/status/994723834434502658" target="blank">
<img src="/img/2019/4/ml_change_hacks.png" alt="Tweet that says &quot;TIL that changing random stuff until your program works is &quot;hacky&quot; and &quot;bad coding practice&quot; but if you do it fast enough it's &quot;#MachineLearning&quot; and pays 4x your current salary&quot;" style="margin: 15px auto;" />
</a>
<p style="font-style: italic; text-align: center; font-size: small"><a href="https://twitter.com/smaine/status/994723834434502658">(via)</a></p>
</div>

There are a few key takeaways about this:

**The human program used code, but ML requires _code and data. Lots of it._**
A corollary is that for Machine Learning, _the data often matters way more than
the code._ If the problem you tried to solve was "identify if there's a person
in this image" but you had no images of Black people, the ML model is hopeless.

This happened with my partner and I in 2014! I asked it what was in this photo,
and it very obviously had a biased data set:

<div class="caption-img-block" style="margin: 25px auto">
<a href="/img/2019/4/charly_pablo_ml_fail.png" target="blank">
<img src="/img/2019/4/charly_pablo_ml_fail_THUMB.png" alt="Friend and I in a photo, holding cupcakes, tagged &quot;poverty.&quot; My friend is Black. Click for full size." style="margin: 15px auto;" /></a>
</div>

Another fun example:

<div class="caption-img-block" style="margin: 25px auto">
<a href="https://twitter.com/CMastication/status/1120303072201334785?s=19" target="blank">
<img src="/img/2019/4/ruler_skin_THUMB.png" alt="Article snippet that AIs trained to detect skin cancer instead pick up on the presence of rulers in the images rather than any properties of the skin." style="margin: 15px auto;" />
</a>
<p style="font-style: italic; text-align: center; font-size: small"><a href="https://twitter.com/CMastication/status/1120303072201334785?s=19">via</a></p>
</div>

Google, powering its Knowledge Graph with AI:

<div class="caption-img-block" style="margin: 25px auto">
<a href="https://twitter.com/frozenpandaman/status/1122087202769362944?s=19" target="blank">
<img src="/img/2019/4/six_legs_THUMB.png" alt="Google saying horses have six legs, because it picked up on a popular joke as its answer rather than a real answer." style="margin: 15px auto;" /></a>
<p style="font-style: italic; text-align: center; font-size: small"><a href="https://twitter.com/frozenpandaman/status/1122087202769362944?s=19">via</a></p>
</div>

I mostly point these out to remind everyone that **mistakes like this are
_structural_ to this kind of AI.** There isn't simple fix that will eliminate
this or make it generalizable; to suggest we get over this kind of thing soon is
like saying "we'll be able to plant crops on the Moon once we fix that whole
"needing sun, water, and nutrients" thing."

(on a slightly different note, when I [asked on Twitter][10] recently, about the
failures of Open Source/Free Software compared to the late-nineties/early
aughts:

> what are the `gcc` or `gdb` or Linux or Apache or MySQL of the last 5 years?
> something that virtually anyone can use, for cheap, to unlock major
> possibilities previously only enjoyed by megacorps?

one obvious answer would be things like [Tensorflow][16] or [PyTorch][17].
But what value are these code frameworks without the data?)

The big difference I don't see mentioned much: **The human program is
reproducible, the ML one is not.** When I said "it tweaks its program so it's
more likely to get the correct answer [using math]," _this isn't a deterministic
process._ If I fed the same ML framework the same data with the same
hyperparameters, it will produce a different artifact!  The human-written code,
by contrast, will always produce the same artifact when fed to the same
compiler.<sup id="place2"><a href="#footnote2">1</a></sup>

This means that while you might get lucky, you'll never create an artifact with
properties you can build on reliably. One person calls it the [high-interest
credit card of technical debt.][2] Another calls it ["a reproducibility
crisis."][1] Software maintenance and managing complexity is already the most
challenging part of software development (especially over time), so how do you
build a robust, adaptable, socially responsible artifact when you can barely
reproduce results you've already achieved?

Others in the field note [that it's very easy to see models be brittle][3] and
that [their quality degrades over time][4].

My impression of AI is that it's like discovering what an amazing insulator
asbestos is, and now companies are putting it everywhere. It _is_ good at what
it's advertising! And we will definitely find many uses for it. But I don't
think it's a great general-purpose tool, nor have we figured out the various
ways its failures will impact the products containing it more broadly.

#### Hype cycles

Here's an article from 2014 called ["The Blockchain is the New Database, Get Ready
to Rewrite Everything."][11] It was correct! Nobody writes in traditional
datastores anymore, Everyone rewrote and is rewriting it all on the
blockchain these days 🙄.<sup id="place1"><a href="#footnote1">2</a></sup>

Here's [a retrospective on Windows Vista.][12] It's a very long read that I find
pretty interesting for a myriad of other reasons, but the main thing for this
discussion is an understanding of [WinFS][13]: a radically different
understanding of what computing would look like if Microsoft successfully
shipped this and succeeded in early efforts to stymie the web. Many very
intelligent people were planning for a future where all your software was still
on your desktop, but the programs can declaratively query and share data, as in
SQL, and computers speaking over TCP/IP + HTTP + browsers would be as obscure as
[the Gopher protocol][18] is today.

Here's [a delightful talk by Bret Victor,][14] in full costume for the 1970's and
using transparencies on an overhead projector instead of presentation tech like
Keynote, with a better idea of where computing _could_ have gone based on
predictions of the time.

When I was at Google, scuttlebutt was that self-driving cars were "almost ready"
(like, within a year) to ship out, once we ironed out the kinks. That was 2013.

Almost nobody in the 80's predicted the impact the Internet would have. Almost
nobody from the early aughts predicted smartphones.

All this to say — we should be wary of hype cycles. We've even had an [AI
Winter][15] before. It's worth having a bit of healthy skepticism about AI,
despite its early promises in narrow fields.

### It is still a big deal. Just… verify. If you can't, wait a bit.

Remember the guy I linked above calling this "Software 2.0"? He's the head of AI
at Tesla. It's great for his brand if we all believe AI is the most critical
thing to invest in right now and any other way of building software systems is
"dead." Many storytellers are selling something. 

**To be clear:** AI is important, and transformational! We will see it
in more places! I just suspect the easiest wins are already behind us. We'll see a
lot more applications of what we've just conquered, and we'll also see the first
sets of models begin to collapse without appropriate reproducibility.

---

<span id="footnote2">1.</span> <a href="#place2"><strong>^</strong></a>
If we're being pedantic, the artifact might not be the <em>exact</em> same if
the compiler uses probabilistic optimization passes, and you can argue the
chipset won't execute the same binary the same ways if it's prefetching +
multicore optimizations do funny things. Those cases don't really matter for
what I'm after given the semantic equivalence, but I can hear a little voice
bugging me about it, so maybe you've got that voice too.

<span id="footnote1">2.</span> <a href="#place1"><strong>^</strong></a>
I wrote about blockchain and its continued irrelevance in the face of hype [here](/2018/01/blockchain.html).


   [1]: https://petewarden.com/2018/03/19/the-machine-learning-reproducibility-crisis/
   [2]: https://ai.google/research/pubs/pub43146
   [3]: https://sanau.co/ML-models-are-dying-quietly
   [4]: https://simplicial.io/2019/04/22/model-performance-often-degrades-over-time/
   [5]: https://www.youtube.com/watch?v=-RHG5DFAjp8
   [6]: https://www.youtube.com/watch?v=VzhN7LyNJHs
   [7]: https://petapixel.com/2017/12/05/ai-can-change-weather-seasons-time-day-photos/
   [8]: https://www.theverge.com/tldr/2018/4/17/17247334/ai-fake-news-video-barack-obama-jordan-peele-buzzfeed
   [9]: https://medium.com/@karpathy/software-2-0-a64152b37c35
   [10]: https://twitter.com/SrPablo/status/1084858951429181440
   [11]: http://startupmanagement.org/2014/12/27/the-blockchain-is-the-new-database-get-ready-to-rewrite-everything/
   [12]: https://medium.com/@benbob/what-really-happened-with-vista-an-insiders-retrospective-f713ee77c239
   [13]: https://en.wikipedia.org/wiki/WinFS
   [14]: https://www.youtube.com/watch?v=8pTEmbeENF4
   [15]: https://en.wikipedia.org/wiki/AI_winter
   [16]: https://www.tensorflow.org/
   [17]: https://pytorch.org/
   [18]: https://en.wikipedia.org/wiki/Gopher_(protocol)
