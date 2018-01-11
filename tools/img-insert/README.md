# img-insert

Statically generated sites are cool but when combined with Doing Images on the
Internet there are some hackles that I could use computers to fix.

## Hackles

First, if you want the image to have a thumbnail and full-size: you could just
download the whole thing then use CSS to adjust the width, but I like what
Blogspot did and had a small version embedded that you could click through for
the full-size.

So for every image, you probably want it in two sizes.

Then you have to put it in the correct `static` directory.

Then you have to link to it correctly, with an `<a>` tag to link to the
full-size image.

Then you have to generate the markup for a caption if you want a cute one.

Finally, you want those images optimized for the internet.

`img-insert`, does as much of this as possible for you.

## Running

`img-insert <filename>`

Dependencies:

- You'll need `magick` as a shell command (ImageMagick, you can `brew update &&
  brew install imagemagick`).
- You'll want `jpegtran`, which is already installed on Macs IIRC.
- [`optipng`][2] (`brew install optipng` works).
- Ditto being on a UNIX-ey enough system to `cp` to shell because OCAML IS
  AWESOME AND DOESN'T HAVE SIMPLE FILE COPY. They _do_ have unlink and rename
  though, oddly 😛

## Use

`img-insert <file>` will, by default:

- Create a `static/img/<year>/<month>/<file>` directory structure if it doesn't
  exist (so you can easily `cp -r static/* <dest>/static/*`).

- If the image is wider than we want to allow our max width (say, 800px), we 
  - use [ImageMagick][1] to resize the image to the max width
  - place another copy of `<file>` in the new directory, so there's `<file>` and
    `<file>_FULL`

- Write to stdout markup that you can paste in the post, like

```
<div>
<a href="PATH_FULL" target="_blank"><img src="PATH" alt="FILLME" style="display: block; margin: 10px auto" /</a>
<p style="text-align: center; font-style: italic; font-size: small">Caption me</p>
</div>
```

## Eventualities

- Support multiple images to make an album or somesuch.

## OCaml?

Yeah why not.

**Edit:** oh right lol.

## Reading

reading:

- https://developers.google.com/web/fundamentals/performance/optimizing-content-efficiency/image-optimization
- https://developers.google.com/web/fundamentals/design-and-ux/responsive/images#images-in-markup
- https://developers.google.com/speed/docs/insights/OptimizeImages
- https://gist.github.com/ryansully/1720244

Tools:
- http://www.lcdf.org/gifsicle/
- http://jpegclub.org/jpegtran/
- http://optipng.sourceforge.net/
- https://pngquant.org/
- https://www.imagemagick.org/script/index.php

   [1]: https://www.imagemagick.org/script/index.php
   [1]: http://optipng.sourceforge.net/
