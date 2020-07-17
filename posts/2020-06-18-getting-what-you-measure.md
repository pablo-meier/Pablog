    Title: 📏 Getting what you measure ⏱
    Date: 2020-06-18T22:44:09
    Tags: blurb, pablolife, culture
    og_image: https://morepablo.com/img/2020/6/marching_THUMB.jpg
    og_description: Trying to roll the blogging boulder again, with a link and a cute video or two.

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=YA2P8o07SKQ">Fodlan Winds</a>, by Rei Kondoh for Fire Emblem: Three Houses.</em> 🎵</small>

<div class="caption-img-block" style="margin: 25px auto">
<a href="/img/2020/6/marching.jpg" target="blank"><img src="/img/2020/6/marching_THUMB.jpg" alt="Me, marching on the Brooklyn Bridge on Sunday" style="margin: 15px auto;" /></a>
<p style="font-style: italic; text-align: center; font-size: small">Since buying this hat Kanye has become very problematic, but I still like the joke, and it's the only hat I have to keep the sun out and my hair out of my face lol.</p>
</div>

Put down blogging for a bit — work _really_ picked up on me, and, well, talking
about random things on my mind felt shallow and depressing in light of the
police violence this last c̶e̶n̶t̶u̶r̶y̶ week. We're still marching: the police have
learned that committing violence on innocent people during protests about how
you commit violence against innocent people doesn't send the message you want;
it looks like most departments [accepted the Pepsi][3] and are trying to
run out the clock, confident the politicians/unions will work to ensure nothing
substantive happens, as they have forever. Keep marching, donating, calling, and
letting your politicians (local and federal) know that you're not forgetting.

<div class="caption-img-block" style="margin: 25px auto">
<a href="https://twitter.com/polotek/status/499738806338064384" target="blank">
<img src="/img/2020/6/polotek_tweet_THUMB.png" alt="Polotek on Twitter; &quot;This right here. Which of these 2 sides you're more afraid of is what colors your whole life.&quot;, with a photo of heavily armed police, and another photo of young Black people." style="margin: 15px auto;" />
</a>
<p style="font-style: italic; text-align: center; font-size: small">I think about <a href="https://twitter.com/polotek/status/499738806338064384">this tweet from the 2014 Ferguson protests</a> all the time.</p>
</div>

## Onwards

Nostalgia for one's formative years is _cheap and overplayed_ but it still
works, man. I smiled at this.

<iframe width="800" height="450" style="max-width: 95%" src="https://www.youtube-nocookie.com/embed/nK-Vx8Sf-2E" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

My brother always played Leonardo (Lawful Good, leader-type) and I played
Michaelangelo (I loved the goof-off persona, and his utter joy at eating pizza).
While it felt like we were a pretty progressive household on gender (my
mom made _very_ sure we saw how she was treated differently than my dad), it was
the early 90's, and we made Annalisa play April lol 😫.

## Getting what you measure

I read a few things that I liked on this theme, one is this short article
by Jessica Joy Kerr: [_Measuring Effort Gets You Effort_.][1] The entire article
is good and worth reading, but the title states it well enough. The idea that
rewarding outward, performative displays of effort fosters a culture which
cultivates it is so obvious, but absent the deliberate choice to do otherwise,
that's what most companies and managers do. If you lead people, be conscious of
this and try to do otherwise.  

It ties a bit to this thread by Camille Fournier on rewarding people who claim
to enjoy working a billion hours:


<div class="caption-img-block" style="margin: 25px auto">
<a href="https://twitter.com/skamille/status/1210593049711202304" target="blank">
<img src="/img/2020/6/skamille_tweet_THUMB.png" alt="skamille on Twitter: &quot;Way too many people aren't being honestly told by their managers that their overwork is kinda meh, because telling someone that their efforts are wasted is incredibly hard. But your overwork is probably meh.&quot;" style="margin: 15px auto;" />
</a>
</div>

[The entire discussion][4] is a great read, but I've observed what she's describing.
In my entire career, I've only met two engineers who regularly worked long hours
and still produced shippable work. It wasn't always fantastic! But it was
shippable, with a standard-or-fewer number of defects. These two were absolute
unicorns. Meanwhile, I've met dozens upon dozens of others who demanded
promotions on shoddy work that always required bugfixes and cleanup that they
produced in off-hours.

I wrote [previously about engineering working hours][5]. There's no simple
narrative for exceptional results, but tons of simple narratives for subpar
ones.

---

On another "get what you aim for" point, [Saurya wrote a post I liked about
skylines and urban development.][2] I'll hit this note over and over again in
subsequent blogposts, but Saurya's blog is delightful, click around it please.

## Crosswords, data formats

I liked this; it goes down easy.

<iframe width="800" height="450" style="max-width: 95%" src="https://www.youtube-nocookie.com/embed/9aHfK8EUIzg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

I should do a formal write-up or talk on [ScrabbleCheat][6], which grew me
tremendously: without meaning to undertake such a major project (was supposed to
be a weekend thing), I wrote [a Scrabble solver in Erlang][7] (Scrabble is
actually pretty hard to write a bot for!), using [a compact binary data
structure I generated with C code][8], the client was [a Ruby wrapper around
ncurses][9]. It was naked Erlang to start, and later taught me OTP.

I thought of using it later to learn AI: having a "player" in place, I could 
have it play itself to generate millions of games, and train the model to
optimize to victorious states.

I might still one day! But it keeps getting hard to go back to lol.

   [1]: https://jessitron.com/2020/04/14/measuring-effort-gets-you-effort/
   [2]: http://saurya.com/blog/aesthetics-modernity/
   [3]: https://www.washingtonpost.com/news/wonk/wp/2017/04/05/pepsi-tried-cashing-in-on-black-lives-matter-with-a-kendall-jenner-ad-heres-how-thats-going/
   [4]: https://twitter.com/skamille/status/1210593049711202304
   [5]: /2018/08/working-hours-for-engineers.html
   [6]: https://git.sr.ht/~srpablo/ScrabbleCheat
   [7]: https://git.sr.ht/~srpablo/ScrabbleCheat/tree/master/code/server
   [8]: https://git.sr.ht/~srpablo/ScrabbleCheat/tree/master/code/server/lib/bingad
   [9]: https://git.sr.ht/~srpablo/ScrabbleCheat/tree/master/code/clients/curses
