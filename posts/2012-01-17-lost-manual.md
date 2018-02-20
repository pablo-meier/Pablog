    Title: Testing, and the lost art of the manual
    Date:2012-01-17T12:00:00
    Tags: pablolife, culture, engineering, rants, essay

I hate to be GrandPaul, the old curmudgeon who hates things that just
ain't the way they used to be. But I've decided to touch webdev for
[ScrabbleCheat][15] and by jove, I feel those RoR kids have jumped the
shark. Forget [TDD][2]; that shit is so _passe_. These kids practice
_[BDD][1]_, with [Cucumber][3] and [RSpec][4].

Let's make a few thing clear here: Unit Testing isn't the end-all,
be-all of automated software verification. BDD seems to be a perfectly
noble attempt to address many of its shortcomings, or if I may go so
far, addressing the "failed promises" of TDD. Some of those promises
(and how BDD helps solve them include):

<!-- more -->

* **Unit testing, on its own, helps you _validate_ your code, but does
  little to help you _understand_ its purpose.** Anybody who wastes
  enough time on Hacker News or Proggit has read the mandatory article
  claiming that Unit Tests _are_ your documentation, but it doesn't take
  long for this to break down. What about the 92% of TDD practitioners
  who, at some point, broke down and wrote code before tests just that
  once (and again and again)? What about all that semantically useless
  boilerplate (all the Mock libraries, all the fixtures, what have you)?
  At the very best you have verbose, very technical and
  implementation-obsessed documentation only your coders can read.<br /><br />
  Sure, by being executable and by having very wide coverage, Unit tests
  can help the technically-savvy person see, after some scrutiny, just
  how the application works. But this doesn't describe what _it
  does_. BDD rectifies this by separating the specification of the
  behavior (what behavior you are testing) with the implementation of
  how you test it, and achieves this further (in the RoR world, anyways)
  with a butt-ton of fancy DSLs to make your tests read like English.

* **TDD is a boon to the developer, but the benefits aren't directly known to the client.**
  RoR folks, moreso in my anecdotal observation
  than most other types of devs, love to talk about what tools they're
  using, usually much more than the projects they're working on. So
  while they can circlejerk to _each other_ about how great their
  methodology is and what gems they're using, how much better would it
  be if they could include the person footing the bill, and give them
  that extra-personal experience? <br /><br />
  I only mention this because everytime Cucumber lists its advantages,
  it's always mentioned that you can show your _cukes_ (Feature
  Definition files) to the clients and they will be able to read and
  understand it, even as nontechnical people. So that's a weakness of
  unit testing, I guess -- you can't show _that_ typing to the clients
  and it be anything meaningful.

I bring all this up because, well, I'm trying to get on this train and
I'm finding it a bit of a pain in the ass. There are two major reasons
for it, one the current Ruby ecosystem in particular, and the other
simply being skeptical of the whole approach in the first place.

<h3 id="bdd-in-ruby-today">BDD in Ruby, today</h3>

Despite my seething cynicism, I'm working through it and giving it a
try. Hell, the only reason I joined Twitter was because, four years
ago, I was getting angry at its very existence, feeling that "Web 2.0"
had brought us to such a shallow, useless service. Then I realized I
was sounding like my (awesome, wonderful) Luddite father, so I signed
up immediately. 2500 tweets later, I love it. So maybe (and I still
believe this) I'll come around and preach this the way the Ruby kids
do these days.

But where to start learning? I looked at RoR years ago, back when we
were all still using [Test::Unit][5], I understand MVC, but wanted to
do things _right_ this time. So I read about RSpec and Cucumber, go to
their respective websites, and try to write my first cukes and
specs. The first thing you notice is that they both use DSLs. I know
me plenty of Ruby, but when all your examples look like

    Feature: An online spittoon which allows users to spit at the monitor for fun and profit

    Scenario: Spittoon graphics
    Given that my website is operational
    And that the user is full of saliva
    Then that user may spit upon the screen
    But not upon the keyboard
    And a bucket will appear to receive the spit

    Scenario: Proper spittoon sounds
    Given that the user has spit upon the screen
    When the user spits on it
    Then it should make a great "ding!" sound

It's not obvious where the code comes in. Or what the rules are for
writing these files. Similarly, RSpec shows you tons of files like

    describe Spittoon do
        subject { :spittoon }
        it "should take spit in the monitor" do
           visit("./")
           subject.should receive_spit
        end
    end

All of this is well and cute, so you ask yourself, "where is the DSL
reference so I can write my own?"

No really, where is it? Because I still haven't found it. I'm looking
all through the interwebz, but neither Cucumber nor RSpec have a
definitive listing of their DSLs. There are a few half-baked
tutorials, some Wikis on the Github pages, and while they all describe
these technologies on a very shallow level, they barely answer my
questions. When you run `rspec` from the command-line, where is it
looking? Same with `cucumber`? How should all the components fit into
the Rails app? Where is a _full_ specification of the DSL? What
capabilities of the browser does [Capybara][18] emulate? And where's
_its_ DSL reference?

To contrast, there's _no shortage_ of press pages and splash pages
telling me how this will add business value, how easy they are to use,
how they all play well together, how they'll turn you into a rockstar
ninja coder that makes makes clients happy. I'd believe them, but if I
want to read _how_ you'll redirect me to a dozen scattered wiki links
and shallow blog posts with toy examples.

Funnily enough, the best source of information is to dive into source:
the kind of thing these tools are supposed to prevent.

Well, that's not quite true. Because for $25 you can buy [The RSpec
Book][6]. Or [the Cucumber book][7], for another $25. Note that many a
Rails book carries a list price of [$40][20]-[$50][19]. Yes friends,
you can have a decent serial, instructive reading experience that
doesn't involve navigating disjointed wiki tabs if you pay up. All the
refrains about how Java was as good for the publishing industry as it
was for the software industry come back. PragProg is a house built
on their Ruby + Rails books. Never mind that the reviews for the books
state that they are mostly out of date (all the examples use Webrat,
not Capybara) or also only contain only trivial, toy examples. You
can't really blame them, it's part of the limitation of the dead tree
business. But you know what can solve this? A good, freely available
manual.

I can learn a mainstream language from 1995 (Ruby), I can leverage
existing programming experience from several other languages and
projects, but when Rails apps use a component list reminiscent of
[The Startup Guys](http://youtu.be/LMmdl4VltD4)
("So I'm using Cucumber and RSpec with Rails with a
dash of Factory Girl to practice BDD, with Launchy and Capybara since
I think TDD and Webrat are dead.") there a real need to ensure that,
if you rely on DSLs, the barriers to entry are low and the ability to
learn is high.

To compare to another learning experience I'm having, I've picked up
emacs. I've been a Vim user for the past 3 years, but felt like I wanted
to taste the forbidden fruit and so have started doing all my text
editing in Emacs (this post was written in Emacs). I was off the ground,
blown away by some of the capabilities in less than a day. I was using
[SLIME][9] to run excercises in [PAIP][10] in less than a day, filled a
few TODO lists in [org-mode][16], and found a redundant `import` using
[Erlang-mode][17]. And d'you wanna know how I did it?

I downloaded SLIME... and the manual. I downloaded org-mode... and the
manual. I downloaded Emacs... and the manual. When I need to know
something, it's in there. But now, I'm feeling less friction learning
one of the most bloated and feature-packed pieces of software in history
than I am trying to get a basic site up in Rails, using the community's
idioms and best practices.

At RailsConf 2009, Robert Martin gave a great talk titled ["What
killed Smalltalk could kill Ruby, too"][11], and he highlights
properties of the Smalltalk culture before it died: a bunch of very
talented, smug programmers who were sure they would inherit the world
because their tools were so much better than the competition. You can
ask the Lisp guys how that worked for them, too. But at the end of the
day, Rubyists: try not to make too much of a mess, since for every
person like me who comes along to join the party, 10 won't stick
around past this frustration as I have. Do the dirty work and write a
damn manual, preferably downloadable as a PDF.

<h3 id="on-bdd-generally">On BDD, generally</h3>

All that being said, I can't help but be skeptical about the advantages
of BDD in the first place. A lot of it is well said in [this blog
post][12], but I feel like BDD doesn't offer a whole lot of advantages
over TDD, and the criticisms of TDD seek a more powerful answer.

I listed two criticisms at the top of the post. Tackling them in
reverse order:

* As my smarmy description made clear, nontechnical clients shouldn't
  touch (or have a need to see) the executable bits of your testing
  unless they really want to. If I want to hand my clients a list of
  requirements to confirm that I understand them, I'll write them a
  proper document thank you very much, not send them a bunch of
  braindead-sounding cukes, since I don't think it'll be of any
  consolation to them that I'm "running" that document. **Write cukes
  for yourself it if helps you, but don't put them in the client's
  face since, frankly, I doubt they care. If they seem to care, they
  probably want something better suited for their needs.**

* The second, more compelling point, on specification
  vs. implementation. Here there is fertile ground to improve upon
  unit tests, but I think it would be by abandoning the developer
  writing an implementation in the first place. Many languages now
  have tools like Haskell's [QuickCheck][13] or Erlang's [PropEr][14]
  where you declare the properties of the function you test, and the
  language can generate hundreds of random test inputs, usually
  finding a lot more corner cases than you expected. We automate
  building our software, we use fuzzers to find corner cases we didn't
  expect in security, why not automate the drudgery of coming up with
  unit tests?

  Bryan O'Sullivan (of [Real World Haskell][22] fame) had a zinger of
  a comment in [an article describing BDD][21]:

> Oh wow. I never knew that Rubyists had a Cobol fetish. I think I
> liked my brain better when it didn't contain that knowledge.

It just feels like so much typing for not much power. "Natural"-sounding
executable text doesn't strike me as a critical gain on the weaknesses of TDD.

Despite all my grousing, I'll stick through it. Watch me write a blog
post in a few months swearing by it, like my Twitter conversion. Just
wanted to get this off my chest.

   [1]: http://en.wikipedia.org/wiki/Behavior_Driven_Development
   [2]: http://en.wikipedia.org/wiki/Test-driven_development
   [3]: http://cukes.info/
   [4]: http://rspec.info/
   [5]: http://ruby-doc.org/stdlib-1.9.3/libdoc/test/unit/rdoc/Test/Unit.html
   [6]: http://pragprog.com/book/achbd/the-rspec-book
   [7]: http://pragprog.com/book/hwcuc/the-cucumber-book
   [9]: http://common-lisp.net/project/slime/
   [10]: http://norvig.com/paip.html
   [11]: http://blip.tv/railsconf/railsconf-09-robert-martin-what-killed-smalltalk-could-kill-ruby-too-2099970
   [12]: http://www.jackkinsella.ie/2011/09/26/why-bother-with-cucumber-testing.html
   [13]: http://www.haskell.org/haskellwiki/Introduction_to_QuickCheck
   [14]: https://github.com/manopapad/proper
   [15]: https://github.com/paul-meier/ScrabbleCheat/
   [16]: http://orgmode.org/
   [17]: http://www.erlang.org/doc/apps/tools/erlang_mode_chapter.html
   [18]: https://github.com/jnicklas/capybara
   [19]: http://www.manning.com/katz/
   [20]: http://www.amazon.com/dp/1934356549/ref=asc_df_19343565491864467?smid=ATVPDKIKX0DER&tag=hyprod-20&linkCode=asn&creative=395093&creativeASIN=1934356549
   [21]: http://www.randomhacks.net/articles/2009/04/30/rspec-cucumber-book-recommendation
   [22]: http://book.realworldhaskell.org/
