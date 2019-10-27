    Title: Mark Mode tutorial
    Date: 2019-10-10T01:23:26
    Tags: engineering, culture
    og_image: https://morepablo.com/img/static/mark_sprite.png
    og_description: A tutorial on how to Mark Mode your site.

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=OPf0YbXqDm0">Uptown Funk</a>, by Mark Ronson feat. Bruno Mars.</em> 🎵</small>

Users today expect you to keep up with changing trends; and these days, users
want the option to navigate your product in _Mark mode._ This step-by-step
tutorial will teach you how to activate Mark mode on your site!

If you want to see it in action, activate it here! (you'll probably want to
refresh the page to actually, uh, read the article, if you're not one of those
Mar[kc]-loving users).

<button id="markActivate" style="margin: 15px auto;">MARK MODE</button>

### Overview of the process

Remember the goal of Mark Mode:

> _For every letter i, dot the i with the head of a famous /Mar[ck]/_

CSS is extremely powerful: we can do custom bullets for our lists with
[`list-style-image`][1]:

<div class="caption-img-block" style="margin: 25px auto">
<a href="https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-image" target="blank">
<img src="/img/2019/10/custom-bullet.png" alt="Demonstration of custom ul bullets in CSS, with little rockets for space launches." style="margin: 15px auto;" />
</a>
</div>

And we can do _all sorts_ of amazing things with shapes, as evidence by [A
Single Div][2]:

<div class="caption-img-block" style="margin: 25px auto">
<a href="https://a.singlediv.com/" target="blank">
<img src="/img/2019/10/single-div.png" alt="A grim reaper, drawn only with CSS on a single div." style="margin: 15px auto;" />
</a>
</div>

There's not yet a CSS property that provides custom dots on i's. So we need to
do it ourselves.

### Find the i's

For this, we'll use Javascript. We'll do a tree descent into the DOM, and for
any text nodes, use regular expressions on their contents. If we find i's, we'll
surround them with custom `<spans>`. The whole thing looks like this:

<pre style="background-color: #ededed; font-size: 0.8em"><code>
function markMode() {

  function getRandomWithin(min, max) {
    return Math.floor(Math.random() * (max - min) + min);
  }

  function wrapInSpans(textNode) {
    let text = textNode.nodeValue;
    if (text.trim() == '') {
      return;
    }

    const regex = /[i]/g;
    let replacementText = "";
    let startIndex = 0;
    while (regex.exec(text) !== null) {
      replacementText += text.substring(startIndex, regex.lastIndex - 1);
      let identifier = getRandomWithin(0, 10);
      replacementText += `&lt;span class="mark-i"&gt;&lt;span class="mark-dot-${identifier}"&gt;&lt;/span&gt;i&lt;/span&gt;`;
      startIndex = regex.lastIndex;
    }
    replacementText += text.substring(startIndex);

    let replacement = document.createElement('span');
    replacement.innerHTML = replacementText;
    textNode.replaceWith(replacement);
  }

  function markModeRecursive(element) {
    element.childNodes.forEach((child) => {
      if (child.nodeType == Node.TEXT_NODE) {
        wrapInSpans(child);
      } else {
        markModeRecursive(child);
      }
    });
  }

  markModeRecursive(document.querySelector('body'));
}
</code></pre>

This takes markup that looks like

```
<h1>Try it today!</h1>
```

and transforms it to:

```
<h1><span>Try <span class="mark-i"><span class="mark-dot-9"></span>i</span>t today!</span></h1>
```

### Style them

Meanwhile, in our CSS, we'll style the classes we've attached to our spans. Each
`mark-dot-n` class has a common set of rules:

<pre style="background-color: #ededed; font-size: 0.8em"><code>
.mark-dot-0,
.mark-dot-1,
.mark-dot-2,
.mark-dot-3,
.mark-dot-4,
.mark-dot-5,
.mark-dot-6,
.mark-dot-7,
.mark-dot-8,
.mark-dot-9 {
  display: inline-block;
  background: url('/img/static/mark_sprites_smol.png') no-repeat;
  overflow: hidden;
  text-indent: -9999px;
  text-align: left;
  z-index: 999;
  position: absolute;
}
</code></pre>

These point to a [CSS sprite sheet][3], a very old technique that was popular in
the HTTP/1 days, where we had to minimize requests, and CSS background images
were a popular way to style text (it was all over the [CSS Zen Garden][4] to get
fancy fonts for your headlines, for example).

Here is our sheet of Mar[ck]s:

![](/img/static/mark_sprites_smol.png)

If you want to see larger Mar[ck]s, I had an older version that used bigger
heads. "DK mode" for my little Mark Mode project:

![](/img/static/mark_sprite.png)

These get pretty easy to generate with a site like [this][5].

Finally, either manually (or generated from the link above), you give individual
offsets for each Mar[kc] on the sprite sheet. I also added some negative margins
for top and left to place it roughly over the letter. Mine looks like this:

<pre style="background-color: #ededed; font-size: 0.8em"><code>
.mark-dot-0 { background-position: -2px -0px; width: 20px; height: 23px;   margin-top: -13px; margin-left: -10px; }   /* bismarck */
.mark-dot-1 { background-position: -24px -0px; width: 20px; height: 29px;  margin-top: -13px; margin-left: -10px; } /* marc andreeson */
.mark-dot-2 { background-position: -46px -0px; width: 20px; height: 26px;  margin-top: -13px; margin-left: -10px; } /* marc anthony */
.mark-dot-3 { background-position: -2px -25px; width: 20px; height: 24px;  margin-top: -13px; margin-left: -10px; } /* marc maron */
.mark-dot-4 { background-position: -46px -28px; width: 20px; height: 22px; margin-top: -13px; margin-left: -10px; } /* marc cuban */
.mark-dot-5 { background-position: -24px -31px; width: 20px; height: 28px; margin-top: -13px; margin-left: -10px; } /* mark mcgrath */
.mark-dot-6 { background-position: -2px -51px; width: 20px; height: 28px;  margin-top: -13px; margin-left: -10px; } /* mark ruffalo */
.mark-dot-7 { background-position: -46px -52px; width: 20px; height: 21px; margin-top: -13px; margin-left: -10px; } /* mark twain */
.mark-dot-8 { background-position: -24px -61px; width: 20px; height: 27px; margin-top: -13px; margin-left: -10px; } /* mark zuckerburg */
.mark-dot-9 { background-position: -46px -75px; width: 20px; height: 28px; margin-top: -13px; margin-left: -10px; } /* oh hi mark */
</code></pre>

And violà! Mark mode, and happy users!


   [1]: https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-image
   [2]: https://a.singlediv.com/
   [3]: https://css-tricks.com/css-sprites/
   [4]: http://www.csszengarden.com/
   [5]: https://css.spritegen.com/
