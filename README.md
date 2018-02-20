# Pablog!

Repo for [personal blog][3], generated with something I wrote. It's… not updated
and/or as technically cool as it should be, for a Professional Software Developer.

I mostly use this to play with tech as I like; we push to S3 now.

## Prerequisites

* Install [AWS command line tools][5] (and, naturally, that you have it
  configured/authenticated for your AWS account).
* Ensure, when running commands, that the following env vars are set
  - `AMAZON_DISTRIBUTION_ID` -> to push changes to S3.
* See `tools/push_site.sh` to see how to push to S3.

## Design

I describe a lot of the technical choices behind this blog on [this static
page][6]. I also talk about my relationship to blogging over the years on [this
page][7].

## Bugs

Omd doesn't respect self-closing tags as HTML, relies on a close to read it as
HTML.

   [1]: https://github.com/greghendershott/frog
   [2]: https://racket-lang.org/
   [3]: https://morepablo.com
   [4]: https://docs.racket-lang.org/frog/Quick_start.html#%28part._.Installing_.Frog%29
   [5]: https://aws.amazon.com/cli/
   [6]: /frog-sources/About-Site.md
   [7]: /frog-sources/posts/2013-11-09-blogging-solutions.md
