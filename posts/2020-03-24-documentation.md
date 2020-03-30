    Title: 🤓 Documentation 📕
    Date: 2020-03-24T21:56:46
    Tags: blurb, culture, programming
    og_image: https://morepablo.com/img/2020/3/cobol_on_cogs_THUMB.png
    og_description: Thinkin' about docs.

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=JktLeUkmGLg">Street Life</a>, by Randy Crawford.</em> 🎵</small>

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2020/3/cobol_on_cogs_THUMB.png" alt="Screenshot for the joke project COBOL ON COGS." style="margin: 15px auto;" />
<p style="font-style: italic; text-align: center; font-size: small">It was the
lack of available docs that prevented me from running <a href="http://www.coboloncogs.org/HOME.HTM">COBOL ON COGS</a></p>
</div>

These blog posts can just be called "Pablo reads and appreciates Hillel Wayne,"
who published [another piece I loved on documentation in Markdown.][5] Namely,
if you're writing code docs, consider using something other than Markdown.
Hillel wrote this on his mailing list and not his blog, but for the second time
it was posted to an aggregator, [which doesn't seem to be his target audience
for these writings][7], where the most common criticism is "well, a lot of
people wouldn't write it in anything _but_ Markdown. Would you rather it didn't
exist at all?"

Which… I guess? Maybe? Obviously user experience and friction matters, but often
when people say "worse is better" reflexively, I hear it as the ["good things
aren't possible"][8] of programming culture. IMO, to fixate on that is to miss a
lot of good material. 

Here are some thoughts about documentation that this got me thinking:

**Docs are great canary for issues in programming culture because they're very
low-tech, while _so not_ a solved problem.** In fact, I don't think we can agree
on good solutions to the problem are! Hillel's criticisms seem to be looking at
_functionality_ of the documentation: can you view it offline? Is it easily
readable, searchable, and can you reconfigure it to your tastes? For every post
on "how to supercharge your Vim," how many have you read from people who take
_reading and using docs_ seriously? How about making them? Do you know
[Javadoc][13] conventions?  [Ocamldoc][14] conventions? Have you run into
limitations generating them before? Does it make sense to make them
language-specific, or would it make sense to do something like the [Language
Server protocol][15] for them?

For a while I tried [Dash][9], an offline-enabled documentation viewer and
snippet manager. It seems great! I downloaded some docs and learned a lot of
Clojure on a train once. I stopped mostly because I didn't let the habit stick,
but was stopping really a great move? How many times have I had to lookup
Python's `mock` library with the Google intermediary lol.

How does documentation (consuming or generating) play well with your tools? I
often think about [Gary Bernhardt's text editor in A Whole New World][10] with
features like "integrates with Sentry/Rollbar to jump to unresolved exceptions"
or "integrates with Stash or Splunk to where errors were logged." What tools
would and could we build if we really _used_ documentation. How could we quicken
the turnaround when you need to look something up?

Additionally, how can we make them more collaborative? Bryan O'Sullivan wrote
two great books in the early parts of the last decade, on [Haskell][16] and
[Mercurial][17]. If you click into any chapter, you'll see expandable comments
under each paragraph—while writing, people left feedback he could incorporate
into subsequent revisions. How can we make _updating_ docs painless?

A hot take: devs don't read documentation almost ever. This isn't to blame them:
docs aren't always great, understanding anything interesting is hard, and you
can often get results without deep reading or thought. This is a bit in
line with the transition from "understand the program and all its components
well" to "poke it until it does what you need" [which transitioned
MIT from SICP in Scheme to their new curriculum in Python.][12] What are the
causes and consequences of this? What happens when we change variables on how
easy or hard it is to read or produce docs?

Examples in documentation say 1000 words, what more can we do here? Elixir
[will run tests in your docs][11] to ensure that your docs don't lie. I can't
find the link, but there are projects that search open source code for uses of
a library in the wild and collect them, so you can see it used in real
projects.

idk man, there's so much here!! Why do we have jobs?! Let's just noodle on this
and related problems! _throws papers into the air_

   [5]: https://buttondown.email/hillelwayne/archive/please-dont-write-your-documentation-in-markdown/
   [7]: https://lobste.rs/s/xski3m/donald_knuth_was_framed#c_qzix67
   [8]: https://twitter.com/internethippo/status/881161169469403137?lang=en
   [9]: https://kapeli.com/dash
   [10]: https://www.destroyallsoftware.com/talks/a-whole-new-world
   [11]: https://elixir-lang.org/getting-started/mix-otp/docs-tests-and-with.html
   [12]: http://lambda-the-ultimate.org/node/5335
   [13]: https://www.oracle.com/technetwork/java/javase/documentation/index-137868.html
   [14]: https://caml.inria.fr/pub/docs/manual-ocaml/ocamldoc.html
   [15]: https://langserver.org/
   [16]: http://book.realworldhaskell.org/read/
   [17]: http://hgbook.red-bean.com/read/
