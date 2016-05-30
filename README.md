# Pablog!

Repo for [personal blog][3], generated with [Frog][1]. It's… not updated and/or
as technically cool as it should be, for a Professional Software Developer.

Much of the final output is a bit wonky since Markdown is [very poorly defined,][4]
meaning the [Markdown][2] parser that Frog uses behaves a differently than the one
Jekyll uses (most of this was done before [CommonMark][7] was a thing. To make
matters worse, many of these posts come from the an export of my old
[Blogger site][5], which output yet another idea of what Markdown should be.

Building it sucks, but I'm making it better! You need [Racket][9], to get
[Frog][8], to build it in `build/` then you have to copy `static` into that. The
single-task Makefile does this.

To run it in Docker, see the Dockerfile, which assumes `make` was run. Earlier
revisions have Docker do those steps too, but that leads to a pretty fat image.

Uses a nonstandard Bootstrap theme from Bootswatch ("[Readable][6]") with a
custom color scheme, until I get fed up and change it.

   [1]: https://github.com/greghendershott/frog
   [2]: https://github.com/greghendershott/markdown
   [3]: http://www.morepaul.com
   [4]: http://johnmacfarlane.net/babelmark2/faq.html
   [5]: http://littleschemer.blogspot.com
   [6]: http://bootswatch.com/readable/
   [7]: http://commonmark.org/
   [8]: https://github.com/greghendershott/frog
   [9]: https://racket-lang.org
