    Title: GC, Continuations, Ruby Internals
    Date:2010-02-24T12:34:00
    Tags: pablolife, engineering, plt

When I was about 6, I told my mom I wanted to be a garbageman when I grew up.
I mostly just liked the truck, and hanging from the side  of it while it drove
from house to house.

**Garbage collection still fascinates me.** I found [this talk on Ruby's
garbage collector][1] of great interest. While we program with abstractions to
make application development easier, the sad fact is that it still helps you
avoid shooting yourself in the foot to know how your languages features are
being implemented. Even if it didn't, wouldn't you be curious?

This is also a great example of a poor (or simply inflexible) design choice
having major consequences down the road. In the talk they explain how Ruby's
_conservative, stop-the-world mark and sweep_ collector can't really be
replaced by other, more efficient collectors due to the representation of
objects. Personally, I'm partial to generational stop-and-copy's; but it only
showed up in the talk as an impossibility. The best they could do was curb
their lame mark-and-sweep (also Python uses reference counting lol).

I dropped a lot of jargon there; for any curious folk, I can explain what they
mean in a later post ^\_^ I'll spend the remainder of this one talking about
another Ruby feature whose underlying implementation destroyed my algorithm.

---

Ruby is one of the few languages to support [continuations][2] out-of-the-box
(in Ruby 1.8 anyways, in 1.9 you have to `require continuation`). The presence
of continuations are a sign of flair: when a designer has worked to put it in
the language (Matz called it the [hardest language feature of Ruby to
implement][3]) they are pretty much telling you they are committed to writing
a flexible, powerful language that lets the programmer do whatever they want.
Naturally, when I see a use for them, I use them.

Kent Dybvig shows us that [continuations can be implemented to be very
efficient.][4] Unfortunately in Ruby, they aren't: like the GC,
**continuations are implemented in about the most bare-bones way possible.**
In Ruby, they implement a continuation by copying the entire program stack in
its current state and storing it elsewhere. When you call the continuation,
they copy back the old stack over the current one.

Here's the problem: I wrote a program to push the current continuation onto a
stack before every call to the recursion. The idea was to use the
continuations to keep track of backtracking over several parameters, and the
stack meant you would only call as many as you needed.

The problem was, _every recursive call increased the size of the stack, since
Ruby doesn't support tail-call optimization._ So at every recursive call, you
would copy over the entire stack somewhere in memory, augment it, and recur.
DEATH!

Needless to say, I found another solution. But this was another example of how
the implementation of a feature can make the feature usable or not. Had I
implemented the same algorithm in Dybvig's Chez Scheme, with both tail-calls
and efficient continuations, this algo would have sailed.

---

Coming back full circle, there was a time when I considered peeking into the
Ruby source and forking it to support Dybvig's stack frame model (gutting the
whole language primarily to support... _continuations?_). Looking at the
object representation from the GC talk though, it's probably much harder than
I imagined ^\_^.


   [1]: http://timetobleed.com/garbage-collection-slides-from-la-ruby-conference/
   [2]: http://en.wikipedia.org/wiki/Continuation
   [3]: http://www.infoq.com/interviews/yukihiro-matz-language-design
   [4]: http://lambda-the-ultimate.org/node/3527
