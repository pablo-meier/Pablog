# Pablog!

My personal blog, generated with [Frog][1]. It's pretty slipshod with some files
in \_src and others sprinkled in at the top-level, but I'll fix it in time.

Video embeds used to be done with Liquid tags, so they're broken. As is much of
the markup, since the [Markdown][2] parser that Frog uses behaves a little
differently than Jekyll, especially regarding linebreaks.

In theory, just install frog and run 'raco frog -bp' from the top level
directory to generate a fresh copy of the site. Uses a nonstandard Bootstrap
theme ("Readability").

   [1]: https://github.com/greghendershott/frog
   [2]: https://github.com/greghendershott/markdown
