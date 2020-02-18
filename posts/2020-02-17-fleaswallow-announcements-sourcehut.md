    Title: 🐫 New Fleaswallow, SourceHut 🤖
    Date: 2020-02-17T23:52:00
    Tags: engineering, works, pablolife
    og_image: https://morepablo.com/img/2020/2/sapo_socks_THUMB.jpg
    og_description: Tweaked Fleaswallow some more, new code hosting

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=jS85aKyRxhw">Piel Canela</a>, by Natalia y La Forquetina.</em> 🎵</small>

<div class="caption-img-block" style="margin: 25px auto">
<a href="/img/2020/2/sapo_socks.jpg" target="blank">
<img src="/img/2020/2/sapo_socks_THUMB.jpg" alt="Sapo, hanging out in bed, next to my feet with socks that look like him. Click for full size." style="margin: 15px auto;" />
</a>
<p style="font-style: italic; text-align: center; font-size: small">Get blessed with some Sapo.</p>
</div>

I wrote some fixes/updates for [Fleaswallow][1], the OCaml static site generator
I made that builds this site. The "headline" feature is incremental
builds. Given past experience with other site generators in dynamic languages
([Frog][2], [Octopress][3]) I thought when building Fleaswallow that I'd need
some kind of cache for incremental builds to make it pleasant. Turns out I
didn't! Tech choices matter, and OCaml is delightfully performant, in a class
just under C and Rust. Builds of the site took less than a second.

And then… that changed. My site was taking 5, then 10 seconds to build. It was
manageable, of course, but I didn't like it. So I spent much of Sunday
adding incremental builds, which changed virtually every type signature, and
required a fair bit of tweaking. At first I was bitter about having to dig into
OCaml I'd mostly forgotten, but later hit my "runner's stride" and am glad
with how it turned out.

Takeaways:

Most lessons only stick after you learn them the hard way, so you already know
this, but **always profile before you optimize.** It turned out that
the incremental builds of the site didn't speed it up, because I was
entirely wrong on what was slowing it down. I thought it was the IO of writing
hundreds of files, but it was _actually_ [just copying the directory with all
the static files][4]. All those fancy video files I've uploaded (mostly for
[Celeste highlights][5]) were slowing it down, not the site-building, which
was more-or-less still instantaneous (my misunderstanding is also a function
of the logs it emitted, and taught me a bit about log design).

<div class="caption-img-block" style="margin: 25px auto">
<a href="https://twitter.com/mcclure111/status/1070379984802373632" target="blank">
<img src="/img/2020/2/rust_features_THUMB.png" alt="Tweet by mcclure111: &quot;Rust infuriates me no end because it's like somebody made a language which is bullet-point-for-bullet-point all the things I want in a programming language, and I took one look at it and realized I hate the things I want&quot;" style="margin: 15px auto;" />
</a>
<p style="font-style: italic; text-align: center; font-size: small">I CAN'T RELATE AT ALL</p>
</div>

**OCaml is getting more and more pleasant with practice.** Most of my favorite
tools are, to use [Evan Miller's term for Erlang, "back-loaded:"][7]

> most of the language's benefits can only be appreciated after several years
> with other languages followed by several years with &lt;language in
> question&gt;. It is certainly not a language for beginners.

If you couldn't tell [from my primal scream on OCaml's tooling][8], I wouldn't
wish this on my worst enemy. But, now that I'm here, it's really pretty amazing
how nice it is. Fleaswallow still doesn't have tests lol. Part of that is
because the testing story is awkward in OCaml (I'll learn it someday) but the
truism "if your program typechecks it's often pretty close to working" still
holds true. Designing the cache in line with what the codebase already had was a
bit challenging, but after I got that design in typechecked code, it didn't have
any major bugs.

_Getting_ to that state was a colossal pain in the ass compared to something
like Python or Elixir. But after spending 10 minutes writing Python application
code but spending 50 more getting the mocks right on the tests, I'll take this
tradeoff.

**Fleaswallow's not really ready for anyone else to use, but we're getting
closer.** This is a weird project of mine—I have very few code cycles to give
after [the startup work,][14] and the few that I have I should probably give to
[Amado][9]. But this makes working on Fleaswallow something of an indulgence.
One of my favorite things said about software [comes from my best friend
Saurya:][6]

> Becoming a software engineer because you love coding is a lot like becoming a
> butcher because you love animals.

and, well, a weird static-site generator for nobody else but me makes me feel
like I'm at a petting zoo. It reminds me why this is fun, actually.

---

If you click on any of the Fleaswallow links above, you'll note that it's hosted
on [SourceHut][11]. I talked about sr.ht in my [self-hosting post][10] as
something I'd like to try; in practice, it turned out to require a fair bit of
setup, and I wasn't even sure I'd like it. I almost caved and installed
[Gitea][12] or [Gogs][13]. But I respect Drew's work, share many of his
computing aesthetics, and like what he's trying to do, so I'm moving a lot of my
repos over there to "try before I buy" on self-hosting it myself. I'll probably
move more repos there soon.


   [1]: https://git.sr.ht/~srpablo/fleaswallow
   [2]: https://github.com/greghendershott/frog
   [3]: http://octopress.org/
   [4]: https://git.sr.ht/~srpablo/fleaswallow/tree/e47d9cf97cab1ca711a8cecb1c9173f920041015/src/fleaswallow_lib/files.ml#L46-49
   [5]: /2019/09/celeste-7b-golden.html
   [6]: https://twitter.com/Saurya/status/1121188147826573312
   [7]: https://www.evanmiller.org/why-i-program-in-erlang.html
   [8]: /2019/08/fresco-jesus-ocaml-setup.html
   [9]: https://amado.app/
   [10]: /2019/05/self-hosted-adventures.html
   [11]: https://sourcehut.org/
   [12]: https://gitea.io/en-us/
   [13]: https://gogs.io/
   [14]: /2020/02/introducing-ramp.html
