    Title: An anecdote on runtimes
    Date: 2017-06-05T22:15:00
    Tags: engineering, plt

<div style="max-width: 300px; margin: 20px auto; text-align:center">
<img src="/img/2017/06/adobe_air_logo.jpg" alt="Adobe AIR!" style="display: inline;" />
</div>

My first gig was working on [Adobe AIR][10], a (comparably) little-loved app
runtime that was ahead of its time; I'd argue its fate as a faded silhouette of
its potential was, as with most products, due to People Issues and changes in
the context, in this case related to Macromedia's acquisition that touched
everything in the Flash family, and [many of the same "world changed around us"
issues that hit Windows Vista][19]. But that's a deeper post for another time
that I'm absolutely not qualified to write. Here, I just want to go into a
cute engineering anecdote that tickled me.

**Note that all the following is entirely from memory; this was also my first
gig out of college and I'd only been coding about 2 years, so please take this
as lightheartedly as I'm writing it!**

<!-- more -->

<h3 id="actionscript">ActionScript</h3>

First, some background: Flash allowed users to write scripts in a language that
resembled JavaScript called ActionScript. Then they made a second version, so
they called that resulting language [ActionScript 2][3] ("AS2").

Later, Adobe made a good-faith effort with [one of the major good-faith players
in the industry][5] to marry Flash and the web [by powering Flash with next
version of Firefox's Javascript VM][4]. That's right: it was that Hater Of The
Open Web, Adobe, who was making their for-profit proprietary product
interoperate seamlessly with the VM of a corporation [who's entire ethos was
based on radical open source.][6]

This all happened, naturally, before [_Thoughts On Flash_][7] was published.
There's a lot that's correct about that essay but the fact that anyone viewed
its contents (and notable omissions) as anything but naked business tactics is a
reminder to me why we can't have nice things.

The punchline, of course, is that [ECMAScript Revision 4 never accepted by the
browser vendors,][8] By that time Adobe had already built it into their product
and written things like [GUI Toolkits][9] around it. So Mozilla didn't
incorporate Tamarin, and Adobe rebranded it as ActionScript 3 (AS3).

<h3 id="the-product">The Product</h3>

You also have to understand what AIR was: I say "ahead of its time" because it
was essentially a more featureful [Electron][1]. It's very goal was to make
desktop app development accessible to web and Flash developers. They did this by
adding desktop APIs (file access, chromeless windows, printer dialogs, etc) to
Flash technologies _and an entire WebKit instance._ Meaning if you wanted to,
you could absolutely build a desktop app in HTML + CSS + JavaScript and
distribute it cross-platform.

<small>(reminder that this was **much** less fashionable before Node + NPM ate
the world, before Angular/React, and when the person pushing it was Adobe
instead of Facebook or GitHub).</small>

The more popular option was to leverage Flash's cross-platform consistency and
either author your app in the [Flash Authoring][11] tool or write an AS3 app.

Famous apps using Adobe AIR include Pandora, the League of Legends out-of-game
client (where you could buy skins, chat with friends, etc.), You Need A Budget.

<h3 id="about-the-internals">About the internals</h3>

The last prerequisite knowledge needed is to know a few things about how the
Flash VMs achieved backward compatibility: every instance of the Flash Runtime
had _two VMs_ in it: one for AS2 and one for AS3. When it encountered a source
file, it'd check which version the file was, then pass it off to one VM or the
other.

Type annotations in AS3 were optional, so while the following code was valid:

```
var i = 40;
```

unlike previous versions of ECMAScript, you could write

```
var i : int = 40;
```

Given this, a few Adobe engineers found they could make the VM _significantly_
faster if it had all the type annotations, so they set to work on a VM called
AS3' ("AS3 prime") that would be yet another code path for a version to take.

<h3 id="finally-the-anecdote">Finally, the anecdote</h3>

When you have an AIR app on your desktop, how do you support all of this? Well,
naturally, you have a copy of your three VMs for you Flash code: AS2, AS3, and
AS3':

<div style="max-width: 700px; margin: 20px auto; text-align:center">
<img src="/img/2017/06/basic_VMs.png" alt="Three happy VMs" style="display: inline;" />
</div>

But remember, we have WebKit there too, since this is for web developers and we
want to support those technologies.

**But!** What kind of Adobe product would have a web browsing experience
_without Flash?_ Supposed you were a developer who already have a Flash site; if
you ran it in the WebKit mode, it should work as before, right? It'd be
downright shameful for Adobe to ship this unless the WebKit bit worked the way
Adobe wanted a web browser to work. So we embedded the Flash web browser plugin
into the WebKit instance. And that plugin had another copy of the runtime, with
three more VMs:

<div style="max-width: 700px; margin: 20px auto; text-align:center">
<img src="/img/2017/06/with_npapi_plugin.png" alt="Six nervous VMs" style="display: inline;" />
</div>

_**But!**_ What does a web browser do when it runs into a PDF? Browsers have
better answers to this now, but back in these days, they'd open whatever program
or plugin you had installed. And Adobe has a plugin for that!

Also, did you know that [you can embed Flash files in PDFs][12]? And that
_that's_ a separate build of the Flash guts<sup><a href="#fn1" id="ref1">\[1\]</a></sup>?
Meaning you have:

<div style="max-width: 700px; margin: 20px auto; text-align:center">
<img src="/img/2017/06/with_acrobat_plugin.png" alt="NEIN HAPPY VMs" style="display: inline;" />
</div>

So in the spirit of [the old rhyme][2]:

> As I was going to St. Ives,
> I met a man with seven wives,
> Each wife had seven sacks,
> Each sack had seven cats,
> Each cat had seven kits:
> Kits, cats, sacks, and wives,
> How many were there going to St. Ives?

How many ActionScript VMs do you have in here?  **At least 9**. Also, for a
while, we were going to add a fourth, AS4 (or AS Next). I left in 2012, and [it
looks like that got cancelled in early 2013][20].

<h3 id="other-fun-facts">Other fun facts</h3>

AIR wasn't a tiny runtime (a couple dozen MB if I remember correctly); but
almost all of its disk size came from embedding WebKit. This was also when
WebKit powered Chrome (pre-Blink), so it was used by a larger share of people.

Flash Platform powered _a lot more_ products than most people realize: even for
the web browser case most people know, they're unaware there was an [ActiveX][14]
version of the plugin, an [NPAPI][15] plugin, and a [Pepper][16] plugin.

On top of the plugin to render content in web browsers, there was also a
Standalone player (an app you could run on your desktop), the External player
(embeddable in other apps, this is what Flash CS used to preview a stuff in the
program), AIR, APE (the little-known [Adobe Platform for Embedding][13]),
the Acrobat plugin renderer.

Naturally these all had to work on Windows (XP, Vista, 7; win32 and winRT), Mac
(OS X, but a surprising amount of OS 9 support was still there when I joined),
Linux (LOL, but mostly Ubuntu), [QNX][17] (used mostly by RIM for a few failed
devices; I love when people in suits make deals), Android (it was a
differentiating feature!), iOS (**wait, what?** yeah kids, [you can put AIR apps
on iOS][18]), and Samsung TV. These are just the ones I can remember 5 years
later, I could be forgetting some and/or they could have added more.

👆🏼 Most of these had at least three of Firefox, IE, Safari, and Chrome. Each
of _those_ has various versions.

(I'll also note this is where I saw the most impressive inheritance graph and
build files I've ever encountered)

Flash wasn't perfect, but it worked quite reliably on all of them. Good times 😄

<h3 id="big-thanks">Big Thanks</h3>

If you take anything away from me mentioning Adobe time, I want to make
something **1000%** clear: Adobe is a fantastic company with brilliant, kind
people and I can't have asked for a better first gig. Flash was an extremely
impressive product and codebase; it was a real privilege getting to work on it.

---
<p id="fn1">[1.] This is absolutely not a security nightmare.<a href="#ref1" title="Jump back to the text">↩</a></p>

   [1]: https://electron.atom.io/
   [2]: https://en.wikipedia.org/wiki/As_I_was_going_to_St_Ives
   [3]: https://en.wikipedia.org/wiki/ActionScript#ActionScript_2.0
   [4]: https://www-archive.mozilla.org/projects/tamarin/
   [5]: https://www.mozilla.org
   [6]: https://www.jwz.org/blog/2016/10/they-live-and-the-secret-history-of-the-mozilla-logo/
   [7]: https://www.apple.com/hotnews/thoughts-on-flash/
   [8]: https://www.quora.com/Why-was-ECMAScript-4-ES4-never-implemented-outside-ActionScript-3-at-Adobe
   [9]: http://flex.apache.org/
   [10]: http://www.adobe.com/products/air.html
   [11]: http://www.adobe.com/products/animate.html
   [12]: https://helpx.adobe.com/acrobat/using/adding-multimedia-pdfs.html
   [13]: https://blogs.adobe.com/csupdates/tag/ape/
   [14]: https://en.wikipedia.org/wiki/ActiveX
   [15]: https://en.wikipedia.org/wiki/NPAPI
   [16]: https://developer.chrome.com/native-client/pepper_stable
   [17]: http://www.qnx.com/content/qnx/en.html
   [18]: http://www.adobe.com/devnet/air/air_for_ios.html
   [19]: https://hackernoon.com/what-really-happened-with-vista-4ca7ffb5a1a
   [20]: http://www.yeahbutisitflash.com/?p=4812
