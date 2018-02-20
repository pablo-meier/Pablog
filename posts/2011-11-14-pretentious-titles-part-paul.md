    Title: Pretentious Titles and Pedantry, Part Paul
    Date:2011-11-14T12:00:00
    Tags: pablolife, engineering


Here's a long overdue post: what the hell is up with the title to your earlier
post, mainly the term [_observational indistinguishability?_][1] I admit to
indulging a bit; I'll try my best to explain the term here since it
right well blew my mind when I learned it.

<!-- more -->

Observational Indistinguishability, as it sounds, is the principle of two
or more entities being indistinguishable from each other (you can't tell which
one is which) by any amount of observation. It's really just a more formal way
of saying a group things are equal in any way that matters. The magic of this is
that the extra formality (that _OI_ it is not the same thing as equality) is
absolutely critical. I'll show why, using two examples in CS.

The first is **pseudorandomness**. This is a word everybody says colloquially,
probably unaware that it means something very precise, and solves a major
theoretical hurdle of cryptography.

That hurdle is this: most crypto constructs need random data in many places, but
how do you reliably, consistently get a truly random stream of data? The short
answer is that you can't: every method of gathering the random data will contain
patterns that 'leak' from whatever method you used. An example of this is
pulling numbers out of your head: you may _think_ they're random, but if you do
it for long enough, you'll start falling into human behavioral patterns that a
smart-enough person can predict your next number with better odds than they
would if it were actually random. Even if they couldn't immediately, there's no
proof that they would never be able to if they're given a long enough time. And
saying its 'mostly random' without qualification isn't good enough: In the Game
of Cryptography, you win or you die!

So cryptographers got smart: they just lowered the bar to something that's
just as good, in practical terms. Rather than demand _actual random data_, they
created _pseudorandom functions_ which, while provably not actually random,
can also be proved to show that any polynomial-time function (computer-speak for
"any computer program on all the world's computers for several lifetimes") could
never tell the difference\*.

And with that, a bunch of slacking cryptographers eagerly lost their excuse to
sit on their asses, and went on to build secure cryptosystems and hash functions
on top of a mathematically precise "random enough data." Remember: even though
we _know_ it's not random, it really doesn't matter because we couldn't tell the
difference even if we tried.

The second example is more meaningful though, because it's a bit more general:
it comes from my Programming Languages seminar, where we frequently reasoned
about the semantic meaning of programs using [operational semantics][2]. You'd
frequently get a program written one of a few ways and ask yourself questions
like "what does it do," or "how can we add X feature to the language and
preserve all the previous properties?"

To do this, you'd have to understand what a program is doing in relation to
another program written with the same rules. Here's an example: are two
functions equal, in terms of their semantic content? Do they do the exact same
thing, from an inputs/outputs point of view? This isn't a trick question, answer
the best you can and you're probably right:

    function example_one() {
        var x = 4;
        return x + 1;
    }

    function example_two() {
         return 4 + 1;
    }

The answer is yes, they are equal in terms of meaning, but here's the real
problem: what does 'equal' mean? Any attempt we had a class reverted to
intuition ("come now, we all know what it means") or synonyms ("when they are
the same. And they are the same when they are... equal...").

Observational Indistinguishability lets us come up with a suitable definition
without having to resort to defining equality. In this case _they are
observationally indistinguishable when for all programming contexts in the
language, they will both evaluate successfully or they will both fail to
evaluate_.  In other words, for a set of evaluation rules _M_, two programs are
'unequal' if you could write a program using _M_ such that one of your functions
will run to completion, but the other will "crash" and fail to evaluate. If you
can't produce such a program, they are "equal."

Lets try now with two unequal functions:

    function example_one() {
        return 4;
    }

    function example_two() {
         return 3;
    }

Now these are clearly not equal, but let's show this without the notion of
equality. We'll construct a program works when under one function, but not the
other. Simple enough\*\*:

    function test() {
        return 1 / (4 - example());
    }

If you're using `example_one()`, the program crashes (evaluation is
impossible), while `example_two()` hums along smoothly. Since were created a
context where one example evaluated and one didn't, we know that these provide
semantically different behavior. A few things to note about this:

* It makes no constraints on syntax, or even the specifics of evaluation rules:
  so long as a set of rules exists, this definition works for any program
  written with those rules.
* It puts the focus of equality on the meat and bones of the language: the
  evaluation rules and its primitive operations. `example_one()` and
  `example_two()` would actually appear equal if the language, for example,
  didn't support division, and instead only supported addition and subtraction
  between numbers. To you, as a language engineer, this makes you wonder what
  the point of including numbers or addition in your language is at all when the
  difference between 3 and 4 can't crash any program you can construct in it.

So to come back full circle, I just thought [original story][1] was cute because
a very studied, full-of-ideas dramaturge got played so hard by a process that
was the result not of equality of scripts, but observational
indistinguishability, which makes me wonder how important dramaturges are to the
process to begin with.

\* = A little disclaimer: they didn't prove that no polynomial time function
could _ever_ stop it, just that if anybody could come up with a way to do it,
they'd first have to solve a Famous Unsolved Problem We're Pretty Sure Doesn't
Have An Answer, like [discrete logarithm][3].

My friend made a joke on cryptography proofs: "We haven't proved they can't
be broken, just that nobody has done it yet. By this logic, _I'm immortal!_"

\*\*= IIRC, Javascript implementations represent all their numbers as floats,
meaning `4 - example_one()` might actually not be 0, but some very very small
number, and the program won't crash. Ignore, please.

  [1]: http://morepablo.com/2011/03/an-anecdote.html
  [2]: http://en.wikipedia.org/wiki/Operational_semantics
  [3]: http://en.wikipedia.org/wiki/Discrete_logarithm#Cryptography
