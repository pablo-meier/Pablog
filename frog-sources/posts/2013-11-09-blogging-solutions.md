    Title: Blogging Solutions
    Date: 2013-11-11T16:07:19
    Tags: culture, meta

A friend recently asked for some advice regarding blogging solutions, and I
realized it's a pretty big space. Here's some advice after a few years of
blogging, a bit of experience with blogging engines, and general technical
proficiency.

<!-- more -->

### First, about blogging

[tef][1] is one of many programmers to make the observation that if a
problem is 90% social and 10% technical, programmers will spend most of their
time trying to solve the technical portion of it.

Similarly, everything I'm going to say doesn't change the fact that **the core challenge of blogging is writing consistently.**
At the end of the day, _none_ of what follows matters if you don't want to write
something from time to time, actually go on to write it, and stick with it. If you
don't or won't enjoy writing for what it is, none of the features of the products
below will change that.

Many of my friends have aspired to be novelists or screenwriters and formed strong
opinions on MS Word vs. [Scrivener][2] vs. [CeltX][3] vs. [Final Draft][4] vs.
[WriteRoom][5], but at the end of the day, they didn't actually... _write_ much. Same
with programmers who will tell you why Their Tools or Their Methodologies are so
much better for writing software, and yet, they seem to spend more time arguing
their preferences than writing software.

So take all that follows with a grain of salt. One of the best things about
blogging is how lo-fi it is: displaying words is the one thing
the Internet has always been good at. If you have a delicious ice cream
sundae and just need help selecting the bowl and cherry, let this be a guide, but
don't hold any illusions that the tools are anything other than ancillary.

But if you're into details -- ahoy!

### For virtually everybody: out-of-the-box, externally hosted, dynamic blog engines.

For pretty much everybody, I'll recommend **[WordPress][6]** or **[Blogger][7]**.
**[LiveJournal][8]** fits in this category too, but its [got some issues][17].
All of these are the least-hassle ways of hosting a simple blog because they have
the properties in the headline. What do those words mean?

* **Out-of-the-box**: You needn't do anything with HTML or configuration -- they've got a product running, and for your blog they'll just spin up a new one. They have a myriad of themes and styles that you can use freely, and IIRC most can be customized with sidebars and plugins that allow you to drag-and-drop as widgets.

* **Externally hosted**: Almost nobody knows what a server is, and fewer people care to pay for or take care of one. Spare yourself the hassle.

* **Dynamic**: Accept the heinous, unbearable penalties of waiting for a database read and never wait for your site to "generate" or compile. If you don't know the difference between static or dynamic sites, well, exactly. You don't need to, just know that this is less waiting between editing your post-in-progress and being able to see it :)

Examples of sites on WordPress are [Jamie Zawinski's][9] blog and [Charly Evon Simpson's][10]
page. An example of a Blogger site would be the [the former host to this one][16], or
[if you can read this, you're lying][31].

### The Happy Hacker: Self-hosted, dynamic product-based solution

For most of my hacker friends who might want to run a server sometime (try it!
It's super fun and instructive!) I'd recommend doing a self-hosted install of a
major product, like [WordPress](http://wordpress.org) (different site than above)
or, if you're feeling like trying the new up-and-comer, [Ghost][12].

These have almost all the advantages of the above platforms, but are much more
customizable. I ran a self-hosted WordPress install for More Paul for 2-3 years
in college. Most of its artifacts are sadly lost to history (a time before I
learned version control, and big hosters like GitHub/BitBucket didn't exist.
Wayback Machine has [some][13] [archives][14]\*), but my memory is that it was
extremely pleasant and easy, and I recommend anyone who has a bit of technical
proficiency give it a try.  

An example of the customization possibilities are in the Wayback archives above -- I
wanted to use "code aesthetics" as the theme of that site, so I wrote a PHP
function to operate on the titles and dates of the posts after a redesign. The
function would do things like change "The Gum Thief" to `def the_gum_thief() {`,
and "July 18, 2008" to `setDate( 18-07-2008 );`. Since these were ostensibly
part of the layout (still server-side, so bad for SEO I'm sure), I could revert
the WordPress theme and get human-readable titles again.

<small>(it looked better back then to 21 year-old Pablo, trust me)</small>

An example of Ghost is my friend [Adam Zethraeus' site][18], whose first post is
exactly about using Ghost.

### The command-line masochist -- static blog generators.

Maybe the title's a little harsh, but these days the trend is to go with static
blog generators: [Jekyll][20], or its popular wrapper, [Octopress][21], usually
hosted on [GitHub Pages][22]. Static blog generation is the route I've chosen to
go with, using [Frog][23].

Self-identified Hackers love these solutions because:

* We can use the same tools to blog that we do to program. Especially when you publish to GitHub pages, you're pretty much just editing text files and pushing them using Git. It's a very natural workflow for us. I'm writing this in Vim -- [it looks like this!][34]
* Everything is in files. A dynamic site usually uses some SQL backend, which has repercussions, like having to use a certain HTML editor for your posts, formatting (bolds, italics) being proprietary to the system, and exports/imports being difficult due to however they like to format the content. Moving a site is a pain in the ass, with database schemas and configuration files abound. Here, you just copy a directory with all your source, another that can be generated to 'publish.' This also makes backups **much** simpler.
* Total customizability, with no runtime cost. If you were writing PHP to make changes to your posts in one of the above solutions, you're taking that performance hit at runtime for every request made on your server. Frog defines a [bunch of widgets][26] that simplify things you want on your site, and Jekyll [allows Liquid templates][27] so you can program and simplify any components of your blog.
* A static process also gives you a proper "build" step that allows you to make whatever changes you want at any stage of the game. Check out the source for this site: all the CSS files I use were consolidated, compressed, and inlined to minimize rendering time (see [this talk][28] by Google Performance Engineer [Ilya Grigorik][29]). While the final site is fast, I get to develop it using the abstraction of multiple files: the consolidation happens [as a build step][30].
* All the major static generators use [Markdown][24]. This is great because it's easy to type and read!!!!!

So why do I say it's the masochist route? A few reasons:

* [Markdown sucks][25]. Virtually every Markdown parser does things slightly differently, so when I wanted to move this blog from Octopress to Frog, it ended up breaking virtually all of my posts. Like UNIX, Markdown is good enough to do the job, but bites you every chance it gets.
* Live preview is pretty nice, and you miss it. While I love typing big long things into Vim, as soon as I want to add a picture of a YouTube video, or just see what my prose looks like as you will read it, I have to rebuild, wait, _then_ see.
* Site building times. Most of these tools are written in Ruby, this one is in Racket (much faster, but hardly bLaZING-SPeeD!). There's just no getting around the fact that reading _n_ files of Markdown to generate _f(n)_ pages of HTML every time you build will perform _g(f(n))_ operations on your filesystem. It doesn't scale particularly well. Incremental builds are hard, since every time you add or change a post, the nature of index pages and RSS means you're always reading all the posts and usually building many.

All this to say: I love me my Frog, but I would never suggest this (or a similar
workflow) for anybody who didn't love process. 

### Conclusion

I'm probably missing some solutions (hybrids? other major products?), but these
are what I've used over the years. Short answer: use WordPress. Self-host it if
you're into that kind of thing. If you love hacking but hate life, give
static generation a shot.

---

\* = If anyone wants to see any **real** old Pablo blogging, my first foray into
it was a [LiveJournal account][15] I had as a freshman in college. Like most of
artifacts from my youth, it's cute, and painfully earnest. I mean, really, look
at this:

<img src="/img/2013/11/wii.png" alt="groan" />

or this:

<img src="/img/2013/11/wisdom-teeth.png" alt="groan again" />

But then again, I did write some things that I'm very glad to find again, like
this bit on [my immediate motivations to leave college theatre][19], as it was
happening.

Tons of my friends (understandably!) delete or remove blogs or YouTube videos from
their past that demonstrate they weren't the people who they are now. I keep it
up there, thinking there might come a time when I hate myself less.

   [1]: http://programmingisterrible.com/
   [2]: http://www.literatureandlatte.com/scrivener.php
   [3]: https://www.celtx.com/index.html
   [4]: http://www.finaldraft.com/
   [5]: http://www.hogbaysoftware.com/products/writeroom
   [6]: http://wordpress.com/
   [7]: http://www.blogger.com/
   [8]: http://www.livejournal.com/
   [9]: http://jwz.org/blog/
   [10]: http://charlyevonsimpson.com/
   [12]: https://ghost.org/
   [13]: http://web.archive.org/web/20080723191834/http://www.morepablo.com/
   [14]: http://web.archive.org/web/20090815185343/http://www.morepablo.com/
   [15]: http://ilcapitano.livejournal.com/
   [16]: http://littleschemer.blogspot.com
   [17]: http://jwz.livejournal.com/1448545.html
   [18]: http://zethrae.us/
   [19]: http://ilcapitano.livejournal.com/48152.html
   [20]: http://jekyllrb.com/
   [21]: http://octopress.org/
   [22]: http://pages.github.com/
   [23]: https://github.com/greghendershott/frog
   [24]: http://daringfireball.net/projects/markdown/syntax
   [25]: http://johnmacfarlane.net/babelmark2/?normalize=1&text=-+top%0A+-+indented+one%0A++-+indented+two%0A+++-+indented+three%0A++++-+indented+four%0A+++++-+indented+five%0A
   [26]: https://github.com/greghendershott/frog/blob/master/frog/widgets.rkt
   [27]: http://jekyllrb.com/docs/templates/
   [28]: https://docs.google.com/presentation/d/1IRHyU7_crIiCjl0Gvue0WY3eY_eYvFQvSfwQouW9368/present
   [29]: http://www.igvita.com/
   [30]: https://github.com/paul-meier/Pablog/blob/16da3a09e275d764c01f4c593e9d96178d8cd8ca/tools/page-scrubbers/productionize.rkt
   [31]: http://ifyoucanreadthisyourelying.blogspot.com/
   [34]: /img/2013/11/vimshot.png
