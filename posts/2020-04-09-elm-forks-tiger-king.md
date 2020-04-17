    Title: 🍴 Elm, forks, Tiger King 🐅
    Date: 2020-04-09T22:17:14
    Tags: blurb, culture, pablolife
    og_image: https://morepablo.com/img/2020/4/xemacs_THUMB.png
    og_description: A post on Elm got me thinking about a few things. Karen and I watched Tiger King.

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=mUFI07hwqQA">Mambo Mucho Mambo</a>, by Machito and his Afro-Cuban Orchestra.</em> 🎵</small>

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2020/4/elm_logo_THUMB.png" alt="Elm logo" style="margin: 15px auto; max-width: 400px;" />
</div>

Reading ["Why I'm Leaving Elm,"][2] it's interesting that I read this line (on
Elm forbidding you from writing part of a library in JavaScript):

> The restriction causes huge problems for lots of other people too. For
> example, if there is a bug in any core library, or something missing, you just
> have to wait for the core team to fix it, rather than being able to fix it
> yourself.

which is _exactly_ the use case Lispers point to when they talk about Why Lisp
Is Superior: "in any other language, if you're missing a feature, you have to
wait and hope the language standards body discusses it, ratifies it, and
implements it. In Lisp with macros, you can write the language you want!!!" _but
also_ the community most resembling (from the outside) the Elm one and the
criticisms that post invokes is _Clojure_, with its "Rich is smarter than you,
if you want it and Rich doesn't, you're probably wrong," and "we'll fix it, if
we feel like, when we feel like it" in response to [issues with it][1]. And
Clojure is a Lisp!

The lack of adoption/growth of Clojure and Lisps is a much wider topic, I just
had a strong reaction when I read that 👆

**My personal experience with Elm** is bad. In 2014-2016 I tried 3 weekends,
each 6-7 hours, to get basic projects up with it, and while I could follow the
tutorials, anytime I did _anything interesting_, I got hit by obstacles that
made me think "Jesus, set me free." One was building an app piece-by-piece with
The Elm Architecture and when I tried to add a call it required changing ~9
files.

And look: I have a high, high pain tolerance for weird tech. I've invested
dozens of hours in OCaml, wrote Erlang in 2010 before the first `rebar`. I'm not
perfect, but if I've invested tens of hours into your paradigm and still feel
like I can't make small changes in a straightforward way, something is hobbled
here. Which ties into the most grating part: every time I had a want and read
docs, the main message I got contained massive amounts of "isn't this _so much
nicer_?!?" while not answering my question or empowering me as a developer.  It
felt like playing tennis with the ladies of Stepford.

It's true that when I did get it to work, it did the FP thing of working about
as you'd expect, with static checks to tell you when/if something breaks, and
the niceties of immutability and one-way data flow. But I'd consider
Bucklescript or Purescript if you want that on the frontend.

**Re: open source and forkability:**

> Threatening a person with exclusion from a community for attempting to patch
> the source code is quite antithetical to the spirit of Open Source, as far as
> I can see. It is the opposite of behaviour you’ll see in other Open Source
> projects. For example, Dropbox created their own Python 2 fork without the
> smallest thought of needing to apologise for such behaviour, and multiple
> competing implementations are considered healthy.

I'm not someone who maintains popular open source projects, but I disagree.
XEmacs was famously divisive. IO.js (fork of Node) was divisive. The creation of
Free Software, a predecessor to Open Source, was divisive. And a fork of Python
2 is not my favorite example: Dropbox hired Guido! They were probably blessed to
do it, and we know they have at least [4m lines of Python][3] and are not a
bunch of open-source maintainers, they're paid full-time employees.

I'd like if all projects were open to forks, and I recognize the author wanted
to release a _patch for people to try_ rather than _start a war to fork all of
Elm_. But my understanding is that big forks often looked like war, just for
someone who wants to fight a longer battle. I agree with the author that
hostility to the patch is probably Bad For Elm.

<div class="caption-img-block-2" style="margin: 25px auto">
<img src="/img/2020/4/iojs_logo_THUMB.png" alt="IO.js logo" style="margin: 15px auto;" />
<img src="/img/2020/4/xemacs_THUMB.png" alt="XEmacs open screen" style="margin: 15px auto;" />
<p style="font-style: italic; text-align: center; font-size: small">Great moments in forking history.</p>
</div>

The last subtopic this reminds me of is **"why I'm leaving [X]" posts**, which
are a fun exercise. I had a friend who called himself "a member of the "More
Blood" school of theater," and I'm a proud member of the "more humanity" school
of computing. It's often messy but I never deny a window, no matter how dirty or
ill-shaped, into the minds and experiences of people who are doing things. The
original linked post is _thorough._ It's considered. It's someone who's lived
through a lot. It's good to commemorate time and focus with an artifact.

There are good ways and bad ways of doing this. If you've got examples of good
or bad "leaving X" posts, feel free to leave them in the comments 🙂

### Tiger King

Karen and I watched Tiger King. It's entertaining for sure, but I felt the way I
tend to feel about true-crime whispery podcasts or murder documentaries: it
feels voyeuristic and titillating because most of the people watching aren't
remembering that this shit is real. Like, we know that intellectually, and that
it's real makes it more fun! But seeing a worker lose an arm at the job and be
expected to come back the next day, smiling: I don't care man, it's extremely
fucked up.

My favorite article on it is Samantha Allen's [_Joe Exotic is not your gay
icon:_][21]

> if there’s one lesson we should have learned by 2020, it’s this: To be
> fascinated by a narcissist is to already be fooled by one. To film one is to
> give them a great gift. [...]
>
> the danger of Tiger King — and the many similar documentaries of recent years
> that closely track the actions of narcissists, from Netflix’s _Wild Wild Country_
> to Hulu’s _Frye Fraud_ — is that they inevitably aestheticize people who
> have caused horrific hurt, especially when they are knowingly released into a
> social media economy eager to generate GIFs and brainstorm Halloween costumes. 

Someone we know from professional connections said "the thing about _Tiger King_
is that you don't know anybody like [the people in that documentary]!," and I
couldn't relate to that. Toxic men? Charming narcissists who want to be treated
like cult leaders? I know plenty, I don't need more. Poor people, and/or those
who didn't grow up in a rich ZIP code? I believe many in my circles don't know
many, but this wasn't new to me either.

I don't want to say you can't or shouldn't enjoy shit; I _also_, in spite of
feeling everything I'm writing here, enjoyed it! But that wasn't the whole
experience I had.

   [1]: http://ashtonkemerling.com/posts/my-increasing-frustration-with-clojure/
   [2]: https://lukeplant.me.uk/blog/posts/why-im-leaving-elm/
   [3]: https://dropbox.tech/application/our-journey-to-type-checking-4-million-lines-of-python
   [21]: https://www.them.us/story/joe-exotic-is-not-your-gay-icon
