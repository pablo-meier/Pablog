    Title: 🎭 Discrimination, Python pattern matching 🐍
    Date: 2020-06-27T17:24:18
    Tags: blurb, culture, engineering
    og_image: https://morepablo.com/img/2020/6/sapo_outside_dark_THUMB.jpg
    og_description: Some favorite essays, some ethics aren't that hard, and Python pattern matching.

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=Z-xe-sUlREs">Minnie the Moocher (Electro Swing cover)</a>, by PiSk.</em> 🎵</small>

<div class="caption-img-block" style="margin: 25px auto">
<a href="/img/2020/6/sapo_outside_dark.jpg" target="blank"><img src="/img/2020/6/sapo_outside_dark_THUMB.jpg" alt="Pablo lying down, Sapo alert and looking for birds. Click for full size." style="margin: 15px auto;" /></a>
<p style="font-style: italic; text-align: center; font-size: small">The good boy, standing guard.</p>
</div>

I missed this when it was first published in 2014, but [Dan Luu's piece on tech
discrimination][7] is, like most things he's written, worth a large multiple of
the time it takes to read it. Dan, like Hillel Wayne, does this thing that makes
his pieces extremely persuasive (reads primary sources, looks up existing
science) rather than armchair quarterbacking based on limited observation and
gut instinct.

By the way, welcome to More Pablo, a blog where I mostly armchair quarterback
based on limited observation and gut instinct.

Most won't click through, but the bulk of it argues against the popular idea
that SV doesn't (and can't!) restrict employment opportunities because of
systematic bias because _it's just bad business_: the market for talent is so
competitive nobody would dare to do it! He cites Marc Andreeson making the
argument, with Roger Dickey and Benedict Evans also pointing to the competitive
labor market as a bias-removing force. It's funny how there aren't many
prominent women or POC in VC making this argument. Harder when they're
underrepresented in that industry too, hm 🤔

I'll highlight a favorite passage:

> When people cite "efficient markets" with respect to hiring or other parts of
> tech, it's generally vague handwaving that sounds like an appeal to authority,
> but the authority is what someone might call a teenage libertarian's idea of
> how markets might behave.

<video controls preload="metadata" style="max-width: 800px;">
<source src="/img/2020/6/dog.mp4" type="video/mp4">
<p>If your browser doesn't support HTML5 video, here's a <a href="/img/2020/6/dog.mp4">link to the video</a> instead.</p>
</video>

He supports it with examples of hiring and bias in other fields (as or more
competitive than tech, and much more cleanly observable than engineering talent)
and lots of study by social scientists. This reminds me of a generalization of
this: a lot of social ills are maintained by comfortable, ethically lazy people
hiding behind abstractions to avoid confronting what's plain in front of them.

A shitty comedian once said something I liked, about taking his 5
year-old daughter around town one time and she sees a homeless person.

> "Daddy!  We have to help him!"
>
> "Oh, no, we gotta keep moving sweetie."
>
> "Oh, so he's okay?"
>
> "Oh he's definitely _not_ okay, but we have to walk past him now!"

It's funny because on some level, why do we "outgrow" what the 5 year-old is
pointing to here? Why are we content to live our lives while people are hungry
and there's plenty of food in the country? Why do we let people die without
insulin because "they" can't afford it? The smooth-brains will talk about
Free Markets and Personal Responsibility with the same rhetorical flourishes (or
not… have you read The Federalist?) that William F. Buckley would pull out
when supporting segregation or saying gay people get should get tattoos
with their HIV status, or Kevin Williamson when he was saying we should hang the
1 in 4 women who will have an abortion in their lives. They might cite dead 
elevated people like John Stuart Mill or Adam Smith to give it gravitas. It'll
have the trappings of a _good argument_, much like putting urine in a frosty
beer stein can make it seem more like something you'd want to drink if you
weren't paying too much attention.

But any real interrogation on whatever abstraction they rely on (Free Markets
and Personal Responsibility; Freedom of Speech and "Liberty" are big ones too)
shows that they're being extremely lazy or forcibly ignorant when confronted
with the myriad examples of where those abstractions don't play out cleanly
in the world we inhabit. While it's comfortable to think This Is Just How It
Works, it's a dodge. It's _harder_ to care about people, and more challenging to
accept that yes, things are Bad (_there is discrimination in tech, assholes!_) 
and they are that way because on some level, we allow that to be true.

And it's _especially_ hard to feel this way when the people with the most means,
resources, and ability to be part of fixing things refuse to engage with the
mountains of evidence and testimony of the people suffering because it might mean
they engage in a little reflection, or get a little less personally wealthy.
"It's time to build" everything but awareness, says the eggman (that essay was
the kind of simpleminded garbage I'm trying to point out here, but it got
smarter people to produce [this][8] and [this][9], so I'm grateful).

## The End of Girlboss

I loved [this piece by Leigh Stein](https://gen.medium.com/the-end-of-the-girlboss-is-nigh-4591dec34ed8).
It's painful to find a specific thing to pull, it's all good:

> By presenting gender disparities in the workplace as a war to be fought on a
> personal level, Sandberg allowed women to feel like they were activists
> whenever they advocated for themselves. It’s inspiring to feel like you’re on
> the right side of a good cause, like you’re a part of history in the making.
> Sandberg invited readers to ask themselves “How can I make the system work
> better for me?” instead of “Who is the system designed to work for?” She gave
> women permission to define feminism on their own terms, ushering in the
> cotton-candy pink epoch of the girlboss, c. 2013–2020.
>
> [...]
> 
> The girlboss was a disruptor; where others saw a problem, she saw an
> opportunity. Millennials weren’t buying $18 lipsticks at department store
> beauty counters? Sell them $18 lipsticks on Instagram. The ascendancy of the
> girlboss entrepreneur coincided with the growth of direct-to-consumer brands,
> which spent a gazillion dollars on targeted social advertising to meet their
> customers where they’re at — scrolling.

To be 1000% clear: I don't love it for _skewering_ women who dare to be
ambitious (and I don't think it does that, really); I get really sick seeing how
gleeful comments get on articles when a company doesn't do well under female
leadership (the glass cliff is real, the Mayer/Tumblr period was rough). More
that I think corporatized for-profit feminist branding is worth investigating,
and this is a great one.

## Python and pattern-matching

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2020/6/dino_meme.jpg" alt="small dinosaur asks another in a lake how deep the water is, by asking how hard Elixir is. The one in the water, labeled &quot;Elixir/iex/mix&quot; says &quot;neck deep, my friend!&quot; Little dinosaur jumps in enthusiastically, saying &quot;#MyElixirStatus!&quot;. He sinks lower and lower, learning the other dinosaur has a very long neck and the water is deep. The neck is labeled harder Elixir topics, like OTP/macros/Dialyzer/ETS/bit syntax/reductions. Small dinosaur looks very worried" style="margin: 15px auto;" /></a>
<p style="font-style: italic; text-align: center; font-size: small">Leave pattern matching to us! Made this after seeing <a href="https://twitter.com/_marcba/status/1268092311587651584">one for JS</a>. Here's <a href="https://www.instagram.com/p/B7XEY5yJIYi/">the original comic.</a> I could write a post about what I'm trying to say here lol.</p>
</div>

Python is considering [pattern-matching!][2] This is wild to me. I don't think
they should do it.

C++ taught us pretty well that "just because you can, doesn't mean you should"
when it comes to globbing on language features. Some PL folks like to talk
about semantic edge cases that come from combining features in ways you didn't
intend (e.g. "How does a pattern-match expression in Python work in a
constructor, surrounded by a try block, but multiple inheritors, and one
of _them_ has a throw" or somesuch); I think these things are fun but the worst
examples (like that one I just made up 👆) don't happen _that_ often in
production code.

Not to say they _never_ happen. Google famously doesn't let their engineers use
exceptions in C++ because it turns out to be a feature that's nearly impossible
to play well with thread and memory safety. And I did see (and [nearly ship][3])
some _horrors_ in C++ back in the day with templating to get around how Flash
built its inheritance trees for a matrix of products and platforms.

Another point that gets brought up is interpreter complexity. A basic C++
compiler is _so hard_ to write, let alone a production-capable one. Adding more
implementation complexity to a language will make it harder to make the
interpreter any good, and hard for other implementations to come along. [Ruby's
parse.y was always notoriously inscrutable][4], and that was _before_ [Ruby went
_ham_ on its features][5]. Ask the Rust, C++, or Scala people how their compile
times are!

But all that isn't even the main reason I'm opposed to Python supporting it.
The thing I like least about Python is also its strongest and most redeeming
feature: it's not very expressive, actually! [Guido didn't implement tail-call
optimization on principle][6] because he didn't want people to write recursive
algorithms instead of `for` loops. The whole Zen of Python "one way to do it"
and all that. Shoehorning pattern matching into Python will give it yet another
way for people to apply selectively and hang themselves with, and trust me,
we've got plenty.

## Apple, again

My Twitter timeline blew up with people excited that new versions of iOS will
let you pick a different default web browser (still required to use their
rendering engine, tho!). Also, now you can [dispute rules and not be held hostage
on bugfix updates.][1]

Um… friends? Do you see how conditioned you've become if this makes you
_excited_? This is pathetic. "I can run software that I want on a device I
purchased!" This is like being excited that a toaster I spent $900 on doesn't
hurl an insult at me if I put in bread with different packaging (same bread,
though).

You don't have to go full DHH PR war (though, you could!) or cut Apple out of
your life as much as possible (though, you could!); you could also blog mean
things about them, like we were doing in the Hey drama.

If you don't think you deserve more from the companies using your products and
labor to get rich, well, that's worth a good think.

   [1]: https://pxlnv.com/linklog/app-store-rules-summer-2020/
   [2]: https://www.python.org/dev/peps/pep-0622/
   [3]: https://en.wikipedia.org/wiki/Curiously_recurring_template_pattern
   [4]: https://programmingisterrible.com/post/42432568185/how-to-parse-ruby
   [5]: http://katafrakt.me//2019/06/15/im-worried-about-ruby-future/
   [6]: https://neopythonic.blogspot.com/2009/04/final-words-on-tail-calls.html
   [7]: https://danluu.com/tech-discrimination/
   [8]: https://newrepublic.com/article/157498/its-time-build-better-political-culture
   [9]: https://www.vox.com/2020/4/22/21228469/marc-andreessen-build-government-coronavirus
