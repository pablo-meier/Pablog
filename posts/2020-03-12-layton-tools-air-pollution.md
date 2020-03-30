    Title: 🎩 Layton, tools, air pollution 🛠
    Date: 2020-03-12T14:46:48
    Tags: blurb, pablolife, games
    og_image: https://morepablo.com/img/2020/3/katrielle_layton.jpg
    og_description: Things that interested me, mostly yesterday. Layton games, programming tools, air pollution.

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=RecY5iZn6B0">Like Sugar</a>, by Chaka Khan.</em> 🎵</small>

I [threw a hissy fit][12] over how awful my Twitter timeline was, and decided to
take a little break from it. My brain is bad, and it can handle only so much
dread. That said, I still have thoughts I'd like to share, so I'll try posting
up here a little more often, even if it's a little less polished.

In the Great Blog Days, these would each be their own posts. But I'm working
full time, so I'm just collecting thoughts as I think them into a stray doc,
then posting when I can. This… may get more frequent with SARS-CoV-2! These were
some thoughts I had/things of interest from yesterday.

## Professor Layton games, I'm playing them again

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2020/3/katrielle_layton.jpg" alt="Katrielle Layton, of Millionaire's Conspiracy." style="margin: 15px auto;" />
</div>

The Professor Layton games now have smartphone re-releases; they started
with the most recent (_Layton's Mystery Journey: Katrielle and the
Millionaires' Conspiracy_), which I never finished, and have gone back and
remastered _Curious Village_ and _Diabolical Box._ I decided to replay Kat's
game, and I'm finding it doesn't speak to me as much. Watching Karen play
_Diabolical Box_ next to me, a few things stand out:

- The side characters of _Curious Village_ and _Diabolical Box_ are, frankly,
  more fun. More weird, more charming.

- The "worlds" of the first trilogy are better than that of the second trilogy
  or Kat's game. St. Mystere and Folsense and the travel to the past are better
  than this weird thing they call London, with well-intentioned and
  adorable millionaires. And don't get me started on the Azran games 😖

- More than pure aesthetics, the amount of time you spend in puzzles is just
  less. It takes a lot more talking to these less-charming characters to get to
  a damn puzzle! Then you solve it and you're back to hearing worse-than-dad
  jokes.

idk, maybe I'm not the target audience, it looks like they were aiming younger
with the Kat game.

That said, I love Sherl. He's better as the third than Flora (not constructed to
be particularly interesting) or Emmy (weirdly forced in, though her ass-kicking
next to Grosky was awesome). Ernest is no Luke.

## Tooling, generality

[Hillel Wayne][2] is a treasure, and you should subscribe to his mailing list!
[His entry today][1] was a bit inspiring on how to customize your computer. I
spent a bit of time this weekend trying to make my VIM be a bit more customized
(mostly looking at [coc.nvim][6] and language servers, modeled after [this
post][7]). I, too, dream of foot pedals and a perfectly-Pablo-shaped environment
to create and consume the web, matching what works for my brain. Quitting
Facebook was good, and this little Twitter break I'm on is a little harder, but
feels good in its own way too.

I wrote [a comment on lobste.rs][8] where I listed everything I'd ideally want in
a programming environment, and that I wish "Hello World!" taught:

> - Project/directory structure.
> - make-like invocations to do the following:
>   - Build artifact
>   - Run
>   - Run tests
>   - Clean
>   - Perform static analysis, if there are external tools (e.g. mypy, formatters)
>   - Deploy
>   - Open an interactive shell with definitions loaded.
> - Reproducible dependencies (usually pinned with a lockfile these days).
>   - Easy to add
>   - Easy to download
> - Use a language server (or plugin, or IDE) to give features like:
>   - Type of highlighted expression
>   - Jump to definition
>   - Find usages of highlighted term. Safe rename/delete.

And it occurred to me I have this available in only 2 or 3 langauges, and often
in different environments (e.g. PyCharm for Python, but `merlin` for OCaml, and
various `mix` tasks for Elixir). A small project of mine is to consolidate into
vim and language servers.

[Fleaswallow][3], which generates my site, is a funny thing. I initially wanted
it to be generalizable to other sites, or "do one thing and do it well" for
basic static page generation, but a number of features I'd like to build in it
(linkable paragraphs, CSS-inliner, push-to-social) become **much** easier if I
saw "screw it" to potential other users and just let it be mine. I'm tempted to
do that; I wrote a lot more code for personal projects when I let go of certain
anxieties about clean code and perfect testing and perfect documentation, I
think it's time to loosen some constraints.

Some favorite Hillel Wayne writing is on why Uncle Bob's technical advice is to
be taken with criticism ([1][4] and [2][5]). Also, Uncle Bob is a TERF and I've
come to take "clean code" fetishization as its own code smell, so….

## Air pollution

Jason Kottke summarized an excellent little story: turns out [the decrease in
economic activity in China due to COVID-19 reduced air pollution][9], and that
reduction might have saved more lives than COVID-19 is taking. Click through for
the source link and/or full summary, but two quotes are worth mentioning, IMO:

> And his conclusion is not that viral pandemics are a net positive for the
> world (you will see people naively arguing this, siding a little too closely
> with [a snapping Thanos][10] for my comfort) but that situations like this remind
> us, as Burke [summarized on Twitter][11]: “the way our economies operate absent
> pandemics has massive hidden health costs”

Kottke.org is one of my favorite sources on my RSS feed, consider subscribing!

   [1]: https://buttondown.email/hillelwayne/archive/on-customization/
   [2]: https://hillelwayne.com/
   [3]: https://git.sr.ht/~srpablo/fleaswallow
   [4]: https://www.hillelwayne.com/post/10x/
   [5]: https://www.hillelwayne.com/post/uncle-bob/
   [6]: https://github.com/neoclide/coc.nvim
   [7]: https://bernheisel.com/blog/vim-elixir-ls-plug/
   [8]: https://lobste.rs/s/qb07ja/modern_hello_world_program_needs_more#c_ledxfb
   [9]: https://kottke.org/20/03/covid-19-reduced-air-pollution
   [10]: https://kottke.org/18/05/avengers-infinity-war---wizards-vs-the-prophet
   [11]: https://twitter.com/MarshallBBurke/status/1236908959702765568
   [12]: https://twitter.com/SrPablo/status/1237399760442720256
