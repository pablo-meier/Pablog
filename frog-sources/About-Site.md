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

I used to do something ridiculous, which was host this on Google Cloud (my old
team!) using Kubernetes. I did this mostly because this site is a safe sandbox
to futz around with things I want to learn, and I had no experience with
containers. Prior to that it was on a Linode; I left after they were supremely
embarassing about security. I used [CloudFlare][11] for easy SSL. There [might
be drawbacks to this][24], however.

Nowadays, I use a full AWS stack of S3, CloudFront, and Route 53. A decent guide
to do this is [here][32].

Note that if you want to add [HSTS][37] with this stack, it's a bit more
cumbersome than using CloudFlare as I did before, when I was hosting this on a
running nginx container. Julia Evans [explains the basics of the tech here][34],
and this posts [explains how to do it in this stack here][35]. If you're feeling
so empowered, check your site [Mozilla Observatory][36].

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

Frog uses Bootstrap by default, but I went with [Foundation][33] since I knew it
better.

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
   [32]: https://stormpath.com/blog/ultimate-guide-deploying-static-site-aws
   [33]: https://foundation.zurb.com/
   [34]: https://jvns.ca/blog/2017/04/30/using-strict-transport-security/
   [35]: https://nvisium.com/blog/2017/08/10/lambda-edge-cloudfront-custom-headers/
   [36]: https://observatory.mozilla.org/
   [37]: https://en.wikipedia.org/wiki/HTTP_Strict_Transport_Security