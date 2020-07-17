    Title: 🤓 Baited into PL talk again 🗣
    Date: 2020-04-28T23:34:35
    Tags: blurb, culture, pablolife
    og_image: https://morepablo.com/img/2020/4/blathers_THUMB.png
    og_description: Languages, tools, ecosystems again. Hitting the same drums I always do.

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=J46RY4PU8a8">Time's Scar</a>, by Yasunori Mitsuda for the game Chrono Cross.</em> 🎵</small>

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2020/4/blathers_THUMB.png" alt="Blathers from Animal Crossing." style="margin: 15px auto;" />
<p style="font-style: italic; text-align: center; font-size: small">Just call me Blathers, I'm going to talk about PL again.</p>
</div>

Hillel Wayne wrote [The Hard Part of Learning a Language][4], which I read and
enjoyed. The [lobste.rs thread][5], as any aggregator comment thread will do,
contains a mix of productive conversation and people completely missing the
point (one guy got mad enough to suggest that since Hillel is on Windows, he
can't seriously expect anyone to write tools that work for him…?).

My first reaction is that it's reminiscent of (and overlaps with) [this list I
wrote out a few weeks ago][6], which is a bit more on "brass tacks" practical
things missing from most learning materials.

The PL class I took in college is likely the largest influence on how I think
about programming as an activity, and it came from the observation that
languages can be understood as a collection of semantic features that provide
different tradeoffs in expressivity. It was a revelation! But the mistake was to
conclude too strongly that "a language's semantics are its most important
element" and subsequently underplay everything else. People really like things
like syntax and familiarity. With that come communities, libraries, and
everything else that makes us still use Python everywhere.

A comment that provoked some reactions in me was:

> And this, kids, is why “polyglot programming” is the biggest scam perpetrated
> on the American public since the invention of the carpet sweeper!
>
> Learning a language to true proficiency – which includes everything listed
> here and more – is hard, takes a lot of time, and should be a pre-requisite
> for writing production code.

A few things:

- Much of the joy of learning languages has nothing to do with using them in any
  "productive" sense. [Perlis languages][3] and all that. Most people who call
  themselves "polyglot" mostly mean "I've tinkered with many," and, speaking for
  myself, it's been a great source of joy in my life.

- With that in mind, it's worth remembering that "is productive in" can mean
  many, many different things. Breaking ground on a codebase destined to be a
  large system worked on by others is different than making a solo open source
  project, which is different than running something computationally expensive
  vs. ["data-intensive"][2], vs running on a customer's computer instead of a
  server or their browser, &amp;c; &amp;c; &amp;c; Each of these domains have
  different debugging flows, toolsets, and many people find the change from one
  to the other more disruptive than changing languages _within_ a domain they've
  worked in before.

- But I largely agree with the spirit of the comment? Someone who can do 👆 in
  multiple languages is rare! It takes me a good year _or two_ to really feel
  like I've got mechanics of a language, its tools, and its community down pat
  enough to put it in my primary toolbelt.

- That said: you haven't met enough people if you think "polyglot" is a scam,
  for most reasonable interpretations of "production-ready." I've designed and
  shipped systems in Python, Java, Elixir, C++, and JavaScript professionally;
  some of us have been doing this for 10+ years. I won't be doing phone screens
  in Common Lisp anytime soon, and I'm sure you can poke holes in my knowledge
  of each of the languages I've shipped, but I'd argue they'd be pretty obscure
  holes.

- This one's just a statement: there are no pre-requisites to writing production
  code, despite your preferences people will ship just about anything, whether
  you like it or not. Adding a "should" to an idea that's never true is just
  setting yourself up for disappointment.

In any case, the article got me thinking. These topics are dear to my heart.
I don't normally link my older stuff (oof I was a different Pablo), but here's
[me in 2013 trying to invent language servers before they were a thing][1]. We
still have so much work to do.

---

On those notes, I was reading the OCaml news and saw [opam's newest alpha blog
post][7], which mentions:

> To share a project for development, it is often necessary to be able to
> reproduce the exact same environment and dependencies setting — as opposed to
> allowing a range of versions as opam encourages you to do for releases.

> For some reason, most other package managers call this feature "lock files".
> Opam can handle those in the form of [foo.]opam.locked files, and the --locked
> option.

I've read a million OPAM docs and this is the first I heard of this lol.
Meanwhile, elsewhere, [someone asked about why Jane Street removed polymorphic
equals][8], which you'll recall [bit me in the ass][9]. I'm going to add this to
my core toolbelt, but good lord is it a challenge (that many great people work
tirelessly to make better, I know!).


   [1]: /2013/12/done-with-compilers.html
   [2]: http://dataintensive.net/
   [3]: http://lambda-the-ultimate.org/node/3464
   [4]: https://www.hillelwayne.com/post/learning-a-language/
   [5]: https://lobste.rs/s/rcdj1z/hard_part_learning_language
   [6]: https://lobste.rs/s/qb07ja/modern_hello_world_program_needs_more#c_ledxfb
   [7]: https://opam.ocaml.org/blog/opam-2-1-0-alpha/
   [8]: https://discuss.ocaml.org/t/when-did-core-remove-polymorphic-comparison-operators-in-recent-ocaml/5633
   [9]: /2020/03/todays-updates.html
