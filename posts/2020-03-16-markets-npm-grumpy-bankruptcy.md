    Title: 📉 Markets, npm, Grumpy, Bankruptcy 👴
    Date: 2020-03-16T23:55:28
    Tags: blurb, pablolife, culture
    og_image: https://morepablo.com/img/2020/3/grumpy_old_man_THUMB.jpg
    og_description: 3-16 thoughts: bad markets, GitHub + npm, grumpy about products, bankruptcy

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=L8dMIzfp8HM">Bank Job</a>, by Barenaked Ladies.</em> 🎵</small>

### The markets… are Bad

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2020/3/sad_stocks_THUMB.png" alt="Picture of the stock market tanking." style="margin: 15px auto;" />
</div>
<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2020/3/my_purchases_THUMB.png" alt="Classic Tweet from a suspended account: &quot;(extremely nerds voice) my purchases&quot;" style="margin: 15px auto;" />
</div>
<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2020/3/stonks_THUMB.png" alt="Stonks meme." style="margin: 15px auto;" />
</div>

My favorite thing said about the 2008 crisis/bailout was "we privatized the
gains and socialized the losses." We live in a plutocracy, and are on track to
do it again! 👍 Bailouts, baby!!

Generational differences **really** play out here. Each younger generation has
a _lot_ less wealth by the age of 40 than their parents:

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2020/3/boomers_THUMB.png" alt="Chart showing people under 40 today own < 7% of the wealth. In the 80s, it was ~12%." style="margin: 15px auto;" />
<p style="font-style: italic; text-align: center; font-size: small"><a href="https://www.cbsnews.com/news/millennials-have-just-3-of-us-wealth-boomers-at-their-age-had-21/">via</a></p>
</div>

So virtually none of my friends (other than some people who got lucky at the
tech startup lottery) has "holdings," no retirement accounts, or the prospect of
achieving them anytime soon. These numbers don't impact their life any
differently, than, idk, the price for someone to farm you World of Warcraft
in-game gold.

I know this impacts a lot of people very badly. And if you believe in a lot of
textbook Econ, this is very bad! But day-in-the-life… I'm more worried about the
medical implications, and/or the implications for the people on the margins:
those who seek treatment in our barbaric system, those who barely get by
in the best of times.

### GitHub acquires npm

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2020/3/github_npm_THUMB.png" alt="GitHub + npm announcement graphic." style="margin: 15px auto;" />
</div>

This makes sense for both parties. Re-upping my [thoughts when MS bought
GitHub][2], which I think still hold up, and in which this play makes a ton of
sense. npm was having a set of terrible, horrible, no-good, very bad years, both
from their financials and their operations. They needed a daddy to come clean
them up, and despite their issues, they are the most popular artifact repository
for the most popular language ecosystem on the planet.

Serious Competitors to GitHub (mostly GitLab) are now playing a bigger game of
catch-up now that GitHub has the world's best devtools engineers working with
most of the planet's code repos _and_ seamless integration with the biggest
artifact repository. Alternatives to GitHub that aren't playing the exact same
game (self-hosted projects like Phabricator, Gitea, Gogs, or sr.ht) are probably
completely fine.

An old CTO of npm left last year spearheading [a federated competitor][3],
but it appears dead from the contribution history. Software is hard! And most
federated alternatives have an especially hard time getting escape velocity. [The
talk motivating the competitor][4] (and some dirty laundry around the challenges
npm faced) was pretty great too.

### Old Grumpy Bastard

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2020/3/grumpy_old_man_THUMB.jpg" alt="A cartoonish grumpy old man illustration." style="margin: 15px auto; max-width: 400px;" />
<p style="font-style: italic; text-align: center; font-size: small">Courtesy of a Google search for "grumpy old man clipart"</p>
</div>

Thing that keeps happening:

- I'm at a company with a business need. We need a document store! We need video chat!
- There's a new, hip, VC-funded product that does this.
- Click into it:
  - Chrome only! or,
  - "Download our Electron app"
- You open the Electron app. It opens your default web browser to auth. My
  default (Firefox) is not where I let all my work-account cookies swim
  (Chrome). I have to quit the app, change my default browser, open the app,
  click it again, auth, change back my default.
- The app barely works. But, like, beautifully! It's got a "clean" UI where no
  buttons are labeled. And it uses all my CPU!

Examples: This recently happened with [Tandem][16], Chrome-only was [Coda][17], and
[Slack][18] tries as hard as possible to move you into their standalone app, which
is the same as their browser app, but without the browser sandbox or any
extensions you use to preserve your privacy or minimize resource use ([which I
do liberally][21]). It also means you run multiple instances of Chrome instead of
just the one.

It's not always a nightmare onboarding, and it's not always an Electron app, but
I feel similarly about products like [Notion][19] and [Slab][20]; sleek, well-funded
products for which there were already plenty of solutions. These add some
sheen, but often lack basic functionality (Slab is a WIKI! It's not hard! And
you can't upload arbitrary document attachments like PDFs, which might matter if
you're documenting things. _You had one job_).

I guess I just wonder… why do we do this to ourselves? Are these products
**really** giving us more, and more productive than 2008 tech (or even 2013
tech)? We learned in the middle of the last decade that the B2C tech boom has
more-or-less dried up (and only produced a single-digit number of winners,
albeit those winners were massive), so now the Hot VC Tech builds things for
businesses. Now we get the equivalent of the B2C parasites (Dufl! Quartr! Uber
for Smoothies!) in the B2B world, trying to make something mundane and already
solved, but like, more tech.

On one hand, businesses… it doesn't have to be this way! You can just use email
and filters [like this guy][1], you probably don't need Superhuman. Take an hour
to go to GMail settings and/or learn its keyboard shortcuts. GApps for business
is probably fine. Install [a Matrix instance][15], you probably don't need to pay
Slack or use their giant-ass app.

But that's not how this game is played, alas. Sales teams are effective!

<h4 id="grumpy-stack">Proposing… the Grumpy Company Stack</h4>

- **Code operations:** [sr.ht][14] (self-hosted or the main instance). Also gives
  you issue tracking, mailing lists, build + deploy.
- **Docs:** Either of:
  - Markdown documents in your codebase(s).
    - _Extreme nerd variant:_ comments in your code, like this ["design doc in the code"][8]
       by my former roommate. Really, click that link.
  - A static site that people add files to, like [Sphinx][9]/[ReadTheDocs][10] site.
    - _Extreme nerd variant:_ [Scribble][11].
  - A hosted wiki. [DokuWiki][12] is ancient but easy to use.
- **Email:** Self-host if you're good enough. I'm not, so [Migadu][13].
- **Chat, if you really need it.:** Matrix. But use email and mailing
  lists when you can.

### Bankruptcy longread

I initially made fun of Vox Media when they launched, since having an all-male
founding team of centrists "explaining" things was not an obviously
forward-thinking look. But occasionally they'll impress, and I really
appreciated this [meaty explainer on Biden, Warren, and American bankruptcy][5],
and contextualizing it in light of the recent debate, which I'm not going to
write about, other than to say Biden's a liar and a hack, and Bernie threw it.

It also links [this story][6] from the 2012 Republican primary, which I thought
was pretty cute. Big lol to Republicans using a term by a cartoon from 1895 😝

Fun fact: when my dad practiced law, he focused on Bankruptcy, specifically
Chapter 7. [You can check out his book!][7] "Robert Redford will play me in the
movie," he sometimes says.

---

Stay well!

   [1]: https://klinger.io/post/71640845938/dont-drown-in-email-how-to-use-gmail-more
   [2]: https://morepablo.com/2018/06/github-microsoft-ramble.html
   [3]: https://github.com/entropic-dev/entropic
   [4]: https://www.youtube.com/watch?v=MO8hZlgK5zc
   [5]: https://www.vox.com/2020/3/16/21181500/joe-biden-elizabeth-warren-bankruptcy
   [6]: https://www.theatlantic.com/politics/archive/2012/01/what-newt-and-mitt-mean-when-they-say-aint-bean-bag/332490/
   [7]: https://www.amazon.com/Chapter-Bankruptcy-Trustees-Practice-Library/dp/0471589462
   [8]: https://github.com/joyent/illumos-joyent/blob/a24006240222cb87b3dc787960d97c3fdcbadc69/usr/src/uts/common/io/i40e/i40e_main.c#L18-L368
   [9]: https://www.sphinx-doc.org/en/master/index.html
   [10]: https://docs.readthedocs.io/en/stable/intro/getting-started-with-sphinx.html
   [11]: https://docs.racket-lang.org/scribble/getting-started.html
   [12]: https://www.dokuwiki.org/dokuwiki
   [13]: https://www.migadu.com
   [14]: https://sourcehut.org/
   [15]: https://matrix.org
   [16]: https://tandem.chat/
   [17]: https://coda.io/welcome
   [18]: https://slack.com/
   [19]: https://www.notion.so/
   [20]: https://slab.com/
   [21]: /2019/09/how-i-surf-the-world-wide-web.html
