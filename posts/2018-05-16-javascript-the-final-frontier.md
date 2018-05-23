    Title: "What do you think of JavaScript"? 👾
    Date: 2018-05-18T20:19:51
    Tags: engineering
    og_image: https://morepablo.com/img/2018/5/python_environment_2x_THUMB.png
    og_description: JavaScript is a lot to think about

<small><em>🎵 The song for this post is <a href="https://www.youtube.com/watch?v=0tdyU_gW6WE">Bustin'</a>, by Neil Cicierega. 🎵</em></small>

I shared [this talk][1] with a friend of mine who's hoping to make biggers waves
in computing, and he asked me "_what do you think of JavaScript?_"

I believe JavaScript exceeds all other languages in its ability to generate
unproductive conversations; the thought of answering this gives me the
willies. I'm half-tempted to [pull a Kevin Williamson][2] and just never
articulate a clear position to a simple question, sputtering angrily and huffing
if anyone tries to infer meaning from what I say. But that's no fun, I'll try
to answer the question as best as I can.

The short answer is _I don't usually love it; but have loved it before and
most haters are shortsighted._ Let's elaborate, I'll start with the flames,
since that's probably what you're here for.🍿

### Goodness, JavaScript Was Bad

[There are four meanings of `this`][3]. [`var` scoping and function hoisting][4]
have no precedent in any other language I can find (it's usually just called a
scoping bug). Before strict mode, [if you define a variable without `var`][5]
it is _globally scoped by default_. All functions are vararg functions. You have
no integers, all numbers are floats. Null, [the billion-dollar mistake,][6] is
in JavaScript, but there's _another_ value that means nothing, `undefined`.
Implicit casting rules, combined with truthy/falsey values,
[are a legendary hell.][7] `==`, but also [`===`][8]!

And listen: there's a lot of undue hate to JavaScript and its community. But
even if it's a language you use and love, **I can never look at the above and
think "wow, this language is Actually Good.** _No_ language
intentionally has such an abundance of pitfalls and loose correctness criteria;
these things _do_ bite people, cause bugs, hurt products, and are generally a
part of all things any reasonable person calls "bad software."

This isn't to say it's not liveable (we clearly do live with it), but I
don't think I can ever love this language when there's all this mess going on.

#### But it was designed in 10 days!

True! But if I cook a turkey in the oven for half the time, I'm still asking
you to eat a frozen turkey. JavaScript-by-default is a frozen turkey.

#### But [thing you mentioned] isn't a problem anymore because [subsequent library or tool]!

Through [strict mode][38], subsequent ECMAScript revisions, and tools like
[Babel][39], it's entirely possible to write many variations of JavaScript,
including adding checks to ensure you're writing whichever subset you like.

<div class="caption-img-block" style="margin: 25px auto">
<a href="/img/2018/5/js_good_parts.jpg" target="blank">
<img src="/img/2018/5/js_good_parts_THUMB.jpg" alt="JS vs JS The Good Parts. Click for full size." style="margin: 15px auto;" /></a>
<p style="font-style: italic; text-align: center; font-size: small">an old meme</p>
</div>

There's an old joke about Domain-Specific Languages: it's where you program the
app in one language but debug it in another. Even if you have the
opportunity to use fancy whiz-bang Modern JavaScript, you can't get away without
knowing the 10-days subset.

Many companies you'll work at are still using [Backbone][9] or
[Angular 1][10] or whatever tool was popular at the time. You may be maintaining
[CoffeeScript v1][11]! Which was great, but it's also an uncanny valley of
"kinda ES6 but not."

In this way, you still have to know all the pitfalls of the language to
appropriately maintain and debug, since many codebases won't (for reasons of
history or portability) get to take advantage of The New Hotness.

I'll also note that there's setup cost to incorporating all these tools. Ever
seen a [Gruntfile][12] with all the bells and whistles attached? Or were you one of
the cool kids to move to a [webpack][13] file? Or are you the new school using
[Makefiles][14]? The tools may work well together or they may not, but it's always
been non-trivial effort for me to get _the perfect JavaScript project_ set up.

And the [subsequent library or tool] you mentioned? There's usually competition
behind which one to use, and it's normally to add some language feature that
exists elsewhere. Did you pick [TypeScript][15] or [Flow][16]? Cool, you just got types.
Remember when we were fighting over [RequireJS][17] and [CommonJS][18]? Nice,
now you've got modules, until ES6 got [modules][19] (in their defense, C++ still
doesn't have them 😝).

Having to choose between popular competitors and configuring it into a working
build system  goes beyond language features: did you pick [Bluebird][21] or [q][20] for promises?
Ever seen a project with both [`.jshintrc`][23] _and_ [`.jslintrc`][22]? Are you into [Chai][24]
or [Jasmine][25]?  Did you get on the [Bower][26] train when that was the way to
build things? Did you/do you invest in [Brunch][27]? [Browserify][29]?
[Yeoman][28]? Yarn or NPM? And on and on and on… these are all off the top of my
head, and I've never been a full-time frontend dev!

To be clear, ecosystem competition is great, and I **love** most of these tools.
But almost all of those tools are, in my mind, addressing weaknesses in the
language and/or building projects in it, and there is a **lot** of mental
overhead in keeping track of any of them.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">this is
for a server program that&#39;s 328 lines whose job is to serve static files and
mock data.<br><br>we in Node again <a href="http://t.co/Aik5ZzhsB2">pic.twitter.com/Aik5ZzhsB2</a></p>&mdash; 💣 b∀BГO
💣 (@SrPablo) <a href="https://twitter.com/SrPablo/status/652225108799569920?ref_src=twsrc%5Etfw">October 8, 2015</a></blockquote>

### Man, Hating JavaScript is Boring and Tired

At the same time, server developers like me have a terrible habit of being
self-serious and treating their programming like it's Real Programming. The
browser is a fucking nightmare, and developers who build tools and program for
it deserve **massive** commends.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Front
end software development is:<br>- real-time (instant load, 60fps)<br>-
distributed, incremental (synchronize remote data as needed)<br>-
asynchronous<br>- reactive (react to user actions in realtime)<br>Front end
is the hardest kind of dev I do. The folks who do it every day are
heroes.</p>&mdash; Yehuda Katz 🥨 (@wycats) <a
href="https://twitter.com/wycats/status/930463710941872128?ref_src=twsrc%5Etfw">November
14, 2017</a></blockquote>

It's also worth noting that other languages _aren't really aren't much better at
this._ It's hard to complain about build tools when you consider what goes on in
a `./configure` script, or think about trying to produce a project in Python:

<div class="caption-img-block" style="margin: 25px auto">
<a href="https://xkcd.com/1987/" target="blank">
<img src="/img/2018/5/python_environment_2x_THUMB.png" alt="Hell of Python build tools." style="margin: 15px auto;" /></a>
<p style="font-style: italic; text-align: center; font-size: small"><a href="https://xkcd.com/1987/">xkcd</a></p>
</div>

It's worth mentioning that a lot of JS's complexity comes from serving
the most globbed-on, fast-changing, widest-available platform and APIs in
history. JS applications have to make sense of a document model that does
multiple network calls compatible with every possible display size. _Of course_
its got messy bits.

Lastly, JavaScript and its ecosystem has been a boon for bringing new developers
into the industry. I'll take a language with twice as many warts if it could
bring so many wonderful, enthusiastic, brilliant people to modern spellcasting
🧙🏼‍♂️

### What I love about JavaScript

There's one thing I absolutely, positively **love** about JavaScript that
virtually no other mainstream language has: transparent object types. You
can take _any_ object, pass it to `console.log(JSON.stringify(obj));` and
inspect its properties.

In Java you have to you write `toString()`, Python it's
`__str__()`, Ruby it's `to_s`, and in each you have to keep it up to date with
its fields. And you can only really do this with objects you define!

While it's dogma that objects should be opaque and we should operate purely
on interfaces, in practice, when I need to see what's happening, I find this
invaluable. I'm a `printf` debugger through and through.

Similarly, the Chrome and Firefox teams have made extraordinary investments in
developer tools, which make debugging a lot of the hells of CSS and JavaScript
downright fun.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">tickled
and frustrated with how much fun hacking in Node is</p>&mdash; 💣 b∀BГO 💣
(@SrPablo) <a href="https://twitter.com/SrPablo/status/772915110994178050?ref_src=twsrc%5Etfw">September
5, 2016</a></blockquote>

The giant, giant community has produced reams of useful, widely-accessible code.
If someone hasn't written a JavaScript module, you're doing something _really_
obscure.

### More reading

My favorite JavaScript books are [Effective JavaScript][33] by [Dave
Herman][32], and [JS books][31] written by [Reginald Braithwaite][30].

I **love** the web and am glad its winning; the web as a terrible, horrible,
very bad, no-good platform that probably shouldn't have so much power in
execution context is well-illustrated by [this tale][34].

If I could be said to have a JavaScript aesthetic, it's [this, on writing as
little as possible][35]. It links to [this article][36], which I also liked. On
the whole, you can avoid a lot of problems with JS if you merely choose not to
use it. Sticking with HTML + CSS, you get the following for free:

* Fast rendering.
* Accessibility.
* Search indexability.
* Battery-friendly.
* Easy l10n + translatable as a page from a tool.

Similarly, I like the [Vanilla JS][37] splash page 😛

### Related questions I'm not tackling in-depth — rapid fire!

**Common uses of JavaScript?** — adtech is spyware and is ruining society.

**How do you feel about The Most Modern Version of JS?** — it's far too much
like Scala, doing too many things at a time, gives me a headache to read it.

**Subjective gripes or praises do you with JavaScript implementations?** — cooperative
scheduling (vs. preemptive scheduling) is silly in a language with so much
async; ditto Node only running on one core.

**Surprise me** — I use JavaScript in programming interviews; I've internalized its
pitfalls better than Ruby or Python, and since I'm usually doing a rapid-debug
cycle the transparent objects and objects-are-hashes are super helpful to me.

---

I promise I'll blog something unambiguously positive next 😄

   [1]: https://www.destroyallsoftware.com/talks/the-birth-and-death-of-javascript
   [2]: http://nymag.com/daily/intelligencer/2018/04/williamson-wont-answer-questions-about-abortion-punishment.html
   [3]: https://www.quora.com/What-does-this-mean-in-Javascript/answer/Manish-Dipankar-1
   [4]: http://adripofjavascript.com/blog/drips/variable-and-function-hoisting.html
   [5]: http://blog.niftysnippets.org/2008/03/horror-of-implicit-globals.html
   [6]: https://en.wikipedia.org/wiki/Tony_Hoare#Apologies_and_retractions
   [7]: https://dorey.github.io/JavaScript-Equality-Table/
   [8]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Equality_comparisons_and_sameness
   [9]: http://backbonejs.org/
   [10]: https://angularjs.org/
   [11]: http://coffeescript.org/
   [12]: https://gruntjs.com/
   [13]: https://webpack.js.org/
   [14]: https://hackernoon.com/simple-build-tools-npm-scripts-vs-makefile-vs-runjs-31e578278162
   [15]: https://www.typescriptlang.org/
   [16]: https://flow.org/
   [17]: http://requirejs.org/
   [18]: http://eng.wealthfront.com/2015/06/16/an-introduction-to-commonjs/
   [19]: https://www.sitepoint.com/understanding-es6-modules/
   [20]: https://github.com/kriskowal/q
   [21]: http://bluebirdjs.com/docs/getting-started.html
   [22]: https://www.jslint.com/
   [23]: http://jshint.com/
   [24]: http://www.chaijs.com/
   [25]: https://jasmine.github.io/
   [26]: https://bower.io/
   [27]: https://brunch.io/
   [28]: http://yeoman.io/
   [29]: http://browserify.org/
   [30]: http://raganwald.com/
   [31]: https://leanpub.com/b/es6fromfundamentalstofeatures
   [32]: http://calculist.org/
   [33]: http://effectivejs.com/
   [34]: https://hackernoon.com/im-harvesting-credit-card-numbers-and-passwords-from-your-site-here-s-how-9a8cb347c5b5
   [35]: http://www.heydonworks.com/article/on-writing-less-damn-code
   [36]: https://www.smashingmagazine.com/2015/12/reimagining-single-page-applications-progressive-enhancement/
   [37]: http://vanilla-js.com/
   [38]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode
   [39]: https://babeljs.io/
