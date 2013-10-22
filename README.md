# Pablog!

My personal blog, generated with [Frog][1]. It's pretty slipshod with some files
in \_src and others sprinkled in at the top-level, but I'll fix it in time.

Much of the final output is a bit wonky since Markdown is poorly defined, meaning
the [Markdown][2] parser that Frog uses behaves a differently than the one
Jekyll uses, especially regarding linebreaks.

In theory, just install frog and run 'raco frog -bp' from the top level
directory to generate a fresh copy of the site. Use the `clean.sh` script to
bring it back to normal. Uses a nonstandard Bootstrap theme from Bootswatch
("Readability").

   [1]: https://github.com/greghendershott/frog
   [2]: https://github.com/greghendershott/markdown
