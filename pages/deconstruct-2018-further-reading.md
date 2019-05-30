# "A Fresh Look At Failure" — Further Reading

**Note: if you _haven't_ seen the talk yet, there be spoilers here! It goes a
few places and I encourage you to wait until you see it or it goes online before
reading any further!**

**But, if you have seen it (or don't care about spoilers), here are some
resources after-the-fact.**

---

If you're into whitepapers, you'll probably like [Crash-Only Software][18],
which illustrates the concepts I alluded to very well.

I credited the medical metaphor ("software with an immune system") to Fred
Hebert, who's produced _a ton_ of things that I think are worth reading. If you
like talks: [The Zen of Erlang][1], where he illustrates much about fault
tolerance and why Erlang is well-equipped to deal with it, and [The Hitchhiker's
Guide to the Unexpected][3], which contains a great problem walkthrough
demonstrating the "design for failure" that supervisors allow.

If you like not-talks he also made them into blog posts with the slides:
[The Zen of Erlang][2] and [The Hitchhiker's Guide to the Unexpected][4].
There's also the talk [Everything Is Terrible][13] (not in a video, sadly) which
I largely agree with, and it's where I got the "comically large queues" joke
from, albeit in a slightly different context.

He also wrote Erlang's [how I start][5], which demonstrates writing a basic Erlang
program with tests, a build file, making it a library, and building a release
with it. He also worked as one of the engineers behind [rebar3][6], which made the
Erlang build tool story a whole lot easier.

If you want to learn Erlang, he wrote the books [Learn You Some Erlang For
Great Good][7], a wonderful and complete book explaining the various features of
the language and its standard library, and [Erlang In Anger][8], "a little
guide about how to be the Erlang medic in a time of war."

Bodil Stokke, who has a ton of experience in many different languages, gave the
keynote at an Erlang conference [describing what it seems like from the outside.][14]
One takeaway is something I've observed: Elixir's onboarding and tools are
_much_ smoother in the general case. Since it's built on many of the same
abstractions, if you find any of this Erlang stuff too much but still want to
push through, it might be worth giving a look to Elixir!

If you want a blog post with a great description of what Erlang and its runtime do
well, Evan Miller wrote [a great summary][9] of its unique charms, and [another
extolling the virtues of the VM][10], using Elixir as its example. Since I
opened the talk with a comparison to Go, Evan also wrote [his impressions on
Go][11], which I found humorous with reservations.

Joe Armstrong is probably the most visible of original Erlang implementers, and
he gives a ton of talks, many I like, like ["The Mess We're In"][15]

[Erlang: The Movie][17] is cute and the source of many Erlang memes. If you
hear Erlangers say "Hello Robert" / "Hello Joe," it comes from here 😄

Lastly, [here was my CFP submission video][19]. Tell me whether what you saw
stuck to its promises, and how well!

---

With _all that said_, the final punchline was sincere! I'm not telling you to
rewrite everything in Erlang or Elixir! I mostly wanted to introduce and extoll
recovery-oriented programming more generally 😛

The other big theme was that "freshness" came to me in a language as old as I
am. Bret Victor has a great talk called ["The Future of Programming"][12] where
he talks about computing's bright future from the perspective of 1970s, mostly
showing a lot of those "uneaten desserts" I was alluding to.

   [1]: https://www.youtube.com/watch?v=4ZIPijEqrNI
   [2]: https://ferd.ca/the-zen-of-erlang.html
   [3]: https://www.youtube.com/watch?v=W0BR_tWZChQ
   [4]: https://ferd.ca/the-hitchhiker-s-guide-to-the-unexpected.html
   [5]: https://howistart.org/posts/erlang/1/index.html
   [6]: https://www.rebar3.org/
   [7]: http://learnyousomeerlang.com/content
   [8]: http://www.erlang-in-anger.com/
   [9]: https://www.evanmiller.org/why-i-program-in-erlang.html
   [10]: https://www.evanmiller.org/elixir-ram-and-the-template-of-doom.html
   [11]: https://www.evanmiller.org/four-days-of-go.html
   [12]: https://www.youtube.com/watch?v=8pTEmbeENF4
   [13]: https://ferd.ca/tout-est-terrible.html
   [14]: https://www.youtube.com/watch?v=INR05pntXnk
   [15]: https://www.youtube.com/watch?v=lKXe3HUG2l4
   [17]: https://www.youtube.com/watch?v=xrIjfIjssLE
   [18]: https://www.usenix.org/legacy/events/hotos03/tech/full_papers/candea/candea.pdf
   [19]: /files/2018/2/pablo_meier_deconstruct.mp4
