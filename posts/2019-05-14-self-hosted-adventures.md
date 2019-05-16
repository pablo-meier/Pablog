    Title: 💻 Back on my bullshit: Self-hosted Adventures ✉️
    Date: 2019-05-16T14:22:17
    Tags: culture, engineering
    og_image: https://morepablo.com/img/2019/5/pleroma_screenshot_THUMB.png
    og_description: Overthinking self-hosted services.

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=_IrQHeDcMi8">Bills</a>, by LunchMoney Lewis.</em> 🎵</small>

<div class="caption-img-block" style="margin: 25px auto">
<a href="/img/2019/5/i_studied_the_blade.jpg" target="blank">
<img src="/img/2019/5/i_studied_the_blade.jpg" alt="Thin man in silly clothes saying &quot;When you were partying, I studied THE BLADE. When you were having premarital Sex, I mastered THE BLOCKCHAIN. While you wasted your days at the gym in pursuit of vanity I cultivated INNER STRENGTH. And now that the world is on fire and the barbarians are at the gate you have the audacity to come to me for help?&quot;" style="margin: 15px auto; max-width: 400px;" /></a>
<p style="font-style: italic; text-align: center; font-size: small">becoming this guy, for computers</p>
</div>


I've been a lot more invested in ideas around [Open Web][56] and owning your own
digital identity; the kick I'm currently on is not just leaving the Tech Giants
for smaller competitors, but seeing what it would take to run my own versions of
these things on servers I control.

Note that "servers I control" still means cloud servers by big companies;
maybe in 5 years I colocate my own, with a thick waxed beard while wearing
plaid.

Here's some write-up of where I am!

---

## Up and Running!

These are services I got going with little effort, currently powering the
ＰＡＢＬＯ ＥＸＴＥＮＤＥＤ ＵＮＩＶＥＲＳＥ.

### Core site/blog

**You can see it at:** <https://morepablo.com>

**Replaces: WordPress.com**…? Moreso than having _my version_ of an existing
product, having (and using, and maintaining) a personal website of any kind is a
strange thing to do. The main person who comes to mind is [jwz][18], and he's a
web dinosaur. Man doesn't even use [tabbed browsing.][17]

**(Kind of) replaces: Facebook.** Not in a _feature_ sense, but in a "here's
what my life looks like" sense. I've posted a curated sense of life events here,
either bigs ones ([Asia trip][25], my [year in review posts][26]) or little ones
([when I moved][27], a [literal photo][28], Sapo [getting sick][29]).

also, **LinkedIn and/or Medium.** I see a lot of people try to develop their #PersonalBrand
with their posts on industry or whatnot, but I would never host
serious words on another website. Delivering text is the one thing the Internet
has always been good at, and I've seen too many platforms go down or go bad to
risk losing them.

**How I did it:** All the gory details are [here][20], but the short version: I
[wrote a static site generator][19] and have [a GitHub repo][21] with the sources,
then push and serve from S3. It costs less than a dollar a month.

**Should others do this?** Host a site? Definitely! More personal websites! More
RSS feeds! More comment threads with healthy communities!

Do it my way? Heavens no. Even if you're a software person and insist on
doing it with a static site generator, at least do it with something like
[Jekyll][22] and [GitHub Pages][23]. I wrote up [some advice for blogging][24]
in 2013 that I think still holds up: most people should buy a domain and point
it to a WordPress install.

### Discourse

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2019/5/logo-discourse_THUMB.png" alt="Discourse logo" style="max-width: 325px; margin: 10px; display: inline;" />
<a href="https://us.morepablo.com" target="blank">
<img src="/img/2019/5/discourse_screenshot_THUMB.png" alt="Screenshot of Not Pablos." style="max-width: 325px; margin: 10px; display: inline;" />
</a>
</div>

[Discourse][30] is an open-source app for communities, meant to replace old-school
forum software for communities like [Something Awful][1] or [Team Liquid][2].
It's powering the comments of my blog posts, but also exists as a standalone
site that, in theory, could be an online community with posts and discussions
and things.

**You can see it at:** <https://us.morepablo.com>

**Replaces: [Disqus][31], mostly:** the main motivation was to get comments on
here somehow; I don't think it's amazing at that (choosing to add a comment
means signing up, then getting redirected to the Discourse UI, which is
confusing the first time you do it) but I think it's better than the
alternatives.

arguably it replaces **Facebook Groups** but running a Community Site
hasn't really been my focus.

(also, did you know [phpBB][3] is still a thing?)

**How I did it:** Of all the installations, Discourse's is probably the most
straightforward: they flat-out [only support Docker installation][4], so it
more-or-less just works how they say it will. There's some light config in
getting an email provider (I'm using [Mailgun][36]). Once installed, it's
_extremely_ configurable from the inside, and most extensions are easily
Google-able (i.e.  backups to S3, logging in with another company's SSO).

That said, their [hardware requirements][5] are, IMO, obscene. The smallest
thing you can host this on, even for a tiny use case like mine, is $10/month. If
you need a full-ass GB of RAM (2 recommended!) and 10GB of disk to run your app…
my friend, I'll suggest you made bad choices _somewhere_ in this pipeline.

("bad" is unfair: they want this to power communities with thousands of everyday
active users. But, as we'll get to, I think the team's aesthetic for "good
on the web" is "more code" whereas mine is "less code")

Also, one of the fun things about self-hosting is the promise of hacking the
project to your needs later, and Discourse looks… complicated. I remember a lot
of conversation around [this eevee post][6] where they talk about the horrors of
trying to install Discourse without Docker, after Docker failed them, and how
gross it was.

**Should others do this?** Probably not. I wanted comments (which are
fundamentally dynamic) and I wanted an S3 static site, so Disqus or something
similar were contenders, but I didn't want [to put people in front of shady
shit][7] or have their comments owned by a VC-backed company. Alternatively,
I could have done something like [Staticman][8], which was technically nifty but
pretty circuitous and I didn't like using a GitHub account as a datastore. This
seemed like the least-bad option. I might put real effort into building a
capital-C community with it sometime.

### Pleroma

<div class="caption-img-block" style="margin: 25px auto">
<a href="https://toots.morepablo.com" target="blank">
<img src="/img/2019/5/pleroma_screenshot_THUMB.png" alt="Screenshot of my Pleroma instance" style="margin: 15px auto; max-width: 500px;" />
</a>
</div>

[Pleroma][10] is a microblogging site connected to [the Fediverse][9], allowing
any instance to set their own rules. You've probably heard of its more famous
sibling, [Mastodon][11].

**You can see it at:** <https://toots.morepablo.com>

**Replaces: Twitter.** [Quitting Facebook][32] hasn't been as hard as I feared—I
occasionally miss an event invite, and it's weird having no immediate
"follow-up" to meeting someone new in social settings (I didn't normally friend
people, but it was nice knowing that I or they could).

Twitter, on the other hand, is something I use and love to use every day. It's a
nightmare machine that frequently exacerbates my mental health issues and puts
me in bad places. But it's also a great source of news and incredibly funny.

Its benefits can't absolve that it's structurally doomed to fail. They've
taken billions in funding and don't produce the revenues they'd need to make
their investors happy. Frankly, they're not even close. Their CEO is a babbling
dipshit (seriously, try to make sense of [this interview][33]). They never took
Gamergate seriously, nor does it take white supremacy or election
tampering seriously. Many great engineers I respect have left and poke a lot of
barbs about how fucked its culture is.  Many of us were sad when Vine died,
we've watched Tumblr lose the sparks it had, and Twitter's time is coming. It's
when, not if.

I want to put my money where my mouth is and move sooner rather than later to a
world where we can run our own Twitter, with our own values. In a Fediverse
instance, one can kick users, ban instances, set rules, and/or otherwise govern
themselves. One could build Moments if they damn felt like it. I wouldn't [turn
Likes into "florps"][57]. Folks who don't like the rules can leave and/or start
their own instances. All this sounds better than asking Shitty Daddy Jack to fix
the bad social network. And no ads!

**How I did it:** This was [also pretty straightforward:][12] spin up a box, run
a bunch of commands. I also found it easier since it's a [Phoenix][13] app,
which I've been using for a personal project, so it's in my wheelhouse. I don't
know what the Mastodon install looks like, but the number of running instances
is encouraging.

**Should others do this?** Likely not; if you wanted to make the switch, I
think the lowest-friction path would be to make an account on the canonical
Mastodon instance, [mastodon.social][14]. It's likely to exist as long as the
project does, and Mastodon's experience more closely matches Twitter's (I also
just learned you can move an account if you decide to switch instances, which is
a cool feature).

I chose Pleroma mostly for the reasons [their intro post][15]. If you want to
try this out, feel free to make an account on my instance, but be warned it is
an adjustment. For mobile, the [Twidere][16] client lets me look at and post to
both my Pleroma feed and Twitter, so it's easier to wean off.

The main reason people might not want to do this—it's lonely. Every time I log
into Twitter there's great stuff there, whereas I'm still feeling out who's in
the fediverse. This whole topic merits its own post, but I'm not giving up yet.

---

## I'm a failure (services not running)

These are things I want, and spent about an hour on, before giving up for a bit.
I have every intention of getting these up but it's not obvious when.

### Mail servers

I feel like it'd be a cool flex to have an email address like
el\_jefe@morepablo.com. All my email has always gone to someone else's server.

**Replaces: GMail.** Google is holding a ton of the world's email, and even if
you're not on GMail [they still see it in replies and forwards][37]. Email is a
cockroach that won't die: it's been our Internet Driver's License for a
while. Nobody is promoting adoption of open APIs or protocols for everyone to
use like they used to; everyone is fighting to create walled gardens, email
will probably be one of the last protocols of the Old Open Days to hang on. But
it won't be worth anything if it all belongs to one company.

**My failures/what I've tried:** Holy shit, email is a pain in the ass.

I've been working through [this blog post][38], which is fantastic and I've been
using as a reference walking through the process. I'm very grateful for it! But
I got tripped on a few things:

* I don't want to manage my own DNS; I'm currently okay pointing my domain
  nameservers to Amazon and letting Route 53 point to my instance.
* I'm installing on Linux and not OpenBSD.
* _This assumes you have an OpenLDAP installation_, which is a follow-up blog
  post the author never got around to writing. I can relate! And there
  are alternatives for authentication I can and should look into. But that's a
  bit more dedicated quiet time I need to allocate to learn some of the config
  options.
* A few cryptography secrets are assumed on the filesystem that I'd need to
  create first.

I intend to go back to it, but this will be more than a single "outing," as it
were. Luckily, it's non-urgent.

**Lazy way out:** A template for "what more of these projects should look like"
is [Mail In A Box][39]. It's a bunch of bash scripts that are highly prescriptive
and which, in theory, make installation of your value prop happen in a single
command. The lazy way out is to give it its own instance, and run this with
minimal changes. A less-lazy-but-still-good thing I might do is look at [its
actual setup scripts][40] and run the ones I want, omit the ones I don't (as
previously mentioned, I don't want DNS, nor do I need a webmail client, I'm fine
with just the server and point something like mutt or Thunderbird into it and
K-9 Mail).

**Laziest way out:** Buy [GSuite Apps][41] and point the nameservers for my domain
at it, lol. That's what I did with [Ghostlight][58] when I was trying to get that
project off the ground.

**Should others do this?** I beg anyone who can and/or is interested to federate
their email, but loooooool email is not an easy protocol.

### SourceHut (sr.ht)

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2019/5/srht_screenshot_THUMB.png" alt="Screenshot of SourceHut." style="margin: 15px auto;" />
</div>

[SourceHut][42] is billed as "the hacker's forge," providing a self-hosted
solution to many server needs for developers: repository hosting, continuous
integration, mailing lists, code review, ticket tracking, and wikis.

**Replaces: GitHub.** Someone on Twitter wryly noted that we were so excited to
decentralize version control systems, only to centralize again around GitHub.
For years I've hosted private repos on [BitBucket][43], and while my beefs with
GitHub are less than most of the other companies I'm moving away from, I'd still
like to promote decentralization, owning my own data, and independence.

**My failures/what I've tried:** I rolled up my sleeves ready to do an install
and hit my head on the classic Open Source issue: "I'm not on the primary
developer's blessed stack." In this case, I was hoping to put this on an Ubuntu
box that's running Pleroma (there's space, it's already got Postgres); but the
EZ install packages [are only on Arch or Alpine.][44]

Trying to install from source seems like [it's "only" a few steps,][45] but I
ran into failures that required more knowledge than I had (and felt like
acquiring at the time) with Python's `setuptools` and reverse-engineering the
dev's personal machine. For example:

* Before you run `./setup.py install`, you need to install [the prereqs][59]. Is
  it in a `requirements.txt`? Nope! Okay, as suggested, I'll [look at the package][60]
  and `pip install` manually.
* Okay, I've `pip install`-ed a bunch of repos. Time to set things up! Oh shit
  lol, [I need sassc installed][61], (and [node][62]) which wasn't listed
  anywhere.
* Oh, [were you trying to do this in a virtualenv?][63]
* Note that the whole SourceHut suite is composed of 6-7 small interlocking
  projects, each of which has their own packages.

The current plan is to try to get it to run locally on my Mac, which should
familiarize me with it enough to debug issues when I run it, from source, on a
Linux box. Right now I'm boxing blind. This also familiarizes me with its finer
points if I want to hack at its functionality.

Reverse-engineering someone else's local dev: it's Open Source in the early
2000's, baby!

**"Lazy" way out: GitLab** Most people wanting to host "their own GitHub" host a
[GitLab instance][46], which looks like it's taking a lot more cues from GitHub.
It's a more mature project and maybe has a simpler install, but I suspect its
requirements are high and that it also probably wants 4-5 components.

**Alternatives: lol, idk**. [Fossil][47] repos also host their own websites and
docs, but that's committing to a different tool just for a site. For a while,
[Phabricator][48] was the game for the full-on Hacker's Forge, but that'd require
PHP and MySQL, and looks suited for Big Teams and all that.

## Still to come

These are services I hope to maybe spin up, but haven't prioritized or tried
properly.

### OpenLDAP, integrate with as many of these as possible

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2019/5/LDAPworm_png.png" alt="The OpenLDAP worm. Click for full size." style="margin: 15px auto;" />
<p style="font-style: italic; text-align: center; font-size: small">I really, really, really miss silly little mascots for Open Source projects.</p>
</div>

Currently, to use these, you'd need to create:

* An account on the Discourse instance to leave a comment.
* An account on the Pleroma instance to join it.
* An account on the SourceHut instance to participate and/or leave comments.
* My federated email would be its own auth.

Ideally, there'd be a centralized idea of "identity" so you can be logged into
one site, but have avatar and credentials/permissions for all of them set as
needed. The closest thing I could find is [OpenLDAP][49], which would at least
work with the email and Discourse.

This use-case is, frankly, probably just me: I don't know how many people want
to leave comments _and_ participate in the forum _and_ have a Pleroma account on
my instance _and_ work with the SourceHut stuff.

LDAP looks like a large can of beans (its got [a 312-page O'Reilly book][50]),
but I'm going into this trying to learn as much as I can. It's stuck around
while many New Hotnesses haven't. Suggestions welcome if you've got them.

### VPN

VPN can be useful for a few reasons: hiding where you're from, evading tracking
even further, or getting over the restrictions of another network you happen to
be on (e.g. there are coffee shops in San Francisco that block GitHub to prevent
people from coding there, or if you wanted to [watch YouTube in Turkey][34] at
various points in the past decade).

It just seems like a cool thing to have, [Outline][35] looks like a good fit
here.

### RSS

I read feeds on Feedly now, but there's a lot I don't love about it. Maybe I
throw up a [Tiny Tiny RSS][51] instance to hold news from my favorite sites.

## Others?

**How about chat?** An [IRC server with a ZNC bouncer?][53] Or [ejjabberd][52]?
Or skip "open protocols" and go for [Matrix][54]? [Zulip][64]?

**How about Instagram?** I was never much of a user, but [PixelFed][55] looks
cool.

## The longer journey

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2019/5/tweet_for_hosting_THUMB.png" alt="Old tweet of mine where I speculate on starting a hipster business to run personal servers for people with a lot of this software." style="margin: 15px auto;" />
<p style="font-style: italic; text-align: center; font-size: small"><a href="http://www.artisanalpencilsharpening.com/">Here's</a> an easily-clickable link to the site I'm referencing there.</p>
</div>

The dream, of course, is to write either a set of scripts like Mail In A Box
does (or, sigh, a container) so anyone can fill in a single config, buy a
domain, and be part of something larger.

Every journey begins with a single step, and here are some of them I'm trying to
take 🚶🏼‍♂️

   [1]: https://forums.somethingawful.com/showthread.php?threadid=3889379
   [2]: https://tl.net/forum/sc2-strategy/499586-the-lotv-zerg-help-me-thread?page=2
   [3]: https://www.phpbb.com/
   [4]: https://github.com/discourse/discourse/blob/master/docs/INSTALL.md#how-do-i-install-discourse
   [5]: https://github.com/discourse/discourse/blob/master/docs/INSTALL.md#hardware-requirements
   [6]: https://eev.ee/blog/2015/09/17/the-sad-state-of-web-app-deployment/
   [7]: https://notes.ayushsharma.in/2017/09/im-killing-disqus-comments-on-my-blog-heres-why
   [8]: https://staticman.net/
   [9]: https://fediverse.party/
   [10]: https://pleroma.social/
   [11]: https://joinmastodon.org/
   [12]: https://docs-develop.pleroma.social/debian_based_en.html#content
   [13]: https://phoenixframework.org/
   [14]: https://mastodon.social
   [15]: https://blog.soykaf.com/post/what-is-pleroma/#how-is-it-different-from-mastodon
   [16]: https://play.google.com/store/apps/details?id=org.mariotaku.twidere&hl=en_US
   [17]: https://www.jwz.org/blog/2012/04/why-i-use-safari-instead-of-firefox/
   [18]: https://www.jwz.org/blog/
   [19]: /2018/02/trying-ocaml.html
   [20]: /About-Site.html
   [21]: https://github.com/pablo-meier/Pablog
   [22]: https://jekyllrb.com/
   [23]: https://pages.github.com/
   [24]: /2013/11/blogging-solutions.html
   [25]: /2019/04/asia-trip-2019.html
   [26]: /2019/01/2018-in-review.html
   [27]: /2018/02/moved-to-brooklyn.html
   [28]: /2018/01/i-feel-like-him.html
   [29]: /2018/01/sapo-going-into-surgery.html
   [30]: https://www.discourse.org/
   [31]: https://disqus.com/
   [32]: /2018/11/bye-facebook.html
   [33]: https://www.huffpost.com/entry/jack-dorsey-twitter-interview_n_5c3e2601e4b01c93e00e2a00
   [34]: https://en.wikipedia.org/wiki/Censorship_of_YouTube#Turkey
   [35]: https://www.getoutline.org/en/home
   [36]: https://www.mailgun.com/
   [37]: https://mako.cc/copyrighteous/google-has-most-of-my-email-because-it-has-all-of-yours
   [38]: https://www.c0ffee.net/blog/mail-server-guide/
   [39]: https://mailinabox.email/
   [40]: https://github.com/mail-in-a-box/mailinabox/blob/master/setup/start.sh#L99-L112
   [41]: https://gsuite.google.com/
   [42]: https://sourcehut.org/
   [43]: https://bitbucket.org/
   [44]: https://man.sr.ht/packages.md
   [45]: https://man.sr.ht/installation.md
   [46]: https://about.gitlab.com/
   [47]: https://fossil-scm.org/home/doc/trunk/www/index.wiki
   [48]: https://www.phacility.com/
   [49]: https://www.openldap.org/
   [50]: http://shop.oreilly.com/product/9781565924918.do
   [51]: https://tt-rss.org/
   [52]: https://www.ejabberd.im/
   [53]: http://www.codeography.com/2012/09/23/howto-irc-server.html
   [54]: https://matrix.org/blog/index
   [55]: https://github.com/pixelfed/pixelfed#introduction
   [56]: /2018/01/towards-a-more-open-web.html
   [57]: https://twitter.com/actioncookbook/status/684515262712967170
   [58]: https://github.com/pablo-meier/ghostlight
   [59]: https://man.sr.ht/installation.md#srht-core
   [60]: https://git.sr.ht/~sircmpwn/core.sr.ht/tree/master/setup.py#L29-42
   [61]: https://git.sr.ht/~sircmpwn/core.sr.ht/tree/master/srht/Makefile#L22
   [62]: https://git.sr.ht/~sircmpwn/core.sr.ht/tree/master/srht/Makefile#L25
   [63]: https://git.sr.ht/~sircmpwn/meta.sr.ht/tree/master/setup.py#L22-25
   [64]: https://zulipchat.com/
