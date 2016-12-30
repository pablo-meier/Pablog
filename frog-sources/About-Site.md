# About (this site)

The cobbler's children have no shoes. This site, like many of my projects, is
a bit of an embarassment for a Professional In Software. That said, I spent far
too long on this iteration of it so I'll write it up here.

## Content

The repo for the site is hosted on GitHub [here][3]. It's a generated static
site, a la [Jekyll][1] or [Octopress][2]. I'm using [Frog][4], for a few
reasons:

* [Racket!][7]

* Greg Hendershott wrote [the best damn Scheme Macro tutorial ever.][8]

* Generated sites are easy to host, version control, etc.

I used Jekyll previously, but its original author [heinously mismanaged
GitHub][6] and was a petulant little asshole about his deservedly shameful exit.
I'll follow [Julie's advice][5] and not associate with him or his work if I can
help it.

I've [written before][9] about various other blogging engines and approaches
I've used over the years, and while I think my preference is for a self-hosted
out-of-the-box system like [Ghost][10], its generally not worth the trouble of
migrating at this point 😛

## Hosting

Since this site is a safe sandbox to futz around with things I want to learn, I
did the MASSIVE OVERENGINEERING thing here. This used to be on a Linode, but
with the bigger cloud providers who've come up, their offering is mad
overpriced, and were always pretty terrible about security.  

So I'm on Google Cloud, and took this opportunity to learn [Docker][30] and
[Kubernetes][31]. I'm hardly an ops/infrastructure engineer, so a lot of this
was new to me. I figured serving a static site is pretty much the "Hello World"
of Docker. So if this blog gets **flooded with traffic** and the nginx that
serves HTML simply _can't handle the load_ then in theory it's "easy" to scale
this out (I'd have to learn more Kubernetes).

SSL provided by [CloudFlare][11], which, damn that was easy. There [might be
drawbacks to this][24], however.

## Styles

I read the [CSS book by the authors][16] way back in 2006, when blue beanies
were a thing and web standards was still something of a fight (such was my
perception, anyways). Which is to say, I knew what CSS _looked_ like and `float`
was probably the most advanced thing that I remembered (that, and that to center
something dynamically, was `margin: 10px auto;`).

So when I was rebuilding this, I was looking at other sources and more or less
losing my mind. Has science gone too far? What is this [text-rendering][17]
property? [vh][18] as a length descriptor?!?

I can't say I've really learned this deeply, and you can now see how well I did.
After a bit of bonking my head, I got through this basic process:

* Look at the default Ghost template, Casper. Good demonstration/style-test
  [here][20]. They kindly annotated/explained [its CSS file][21].

* [Some text things to keep in mind][22], re: text on blogs.

I found [this guide][19] (part two [here][23]) a pretty great read on these
topics, too.

## Perf

If you run a site, there's a good chance you can find something you didn't know
by running it through [Google's PageSpeed Insights][12] and [Google's
Mobile-Friendly Test][13]. You should also consider running any PNG's through
[Zopfli][14] or something similar (PNG compression described very well
[here][15]).

One of my favorite people in the space of site performance is [Ilya
Grigorik][25], so I highly recommend checking out his stuff.

This, as the previous section, is _massive_ overengineering for this pathetic
little site, but then you may just smile a bit wider when you look in the mirror
in the morning 😄

## Accessibility

I'm pretty new to this, but it's a good idea to run your sites through something
like [a11y][26], [AChecker][27], or [WAVE][28]. [a11y Project][29] has some
great resources as well.

## In Conclusion

Use Squarespace.

   [1]: https://jekyllrb.com/
   [2]: https://github.com/octopress/octopress
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
