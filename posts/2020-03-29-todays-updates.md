    Title: 🐫 Today's updates ⌨️
    Date: 2020-03-29T03:08:06
    Tags: blurb, pablolife, culture
    og_image: https://morepablo.com/img/2020/3/new_setup.jpg
    og_description: SARS-CoV-2 videos, my setup, OCaml bullshit.

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=k3Zf7S4fukI">Trinkle, Trinkle</a>, by Thelonious Monk with John Coltrane.</em> 🎵</small>

There's a ton of news outlets trying to make sense of SARS-CoV-2; I linked [the
Kurzgesagt video][2] earlier, [the 3Blue1Brown video][1] also gets linked around
a lot, but I saw this one today, also appreciated it:

<iframe width="800" height="450" style="display: block; max-width: 95%" src="https://www.youtube.com/embed/54XLXg4fYsc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### 🐫 OCaml again

It is with a heavy heart I regret to inform you that OCaml has been at
it again. I tried rebuilding [Fleaswallow][9] from a clean environment and,
unsurprisingly, found that the build was not reproducible. It was especially
maddening this time: Jane Street gives you [a set of rewriters that play with
their other libraries][3] and they added one [that killed my build because I
didn't put a type annotation on an ignored variable][4].

They also hated polymorphic `=` (in Jane Street land, `=` is only between
`int`s, and you must instead use `phys_equal <a> <b>` to do equality).

I patched it! And fixed the early bug I found. But it's silly how many hours
I've spent on this, reading [dune][6] and [opam][7] docs, and it's _still_ this
weird fucking ceremony to build a project clean.

I put up with it because, sincerely, I do enjoy writing OCaml! Especially if you
set up [coc.nvim][5] and a language server, it's **fucking brilliant,** you can
just write things relatively easily and end up with a correct program that runs
super fast.

Anyways, Fleaswallow can now build empty sites without posts (it was originally
built explicitly for "blogs"). I'm "tracking" "issues" [here][8], it's not
something I'm working on too hard, but picking away at it.

### Updates to The Setup

I've never been super attached to hardware or peripherals when computing. Here's
from when I talked about ["my setup"][10]:

> The most odd thing about my engineering setup is that I don't work effectively
> with accoutrements. Most SWEs I know have external keyboards, mice, trackpads,
> standing desks, or keyboard trays. Most use a large external monitor, or
> multiple monitors, some turn a widescreen monitor on its side for more
> vertical space.
>
> My desk has a bunch of stuffed toys. Every morning I pull out my laptop, use
> the laptop's keyboard and trackpad, on the laptop's screen, and nothing else.

So when we started working remotely, I was doing more-or-less what I was always
doing: using the laptop as-is. But then my keyboard did what Apple laptop
keyboards do, and work got to be impossible without a steady stream of
profanities. So I present to you: the remote working setup!

<div class="caption-img-block" style="margin: 25px auto">
<a href="/img/2020/3/new_setup.jpg" target="blank"><img src="/img/2020/3/new_setup_THUMB.jpg" alt="The new setup: a monitor, keyboard, mouse, headset." style="margin: 15px auto;" /></a>
</div>

Things to note:

- This keyboard… is not my favorite! I've used Cherry MX switches since 2011,
  with my favorite being Blues which are too loud for office use. So when I got
  my second mechanical, I tried linear switches (reds, specifically). I don't
  like them! But all things considered, this is the best piece of my "rig."

- This is an Amazon Basics mouse, which I got for Raspberry Pi work on remote
  art projects like Burning Man, so it is literally a hair above "functional."

- This monitor: I got it in 2012 because when I was Twitch streaming more, I
  wanted a second monitor to read chat. So this was literally the cheapest
  monitor on NewEgg I could find in 2012.

- The headset is actually pretty nice too — it's a HyperX that I got, again, for
  streaming and gaming. I think I'm one of the only people in my company who's
  using a real mic instead of the built-in on the laptop or Airpods, so I'm
  getting told I have the best audio in the the company. I think this is also
  due to _aggressive_ muting when I don't speak that comes from years of remote
  tabletop gaming.

So this feels like the _Animal Crossing starting tent_ of remote work setups.
Depending on how much longer I end up doing this, I'd make a bunch more
improvements:

- Standing desk, at least as an option. Standing is pretty hard without a
  full-adjustable standing desk, which costs a pretty penny: usually the
  adjustable sets on a table already don't have a good platform for the keyboard
  and mouse (good ergonomics require your elbows at 90 degrees), and I'm rarely
  able to stand the whole time anyways.

- A better monitor, or better: a few monitors, including one or two aligned
  vertically.

- Hike back to Manhattan for the keyboard I like better, and the decent mouse I
  got.

- If I wanted to go _full_ Twitch streamer: a basic 3-piece lighting set, a
  better mic and boom arm (out of frame) for meetings. This would be if I
  already had a lot of success with the rest of the setup and we're talking 6+
  months, and/or I become a manager and have to do a lot more meetings.

**What are your favorites? What have you been doing or find helpful? Feel free
to email me or add a comment 👇**

   [1]: https://www.youtube.com/watch?v=Kas0tIxDvrg
   [2]: https://www.youtube.com/watch?v=BtN-goy9VOY
   [3]: https://github.com/janestreet/ppx_jane
   [4]: https://github.com/janestreet/ppx_js_style/blob/bb34e048f9192bb856bccd1c0a570047c596d182/src/ppx_js_style.ml#L21
   [5]: https://github.com/neoclide/coc.nvim
   [6]: https://dune.build/
   [7]: https://opam.ocaml.org/
   [8]: https://todo.sr.ht/~srpablo/Fleaswallow
   [9]: https://git.sr.ht/~srpablo/fleaswallow
   [10]: /2018/03/my-setup.html
