    Title: 🖥 Desktop software, tangles 🧵
    Date: 2020-04-04T15:38:22
    Tags: blurb, pablolife, engineering
    og_image: https://morepablo.com/img/2020/4/winamp_THUMB.jpg
    og_description: Read a few articles, brought back software memories on compile times.

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=y8HVG-ERJU0">Hotter Than That</a>, by Louis Armstrong & His Hot Five.</em> 🎵</small>

I saw this fantastic quote on [a roundup of cross-platform GUI frameworks][1]:

> People will say “But there’s WxWidgets, but there’s GTK, but there’s Qt” as if
> someone is looking for ice cream and everyone is going “But there’s frozen
> shoe leather, but there’s frozen peas, but there’s an empty refrigerator”
>
> - /u/shawncplus

I find this true about a lot of problem categories.

Sometimes I get sad that Desktop Software™ is long dead — personal computers are
_ridiculously_ powerful machines (and have been for over a decade!) and we're
either just using the displays ("$3000 Facebook machine") or spend half the
compute on Slack. More and more I'm meeting people who never used software
that ran entirely on a machine that they were also allowed to program.

Someone left a comment I liked a while back: to own a computer but not know how
to program it is like having access to a full pantry and kitchen and only eating
microwave meals. Which, as someone who's only started cooking with my kitchen
and pantry: no judgement! I offer it entirely as a "amazing possibilities open
up" rather than "look at these rubes who don't know better."

Like all things that I miss, it's fine. There are good reasons for it. For
things that don't matter much, getting mad that the world isn't shaped to my
preferences is making the choice to be mad: I either don't understand why things
are that way, or don't want to confront and accept it. And hey, the web-based
world is also pretty great. Until we fully Clear Channel it, anyways.

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2020/4/winamp_THUMB.jpg" alt="Winamp screenshot with a gauche 'winamp skin'." style="margin: 15px auto;" />
<p style="font-style: italic; text-align: center; font-size: small">I try to be suspicious of nostalgia, but I'm sorry, this shit was just fun.</p>
</div>

### Compile times, modularity, tangles

One of the lines in the linked article above is:

> If C++ compile times wouldn’t be measured in hours, half of the the problems I
> have with the existing frameworks would probably go away.

I am… familiar with C++ compile times! My first gig was Flash Runtime at Adobe,
and one of my projects was to investigate why our Linux builds were so slow. In
the spirit of "cross-platform GUI frameworks… what a mess!" one could easily
write a similar post about "cross-platform build tools." The primary platforms
(Windows, OSX) were done with their first-party project files (Visual Studio or
XCode), but Linux and many ancillary platforms (Blackberry's QNX, some
Samsumg TVs) used CMake.

It turns out that the biggest source of compile-time hell for most C++ projects
is… `#include` directives. While C++20 _finally_ had some sense of [modules as a
language feature][3], for most of its 30+ year history, the only way to have
your project across multiple files was _lexical inclusion via preprocessor_ as
inherited from C. For those who don't know: if you `#include "somefile.h"`, the
compiler has to find that file, open it, and read it, and injects its contents
where that directive was.  

As a project gets larger, `#include`s have their own `#include`s, and you end up
creating a nasty web of these things, _each, ostensibly, requiring touching the
filesystem, opening the file, reading the file, doing the appropriate thing in
memory, and closing the file._ While compilers had tricks to skip parts of this,
when you repeat this hundreds of thousands of times, and you can see why build
times slow down. And if you have thousands of files in your compilation graph
that have multiple of these links, you can see how destructuring your program to
minimize `#include` complexity is non-trivial. Especially if, as Flash did, you
have a matrix of supported platforms and products (Windows, Mac, Linux, TVs;
many of them having more than one of: plugins (NPAPI, ActiveX, Chrome Pepper),
Standalone Desktop player, embedded player for the Flash Authoring tool, Adobe
AIR desktop app runtime, and others).

(**also:** given my rants on people saying "simple" in programming contexts,
this is a fantastic example of a "simple" solution that's fucking terrible: you
can't think of a more straightforward modularity construct than "make the
contents of that file visible here," and the most straightforward way of doing
_that_ is "include its contents here." But it turns out these simple
straightforward constructs _get bad, very quickly_ if your project grows to any
real size. Never trust when someone says "simple.")

I was not expecting to run into this ghost when I read about [speeding up
mypy][4] for production code systems, but it turns out the biggest issue was
that Dropbox's Python codebases do a similar thing with Python's similarly
"simple" importing mechanism. And not just Dropbox: [Khan Academy spending
literal months moving files around][5]. Here's [Instagram wishing Python had any
invariants at all][6] on its module loading.  

The mypy article has a good name for this: "tangle." I urge you to be mindful of
them: many languages make them very easy to build and you'll waste far too much
of your life because of them. Ideally, if you know you're going to grow a
product for any real amount of time or staff size, I might suggest not using a
technology that nudges teams to make them. I often say "I don't hate Python, I
just wish people would stop starting companies with it." But if you do, think as
early as possible about dependencies. A little extra thought might save you
hours every week for the project's lifetime.

   [1]: https://blog.royalsloth.eu/posts/sad-state-of-cross-platform-gui-frameworks/
   [2]: https://gyp.gsrc.io/
   [3]: https://docs.microsoft.com/en-us/cpp/cpp/modules-cpp?view=vs-2019
   [4]: https://dropbox.tech/application/our-journey-to-type-checking-4-million-lines-of-python
   [5]: https://engineering.khanacademy.org/posts/python-refactor-1.htm
   [6]: https://instagram-engineering.com/python-at-scale-strict-modules-c0bb9245c834
