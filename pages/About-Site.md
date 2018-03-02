# About (this site)

This website is built a bit atypically; and while I think this bores a ton of 
people, hopefully others will find it interesting!

## Current

### Content

The repo for the site is hosted on GitHub [here][3]. It's a generated static
site, which has some nice perks:

* I can version control the content. I can push it to GitHub, Bitbucket, and/or
  ZIP it and push it to Google Drive. I've lost a website or two in my time,
  this is something even I can't fuck up.

* Generated sites are extremely cheap to host: putting it on S3 costs me a
  single-digit number of dollars a month.

* If I have a question or edit to make, I can use command-line tools (i.e. find
  all instances I've used a word, feed this into a Markov chain, or somesuch).

I'm using a tool I wrote myself, ([Fleaswallow][49]). Before Fleaswallow, I used
other engines:

* [Frog][4], by Greg Hendershott. Greg also wrote [the best damn Scheme Macro
  tutorial ever,][8] and I love supporting [Racket.][7]

* Jekyll, but its original author [heinously mismanaged GitHub][6] and was a
  petulant little asshole about his deservedly shameful exit. I'll follow
  [Julie's advice][5] and not associate with him or his work if I can help it.

I've [written before][9] about various other blogging engines and approaches
I've used over the years, and while I think my preference, from a user
experience, is for a self-hosted out-of-the-box system like [Ghost][10], its
generally not worth the trouble of migrating at this point 😛

I use a few scripts on top of Racket to manage things:

* A [simple shell script][39] to publish the built site to AWS via CloudFront.
* A [command here and there][40] in a Makefile around the Fleaswallow commands.
* A [tool to facilitate image uploads][41]. Also in OCaml, I might find a way
  to integrate it with Fleaswallow. More in [the README.][42]

### Hosting

Being a static site, it's comparably easy to host this in S3. I use a full AWS
stack of S3, CloudFront, and Route 53. A decent guide to do this is [here][32].

Note that if you want to add [HSTS][37] with this stack, it's a bit more
cumbersome than using CloudFlare as I did before, when I was hosting this on a
running nginx container. Julia Evans [explains the basics of the tech here][34],
and this post [explains how to do it in the AWS stack here][35]. If you're
feeling so empowered, check your site on [Mozilla Observatory][36].

Comments were something of A Decision, I ended up using [Discourse][50] with
[embedded topics][51]. The main other contender was [Talk][52], as part of
[The Coral Project][53]. If you're looking for a purely static solution, you can
also look at [Staticman][54].

The Discourse instance is hosted on Digital Ocean, because the prices for the
compute looked comparable and their interface is just a whole lot nicer.

### Styles

The backbone of this aesthetic comes from [Best Motherfucking Website][43], part
of a family of sites I mentioned [here.][44]

That said, I do add images to most posts, and I'm adding styles/nav back. I am
committed to keeping this site pretty simple. Avoiding JS makes your sites
automatically

* Render fast, even in terrible network conditions
* No blink render
* Declarative (HTML doesn't throw an exception)
* Search-indexable
* Accessible
* Semantic + "View Source"-able
* Battery friendly

### Perf

If you run a site, there's a good chance you can find something you didn't know
by running it through [Google's PageSpeed Insights][12] and [Google's
Mobile-Friendly Test][13]. There's also [Lighthouse][45].

One of my favorite people in the space of site performance is [Ilya
Grigorik][25], so I highly recommend checking out his stuff.

This, as the previous section, is _massive_ overengineering for this pathetic
little site, but then you may just smile a bit wider when you look in the mirror
in the morning 😄

### Accessibility

I'm pretty new to this, but it's a good idea to run your sites through something
like [a11y][26], [AChecker][27], or [WAVE][28]. [a11y Project][29] has some
great resources as well.

---

## Historical

More Pablo used to be More Paul, and it's had a lot of different iterations.
None of this applies anymore, but is worth storytelling value, and/or if you
have questions for your own sites.

### Content

My first blog was [this LiveJournal][46] I started freshman year of college. I
can't remember the login details, and don't have access to the email addresses
that they pointed to. It's a shame, there were a few "followers-only" posts (and
a few private ones) so some of it is Just Lost.

In college while learning computers, WordPress was taking off, so I hosted the
original "More Paul" as a WordPress install on a host I can't remember. Internet
Archive [caught a few of the pages][47], though I can't say I miss them much.

I lost that account on the host after my credit card expired and all their
warnings were Spam collected. The experience of the last two blogs might be
why, in part, I really appreciate static sites (and how easy it is to `git
commit && git push` them to the cloud).

### Hosting

After the above and I switched to static sites, I put my files into a
[Linode][48]. It was probably the simplest stack I've run until I landed back on
S3.

Two years ago, as containers were blowing up, I thought I'd learn them with this
site. The most ridiculous thing I ever did was host this on Google Cloud (my old
team!) using Kubernetes. I can't say I came out of that _particularly_
proficient with these technologies, but it was a fun experience.

If you're not doing your DNS through Amazon, it's pretty nice to use
[CloudFlare][11], especially for easy SSL. There [might be drawbacks to
this][24], however.

### Styles

I read the [CSS book by the authors][16] way back in 2006, when blue beanies
were a thing and "web standards" was still something of a fight (such was my
perception, anyways, it might have just been great branding by Zeldman and Meyer
and co.). Which is to say, I knew what CSS _looked_ like and `float`
was probably the most advanced property I remembered (that, and that to center
something dynamically, was `margin: 10px auto;`).

So when I was rebuilding the site, I was looking at other sources and more or
less losing my mind. Has science gone too far? What is this [text-rendering][17]
property? [vh][18] as a length descriptor?!?

It was all very humbling. I did some more traditional styling, archived [here][39]
and [here][38]. I got those by applying this basic process:

* Look at the default Ghost template, Casper. Good demonstration/style-test
  [here][20]. They kindly annotated/explained [its CSS file][21].

* [Some text things to keep in mind][22], re: text on blogs.

I found [this guide][19] (part two [here][23]) a pretty great read on these
topics, too.

Frog uses Bootstrap by default; I went with [Foundation][33] since I knew it
better. Now I'm trying to stay off both.

## In Conclusion

Use Squarespace.

   [3]: https://github.com/pablo-meier/Pablog
   [4]: https://github.com/greghendershott/frog
   [5]: https://twitter.com/nrrrdcore/status/459358875213238272
   [6]: http://valleywag.gawker.com/meet-the-married-duo-behind-techs-biggest-new-harassme-1545685104
   [7]: http://racket-lang.org/
   [8]: http://www.greghendershott.com/fear-of-macros/
   [9]: /2013/11/blogging-solutions.html
   [10]: https://ghost.org/
   [11]: https://www.cloudflare.com/ssl/
   [12]: https://developers.google.com/speed/pagespeed/insights/
   [13]: https://www.google.com/webmasters/tools/mobile-friendly/
   [14]: https://github.com/google/zopfli
   [15]: https://blog.codinghorror.com/zopfli-optimization-literally-free-bandwidth/
   [16]: https://www.amazon.com/Cascading-Style-Sheets-Designing-Web/dp/0321193121
   [17]: https://developer.mozilla.org/en-US/docs/Web/CSS/text-rendering
   [18]: https://developer.mozilla.org/en-US/docs/Web/CSS/length
   [19]: https://medium.com/@erikdkennedy/7-rules-for-creating-gorgeous-ui-part-1-559d4e805cda#.b1ywaheh4
   [20]: http://demo.ghost.io/style-test/
   [21]: http://demo.ghost.io/assets/css/screen.css?v=325f46f29b
   [22]: http://www.kaikkonendesign.fi/typography/
   [23]: https://medium.com/@erikdkennedy/7-rules-for-creating-gorgeous-ui-part-2-430de537ba96#.ln69vedet
   [24]: http://www.slashgeek.net/2016/05/17/cloudflare-is-ruining-the-internet-for-me/
   [25]: https://www.igvita.com/
   [26]: https://addyosmani.com/a11y/
   [27]: http://achecker.ca/checker/index.php
   [28]: http://wave.webaim.org/
   [29]: http://a11yproject.com/
   [30]: https://www.docker.com/
   [31]: http://kubernetes.io/
   [32]: https://stormpath.com/blog/ultimate-guide-deploying-static-site-aws
   [33]: https://foundation.zurb.com/
   [34]: https://jvns.ca/blog/2017/04/30/using-strict-transport-security/
   [35]: https://nvisium.com/blog/2017/08/10/lambda-edge-cloudfront-custom-headers/
   [36]: https://observatory.mozilla.org/
   [37]: https://en.wikipedia.org/wiki/HTTP_Strict_Transport_Security
   [38]: /2016/06/new-look-new-page.html
   [38]: /2018/01/
   [39]: https://github.com/pablo-meier/Pablog/blob/master/push_site.sh
   [40]: https://github.com/pablo-meier/Pablog/blob/master/Makefile#L26
   [41]: https://github.com/pablo-meier/Pablog/tree/master/tools/img-insert
   [42]: https://github.com/pablo-meier/Pablog/tree/master/tools/img-insert#img-insert
   [43]: https://bestmotherfucking.website/
   [44]: https://morepablo.com/2018/01/minimal-pages-brought-to-you-by-the-letter-f.html
   [45]: https://developers.google.com/web/tools/lighthouse/
   [46]: https://ilcapitano.livejournal.com/
   [47]: https://web.archive.org/web/20080723191834/http://www.morepaul.com
   [48]: https://www.linode.com/
   [49]: https://github.com/pablo-meier/fleaswallow
   [50]: https://www.discourse.org/
   [51]: https://meta.discourse.org/t/embedding-discourse-comments-via-javascript/31963
   [52]: https://coralproject.net/products/talk.html
   [53]: https://coralproject.net/
   [54]: https://staticman.net/
