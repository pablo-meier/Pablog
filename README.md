# Pablog!

Repo for [personal blog][3], generated with [Frog][1]. It's pretty slipshod, a
website in transition!

Much of the final output is a bit wonky since Markdown is [very poorly defined,][4]
meaning the [Markdown][2] parser that Frog uses behaves a differently than the one
Jekyll uses, especially regarding linebreaks. To make matters worse, many of
these posts come from the an export of my old [Blogger site][5], which output
yet another idea of what Markdown should be.

To run it, you just need Racket. The Makefile at the top level is a wrapper for
an in-progress Racket script I'm writing that will do minification and the like,
and it expects a copy of Frog in it's directory, since I'm hacking on that as
well.

Uses a nonstandard Bootstrap theme from Bootswatch ("[Readable][6]") with a
custom color scheme.

   [1]: https://github.com/greghendershott/frog
   [2]: https://github.com/greghendershott/markdown
   [3]: http://www.morepaul.com
   [4]: http://johnmacfarlane.net/babelmark2/faq.html
   [5]: http://littleschemer.blogspot.com
   [6]: http://bootswatch.com/readable/
