    Title: Languages to describe Languages
    Date:2010-07-06T11:03:00
    Tags: pablolife

We're in a beautiful, exciting, and unsustainable time in programming languages.
For any combination of features you could want, someone's made or
making an interpreter/VM for you. Want dynamic message passing and objects
(but Objective-C doesn't give you enough functional features)? Try
[Newspeak][1]. Want Ruby syntaxed immutable objects with Erlang's concurrency
model? Try [Reia][2]. Hell, did you Perl programmers feel left out of the JVM
after the success of [Jython][3] and [JRuby][4]? Someone made a [JVM-styled Perl called Sleep.][5]

I remember wondering what my contribution could be and thinking _I love Ruby
programming, with true object-orientation, but miss ML/Haskell type systems
and inference. What if I could make a concise, type-inferred Object-Oriented
language?_ Then I found [Scala][6] had already been made.

<!-- more -->

Reading so many new language pages, I notice that lots of older languages
getting referenced to describe the current one. Carlos Fuentes pointed out
that Guatemala used to be called "The Paris of the Americas" (he also pointed
out that France did not return the favor and call Paris "The Guatemala of
Europe"), and there are a few specific languages that get to be Paris most
often.

The ones I see most are...

* **Smalltalk**. When you see this it normally means the referencing language has dynamic message passing, or _actual_ object-oriented programming where everything is an object (Recall C++/Java/Objective-C have primitives). <br /><br />  What they _don't_ mean, which is a major part of Smalltalk culture, is programming in 'an image.' Newspeak, mentioned above, runs on [Squeak][7], the open-source image-based Smalltalk development environment. I've never developed in an image so I can't really speak for it, but for those more comfortable with files, there's [GNU Smalltalk,][8] which I finally got running.

* **Self**. It's kind of funny seeing this get so much love, after Javascript got so much hate. But apparently prototypical objects are all the rage, with projects like [Io][9], [Neko][10], and [Slate][11]. This usually means supporting [Prototype-based objects][12].

* **Lua**. This seems to mean "will be well-executed, lightweight, and hopes to get used in industry!" Feels like name-dropping when I see it.

* **Lisp**. I think this just means "feels flexible," since the defining feature of the myriad of Lisp languages is homoiconic syntax, allowing for rich macro programming. Using "Lisp" as a signpost is a little lame since, if you had it homoiconic syntax, it would make your language a Lisp. Using "Lisp" in place of better terms reminds me of terms like ["strong typing."][13] _Murrrrrr..._

To go with the flexible vibe, they probably also mean dynamic types + garbage
collection, which Lisps did pioneer way back when. But those features are
everywhere now.

What languages do you _never_ see anymore? [Prolog][14], [Forth][15] (except
the very nice-looking [Factor][16]), or [Eiffel][17]. That's too bad, these
had some fun ideas.

What language feature/system do I feel needs to make a resurgence? Proper
module systems, like [SML.][18] I find most module systems a royal pain, and
SML is no exception. But once you figure it out, you really can (provably!)
'program in the large.'

Finally, what hope is there for us polyglots to do development in these
languages? Aside from [LLVM][19], maybe there's a good graduate research
project-in-waiting trying to bridge the gap between these guys.

That's enough bloviation for now. Now let's write some code.


   [1]: http://bracha.org/Site/Newspeak.html
   [2]: http://wiki.reia-lang.org/wiki/Reia_Programming_Language
   [3]: http://www.jython.org/
   [4]: http://jruby.org/
   [5]: http://sleep.dashnine.org/
   [6]: http://www.scala-lang.org/
   [7]: http://www.squeak.org/
   [8]: http://smalltalk.gnu.org/
   [9]: http://iolanguage.com/
   [10]: http://nekovm.org/
   [11]: http://slatelanguage.org/
   [12]: http://en.wikipedia.org/wiki/Prototype-based_programming
   [13]: http://www.morepablo.com/2010/06/type-systems-from-1000-feet-high.html
   [14]: http://en.wikipedia.org/wiki/Prolog
   [15]: http://www.forth.org/
   [16]: http://factorcode.org/
   [17]: http://stackoverflow.com/questions/43713/what-do-you-think-about-the-eiffel-programming-language
   [18]: http://en.wikipedia.org/wiki/Standard_ML#Module_system
   [19]: http://llvm.org/
