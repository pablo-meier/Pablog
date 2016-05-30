    Title: I like Java fine
    Date: 2015-05-11T20:31:28
    Tags: programming, pablolife

**Statement: I am plenty happy to use Java in a large number of contexts.**

<p style="text-align:center"><em>BANG! BANG! BANG!</em></p>

<div style="width: 600px; margin: 15px auto;"><img src="/img/2015/05/neododge-1.png" alt="Neo dodging bullets" /></div>

Yes, I've read what [jwz][1] and [Paul][2] have written about it. In fact, I
largely agree with all of it.

<div style="width: 600px; margin: 15px auto;"><img src="/img/2015/05/neododge-2.png" alt="Neo dodging bullets, again" /></div>

No, I'm not unqualified to say that. I'm not a defensive graduate from
[a so-called JavaSchool][3], I graduated from [a pretty renown program][4]. Like
many engineers I often doubt my ability, but I've made it on the winning end of
the Google Interview, and have written side projects in Erlang, Go, Racket, and
Ruby. No company has ever fired me for technical ability or lack of contribution
(one laid me off when they stopped making software); most have worked hard to
keep me. It's very, very hard to evaluate engineering ability but for the most
standard (often bullshit) metrics, I pass.

<div style="width: 600px; margin: 15px auto;"><img src="/img/2015/05/neododge-3.png" alt="Neo continuing to dodge bullets" /></div>

I acknowledge that even in the game Java is playing, C# often does it better.
I've never had the opportunity to use C# given it's close association with
Windows and the CLR; no firm I've worked with was using those, and when I choose
technologies for my side projects, I usually use more obscure ones.

<div style="width: 600px; margin: 15px auto;"><img src="/img/2015/05/neododge-drop.png" alt="Neo falls" /></div>

But frankly, I'll go further and say it's a _damn good choice_ for many
modules/projects.

Let's break it down…

<!-- more -->

### Tooling

Except for C++ in Visual Studio ([real one][31], not [the newcomer][30] and again, kept
away from many of us for being Windows-only), there's no other language I've
worked in that has the level of amazing tooling that Java does. Eclipse is a
plagued boat but I've always got it to do what I wanted to after enough
wrangling (it's the IDE of choice at Google, who knows a thing or two about
producing Java code). I prefer Intellij, but the fact that you have two
semantically-aware, highly configurable IDEs with various plugins tells you
there are two more options than virtually everyone else.  

Remember that most of this is tied to what the language allows you to do:
intentional or not, the same things that "limit programmer creativity" in Java
(static type system, module system, JAR format) also enable it build effective
tooling. Top class IDEs in other languages like [DrRacket][13] or [RubyMine][32]
go as far as one reasonably can, but the dynamic nature of those languages makes
it hard to automate many of the analysis tasks.

<blockquote class="twitter-tweet" lang="en"><p lang="en" dir="ltr">might be
faster for me to port this whole codebase over to java and use the refactoring
tools than to try to change this method name in ruby</p>&mdash; Jake Boxer
(@jakeboxer) <a
href="https://twitter.com/jakeboxer/status/524270869443801088">October 20,
2014</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

I'm more than happy to admit ignorance here — there's likely a number of IDEs I
don't know about that are an absolute joy to use, mind-bendingly powerful,
and readily handle industry demands. But in the dozen or two languages I've
written projects in, none except Java and VS have had an extraordinary story
here.

### Performance

This would be a punchline in the late 90's before dynamic languages swept the
planet, but again, compare the landscapes here: for a GC-ed language with memory
safety and a thriving library ecosystem, what beats it in performance? Ruby?
Python?<sup><a href="#pypy">1</a></sup> Node? _PHP?!?!?_<sup><a href="#hhvm">2</a></sup>

The most popular implementations of these languages usually run in a
single-threaded context. Most of them have worse garbage collectors than the
JVM. 

Scala and Clojure are great choices that share similar performance
characteristics by virtue of being on the same virtual machine.

**Let there be no ambiguity:** I'm not saying Java has [BLAST PROCESSING][8] or
anything. If you really want performance to shine in your program, Java isn't
your choice.

_But_, if you're writing your program in Java over the alternatives listed
above, you just won't have to worry about performance as often or as hard as the
other memory-safe GC-ed languages listed above. Look at [Jeff Atwood say that
with the best hardware, Ruby performance is "good. Not great. _Good._"][9]<sup><a href="#cults">3</a></sup>
Programs written in most languages with comparable features to Java require nontrivial
work to speed them up (or minimize their resource use) to match Java's performance
characteristics. You could avoid that trek by just using Java.

(I've avoided mentioning [Go][6] and [Rust][7] because they are delightful,
memory safe languages with decent concurrency stories, modern package managers,
strong industry investment that perform quite beautifully. They can't catch up
on the tooling or ecosystem soon enough!)

### Ecosystem

One of the nicest things about the languages I singled-out above is package
managers. `gem install`, `pip` and `npm install --save` make adding libraries to
your code easy and pleasant.

Luckily, you can get a similar system set up with Gradle and Maven Central. Like
many parts of setting up your Java project, it's a major pain in the ass to get
it running and you'll want to die a little. I mean, just [scroll through the
Gradle User Guide][14] and be horrified by how much Stuff is in Yet Another Build
Language. And wait till you run it for the first time, and get that signature
JVM boot time!

But once you get over the initial hump, it's dead-easy to add code, just like
with the languages above. And there are JARs for everything. [Check out my post
on Android libraries][21] to get a sense of how much of a role it can play in
your development, and Getting Things Done.

##### Sidenote: The JAR format, and there is so much shit is written in Java

I'll make another case here: JARs and Java's tooling are great too in odd cases
where you might want to use an executable as a library. This isn't wholly unique
to Java (lots of npm modules have a command-line mode and library mode), but the
prevalence of many JAR-based tools make this a pretty solid plus. Here's an
example that will probably be it's own post, but briefly:

I'm working on a web app in Erlang, and I need an asset pipeline that will
minify + compress the JS and CSS. The libraries that look best (for my
definition of best) for this look like the [Closure Compiler][15] for JS and
the [YUI Compressor][16] for CSS.  Both are command line tools distributed as
JARs.<sup><a href="#gulp">4</a></sup>

The app does the minification itself (it watches its sources while running and
recompiles/reloads as necessary, a la [sync][18]), but how can it call minification
without starting a new OS process and heating up fresh JVM instance for each case?
Well, the command-line programs are distributed as JARs, which means we can call
its public interface from Java!

Long story short: I have a [Jinterface][19] node running a Java wrapper with both
JARs as dependencies which, like most Erlang nodes, is always running and
listening for messages. I just send an Erlang message to the node like any
other, and the Java program calls the public interfaces in the JARs, as if they
were distributed as libraries.

I do a similar thing with the [owasp-html-sanitizer][20] to make sure any
Markdown submitted by users is safe to display on the site.

All this to say: a _lot_ of code is distributed in JARs, and Java gives you an
easy bridge to most of it, even if they were originally CLIs. 

Unrelated: I love Erlang, but _maybe_ it was a bad choice for the application
logic.

### In defense of idiot-proofing

Most smart devs I know understand that you don't want to be _too_ clever, and
[The Zen of Python][24] very nicely states that "Explicit is better than implicit.
Simple is better than complex." We're all cool with this, and agree with it.

But holding a value dear is very different than actually honoring it, especially
when it's a hard thing to recognize and do. Google, Apple, Facebook &amp;c; will
tell you day and night that they value diversity, but [their numbers are dismal][25]
will likely continue to be, and nobody will be held accountable for it. Even if
you know in your brain that you need to account for something, that doesn't mean
you can or will.

In the talk [What Killed Smalltalk Could Kill Ruby Too][26], Uncle Bob cites Ward
Cunningham as having quipped that "what killed Smalltalk is that it was just too
easy to make a mess."

I say all this to say, **I've cleaned up some gross-ass messes in Node.** I've
_produced_ some gross-ass messes in Racket, Erlang, and others. Truth is, if
you've got a language that is expressive and gives you a lot of power, you can
very well shoot yourself in the foot.

_So many_ programmers who frequent places like HN or /r/programming swallow
Silicon Valley [kid-genius "10x" myths][28], cast themselves in those roles, and
think that they're [_certainly_ beating the averages with the _superior_ language
choices][27] and clever techniques. _Other people_ make messes, but _I'm_ using
abstractions correctly!

Realtalk: have you ever met an Objectivist who believed the whole Ayn Rand
philosophy while not _also_ believing that they are one of Society's Great
Creators And Thinkers? Ever meet one who espouses it enthusiastically followed
by "and I'm one of the inferior moochers, destined to live off the works of the
great ones?" Fucking never. Same thing happens with programmers and the "just
right" level of abstraction: read any HN thread and observe a huge number of
douchenozzles be _convinced_ that they're some unicorn-blooded 10x hotshot, and
the more humble of them merely believe they're fucking brilliant.

All this is a long way of saying — there are silver linings to having your hands
tied in Java. You can [certainly make messes in Java][29]. But a) I feel like
you really gotta work harder to make that mess with your hands tied, and b) with
better tooling, I find it's often easier to navigate anyways.

### A better, more thorough defense by example

Is available [here.][22] It's an excellent series in 3 parts that goes over a
radically different workflow than most people expect when they think of
programming Java. It's also a year old, so I expect a lot has changed!

### It's perfect and I love it forever.

It's not and I _definitely_ don't. But if someone says "I wrote it in Java/want
to write it in Java" and you instinctively roll your eyes because it's not
[Bad Ass Rock Star Tech][23] or "_real_ hackers don't write Java," then grow
up, kid. As with everything, there are tradeoffs galore, and I think you could
do a lot, lot worse.

<p id="pypy"><small><sup>1</sup>: <a href="http://pypy.org/">PyPy</a> makes this tricky, but it too will fail in many cases.</small></p>
<p id="hhvm"><small><sup>2</sup>: <a href="http://hhvm.com/">HipHop</a> makes this tricky too, for similar reasons. But <em>ew</em>, PHP!</small></p>
<p id="cults"><small><sup>3</sup>: At this point I've linked to the Holy Trinity of Tech
Man blowhards: paulg, Jeff Atwood, and Joel Spolsky. I'm a Yegge short of
hitting for the cycle. Please don't take this as an endorsement of their general
views/influence, <a href="http://programmingisterrible.com/">tef</a> covers them pretty well in his <a href="https://www.youtube.com/watch?v=csyL9EC0S0c">talk, "programming is terrible: lessons learned from a life wasted."</a></small></p>
<p id="gulp"><small><sup>4</sup>: Peanut Gallery will mention maybe throwing in a Grunt/Gulp script to uglify or
something… I don't want to introduce another language into the build process; if
you've ever worked with Erlang you know deployment is still very much in 1986.
The developers behind <a href="http://www.rebar3.org/">rebar3</a> have expressed an
interest in eliminating the need for external build commands like the old practice
of a rebar.config + Makefiles, and I'd love to abide as long as I can.</small></p>

   [1]: http://www.jwz.org/doc/java.html
   [2]: http://www.paulgraham.com/javacover.html
   [3]: http://www.joelonsoftware.com/articles/ThePerilsofJavaSchools.html
   [4]: http://cs.brown.edu/
   [6]: http://golang.org/
   [7]: http://www.rust-lang.org/
   [8]: https://www.youtube.com/watch?v=zlulSyBI2aY
   [9]: http://blog.codinghorror.com/why-ruby/
   [13]: http://racket-lang.org/
   [14]: http://gradle.org/docs/current/userguide/userguide_single.html
   [15]: https://developers.google.com/closure/compiler/
   [16]: http://yui.github.io/yuicompressor/
   [18]: https://github.com/rustyio/sync
   [19]: http://www.erlang.org/doc/apps/jinterface/jinterface_users_guide.html
   [20]: https://github.com/owasp/java-html-sanitizer
   [21]: http://morepablo.com/2014/12/tech-of-sup-android-libraries.html
   [22]: http://blog.paralleluniverse.co/2014/05/01/modern-java/ 
   [23]: https://www.youtube.com/watch?v=bzkRVzciAZg
   [24]: https://www.python.org/doc/humor/#the-zen-of-python
   [25]: http://www.bizjournals.com/sanjose/news/2014/08/13/a-guide-to-how-apples-diversity-figures-stack-up.html?page=all
   [26]: https://www.youtube.com/watch?v=YX3iRjKj7C0&feature=youtu.be&t=21m18s
   [27]: http://www.paulgraham.com/pypar.html
   [28]: https://modelviewculture.com/pieces/hacker-mythologies-and-mismanagement
   [29]: http://docs.spring.io/spring-framework/docs/2.5.x/api/org/springframework/aop/framework/AbstractSingletonProxyFactoryBean.html
   [30]: https://www.visualstudio.com/products/code-vs
   [31]: https://www.visualstudio.com/vs-2015-product-editions
   [32]: https://www.jetbrains.com/ruby/
