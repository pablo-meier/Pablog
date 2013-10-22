    Title: loving yourself with EBOOKS
    Date:2012-10-22T23:41:00
    Tags: pablolife, works, engineering

While I'm still ramping up at the [new gig][1], I've found a love of code again
and recently launched new side project. I may still work on it yet, but chances
are I'll leave it be for a bit while I pursue other interests (hey, it works
well as is and I'm not shipping it :-p).

It's called **Ebooker**, and if you'd like to have a look at the source, fire me
an email, I have it hosted on a private repo on [Bitbucket][2].

<!-- more -->

**\[Update! I've put it on [Github](https://github.com/paul-meier/Ebooker).\]**

### "Ebooker"?

Ebooker takes it's name from [@horse\_ebooks][3], one of the most famous Twitter
accounts that (legend has it) was a spam bot that forgot to sell its wares,
only remembering to try to sound human to avoid spam detection. As a result, you
get a sort of [abstract poetry][4]:

<blockquote class="twitter-tweet"><p>Thigh exercises so strongly targeted, they ll leave you crawling on floor, waving</p>&mdash; Horse ebooks (@Horse\_ebooks) <a href="https://twitter.com/Horse_ebooks/status/193422537953263616" data-datetime="2012-04-20T19:35:01+00:00">April 20, 2012</a></blockquote>
<script src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

<blockquote class="twitter-tweet"><p>Worms – oh my god WORMS</p>&mdash; Horse ebooks (@Horse\_ebooks) <a href="https://twitter.com/Horse_ebooks/status/162236425633406977" data-datetime="2012-01-25T18:12:32+00:00">January 25, 2012</a></blockquote>
<script src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

<blockquote class="twitter-tweet"><p>Crying is great exercise</p>&mdash; Horse ebooks (@Horse\_ebooks) <a href="https://twitter.com/Horse_ebooks/status/246749375898976256" data-datetime="2012-09-14T23:16:50+00:00">September 14, 2012</a></blockquote>
<script src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

As a result, it's a bit customary to include the phrase "ebooks" in Twitter
bots, even if they aren't trying to sell anything as @horse\_ebooks was. Some
examples are:

* [@bogost\_ebooks][5], a bot imitating the game designer Ian Bogost.
* [@kpich\_ebooks][6], a bot imitating the esteemed [Karl Pichotta][7].
* [@RandomTedTalks][8], imitating the titles of TED Talks.

Given this, *Ebooker takes as input any number of Twitter streams, and will
create a bot that will imitate their union.* The most obvious (and narcissistic)
example is the new [@SrPablo\_ebooks][9], based on [my Twitter stream][10]:

<blockquote class="twitter-tweet"><p>I thought this was hell, but I'm afraid folk looking over my shoulder will think it's cool technology).</p>&mdash; olbaP reieM (@SrPablo\_ebooks) <a href="https://twitter.com/SrPablo_ebooks/status/256804761918111744" data-datetime="2012-10-12T17:13:21+00:00">October 12, 2012</a></blockquote>
<script src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

<blockquote class="twitter-tweet"><p>Natalie Imbruglia at the gate.</p>&mdash; olbaP reieM (@SrPablo\_ebooks) <a href="https://twitter.com/SrPablo_ebooks/status/258918691511623680" data-datetime="2012-10-18T13:13:21+00:00">October 18, 2012</a></blockquote>
<script src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

<blockquote class="twitter-tweet"><p>Graduated. Now goin' back to Providence. My brother Robert is a surprising beast</p>&mdash; olbaP reieM (@SrPablo\_ebooks) <a href="https://twitter.com/SrPablo_ebooks/status/260398441853755392" data-datetime="2012-10-22T15:13:21+00:00">October 22, 2012</a></blockquote>
<script src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

But it gets more fun when you combine accounts. Ebooker powers
[@SrLaurelita][11], a combination of me and my girlfriend's ([@laurelita][12])
tweets:

<blockquote class="twitter-tweet"><p>Note to self: don't forget the Flash Player security fix we just released! CONTAIN YOUR EXCITEMENT!!!</p>&mdash; Laurblo Jeierson (@SrLaurelita) <a href="https://twitter.com/SrLaurelita/status/259764265152548865" data-datetime="2012-10-20T21:13:21+00:00">October 20, 2012</a></blockquote>
<script src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

<blockquote class="twitter-tweet"><p>Also, best addition to my gut and learned the names of the guys here are gay, or just damn stylish. Either way, let me tell you MY opinion</p>&mdash; Laurblo Jeierson (@SrLaurelita) <a href="https://twitter.com/SrLaurelita/status/258495907677483009" data-datetime="2012-10-17T09:13:21+00:00">October 17, 2012</a></blockquote>
<script src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

<blockquote class="twitter-tweet"><p>Nobody got it? That's so hipster.</p>&mdash; Laurblo Jeierson (@SrLaurelita) <a href="https://twitter.com/SrLaurelita/status/258390211204087808" data-datetime="2012-10-17T02:13:21+00:00">October 17, 2012</a></blockquote>
<script src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

The nice thing about Ebooker is that it does the tweeting for you: I tell it who
I want to mix and match, how often I want it to tweet, and it does the rest.

### How does it work?

Ebooker bots, like most Twitter bots, work via a mechanism called [Markov chains][13].
Despite the length and jargon in the Wikipedia entry, it's really pretty simple
and I'll do my best to explain it to the curious, whatever your background.

The high-level view could be expressed as: Ebooker wants to make text that
sounds like you, so it uses only the words you use, and tries to use them in the
order that you use them. To do this, we first have to learn about you and your
words.

This indicates the program should go through two phases: a *consumption* phase,
where it reads your writing and does some analysis on it, and a *generation*
phase, where it creates new text by using what it learned.

How does the analysis happen? First it puts the words you use into a table, then
it uses that table to see which words you use most. Here's an
example of how it works: previously-mentioned Karl Pichotta recently tweeted:

<blockquote class="twitter-tweet"><p>Don't do well in school, kids, or you could end up like me. Is that what you want out of life? \*whole sandwich falls out of beard\*</p>&mdash; Karl Pichotta (@kpich) <a href="https://twitter.com/kpich/status/260802216519139328" data-datetime="2012-10-23T17:57:48+00:00">October 23, 2012</a></blockquote>
<script src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Ebooker would look at every word, and make a note of what follows it. For
example, in the tweet above, it notes that every time Karl uses the word
"school," the next word is "kids," and every instance of "whole" is followed by
"sandwich" ("Don't do well in **school, kids,** or ... **\*whole sandwich**
falls out ...").

Now for the fun part... what happens for the word "of"? It comes up twice in
this tweet, and gets followed by "life" and "beard." In our little table, we
make a note of both "life" and "beard", and keep track of how many times we've
seen them. The table might look like:

<table style="text-align: center; margin: 25px auto;">
<tr style="border-bottom: 1px solid black;">
<td style="width: 7em;"><strong>Word</strong></td>
<td style="width: 7em;">&nbsp;</td>
<td style="width: 7em;"><strong>Suffix, frequencies.</strong></td>
</tr>
<tr style="border-bottom: 1px solid black;">
<td><em>school</em></td>
<td>&rarr;</td>
<td><em>kids</em>, 1</td>
</tr>
<tr style="border-bottom: 1px solid black;">
<td><em>whole</em></td>
<td>&rarr;</td>
<td><em>sandwich</em>, 1</td>
</tr>
<tr style="border-bottom: 1px solid black;">
<td>...</td>
<td>...</td>
<td>...</td>
</tr>
<tr style="border-bottom: 1px solid black;">
<td><em>of</em></td>
<td>&rarr;</td>
<td><em>life</em>, 1<br /><em>beard</em>, 1</td>
</tr>
</table>

Now suppose we've done for all of Karl's writing, ever (Ebooker uses all the
tweets Twitter will give us, which is the last ~3200 tweets). The table would be
huge, and many common words would have many possibilities. The table might look
like:

<table style="text-align: center; margin: 25px auto;">
<tr style="border-bottom: 1px solid black;">
<td style="width: 7em;"><strong>Word</strong></td>
<td style="width: 7em;">&nbsp;</td>
<td style="width: 7em;"><strong>Suffix, frequencies.</strong></td>
</tr>
<tr style="border-bottom: 1px solid black;">
<td><em>Oxford</em></td>
<td>&rarr;</td>
<td><em>University</em>, 4<br /><em>College</em>, 1<br /><em>Dictionary</em>, 3</td>
</tr>
<tr style="border-bottom: 1px solid black;">
<td><em>whole</em></td>
<td>&rarr;</td>
<td><em>sandwich</em>, 1<br /><em>shebang</em>, 4<br /><em>matter</em>, 2<br /><em>void</em>, 55<br /><em>metric</em>, 8</td>
</tr>
<tr style="border-bottom: 1px solid black;">
<td>...</td>
<td>repeat for thousands of entries...</td>
<td>...</td>
</tr>
<tr style="border-bottom: 1px solid black;">
<td><em>of</em></td>
<td>&rarr;</td>
<td><em>life</em>, 1<br /><em>beard</em>, 3<br /><em>mine</em>, 7<br /><em>his</em>, 4<br /><em>that</em>, 9<br /><em>it</em>, 22</td>
</tr>
</table>

Some things about this table:

* It only has words in it that Karl has used. If we made up sentences from these
  words, it would *always* contain words that have come straight from Karl's
  proverbial mouth.
* By keeping track of the number of times each word follows the previous one, we
  have an idea of what he likes to talk about by seeing how often he talks about
  it. Using the table above, we see he did say "whole sandwich" once, but he's
  said "whole void" 55 times. Karl loves talking about the void!

From here, generating text is easy. We do so _probabilistically_: we let the
words that show up most often have more weight than those that don't.

One way to imagine this is with darts: Imagine a dartboard with a huge
"outside zone" and a tiny bullseye. If you're terrible at throwing darts such
that they land on the dartboard randomly, chances are it'll hit the outside zone
frequently, and rarely hit the bullseye.

In this case, we'll start with any word in the table (let's say, "of") and the
words that come after it form a dartboard. "void" will be the huge outside zone
because it's shown up 55 times, and "sandwich" will be the bullseye, which we
almost never hit. We ask the computer for a random number, like throwing a dart
randomly. Wherever the number lands, we pick that as our next word. With the
values above, the odds look like:

<table style="text-align: center; margin: 25px auto;">
<tr style="border-bottom: 1px solid black;">
<td style="width: 7em;"><strong>Suffix of "of"</strong></td>
<td style="width: 7em;">&nbsp;</td>
<td style="width: 7em;"><strong>Odds</strong></td>
</tr>
<tr style="border-bottom: 1px solid black;">
<td><em>sandwich</em></td>
<td>&rarr;</td>
<td>1/70</td>
</tr>
<tr style="border-bottom: 1px solid black;">
<td><em>matter</em></td>
<td>&rarr;</td>
<td>2/70</td>
</tr>
<tr style="border-bottom: 1px solid black;">
<td><em>shebang</em></td>
<td>&rarr;</td>
<td>4/70</td>
</tr>
<tr style="border-bottom: 1px solid black;">
<td><em>metric</em></td>
<td>&rarr;</td>
<td>8/70</td>
</tr>
<tr style="border-bottom: 1px solid black;">
<td><em>void</em></td>
<td>&rarr;</td>
<td>55/70</td>
</tr>
</table>

Once we've selected our next word, we look up *that* word in the table, just as
we did for "of". We do this until we reach a word that isn't in the table, or
(because this was made for Twitter) we run out of characters. When you're done,
_Viola!_, you've created a nonsensical (but not totally random) phrase in
someone else's voice!

(someone did this with Garfield comics, by the way... check out [Garkov][17])

### Bots managed by Ebooker

Ebooker is currently whirring away, sending up tweets for the following bots:

* @SrPablo\_ebooks, seeded from my stream, @SrPablo.
* @laurelita\_ebook, from my girlfriend's Twitter, @laurelita.
* @SrLaurelita, from @SrPablo and @laurelita.
* @love\_that\_lita, from @laurelita and @love\_that\_goku.

**If there's a bot you'd like to see, let me know! I'm happy to get a few more
up there!**

### Onwards!

I might write about this again, since getting the Markov chains was only a day
of work (and that's in a language I'd never seen before). The more technically
juicy stuff, from my end anyways, was implementing [OAuth 1.0][18] in Go, as
well as a first exposure to [goroutines][19]. These might get treated in a
future post, but I thought this would be a cute way to describe, to
non-technical folk, the kinds of problems programmers solve.

   [1]: http://code.google.com/apis/console
   [2]: http://bitbucket.org
   [3]: http://twitter.com/horse_ebooks
   [4]: http://www.theverge.com/2012/8/29/3276661/twitters-favorite-spambot-horse-ebooks-hits-100k-followers
   [5]: https://twitter.com/bogost_ebooks
   [6]: https://twitter.com/kpich_ebooks
   [7]: http://www.meronoiac.com/
   [8]: https://twitter.com/RandomTedTalks
   [9]: https://twitter.com/SrPablo_ebooks
   [10]: https://twitter.com/SrPablo
   [11]: https://twitter.com/SrLaurelita
   [12]: https://twitter.com/laurelita
   [13]: http://en.wikipedia.org/wiki/Markov_chain
   [14]: https://twitter.com/laurelita_ebook
   [16]: https://twitter.com/love_that_goku
   [17]: http://joshmillard.com/garkov/
   [18]: http://en.wikipedia.org/wiki/OAuth
   [19]: http://golang.org/doc/effective_go.html#goroutines
