    Title: 🧩 Karen's birthday puzzle game 🎂
    Date: 2020-10-21T22:20:44
    Tags: pablolife, games
    og_image: https://morepablo.com/img/2020/10/layton_THUMB.png
    og_description: Write-up of a puzzle game I made for Karen's birthday (and the puzzles, if you want to play).

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=Xuj32Yi__5o">Gas Pedal (Dave Audé Club Remix)</a>, by Sage the Gemini and Dave Audé.</em> 🎵</small>

Karen's birthday is 10/10, easy to remember if you hear, as I always do, [the
"Top Ten!" guy][1] and replace it with "Ten Ten!"

For various reasons, both mundane and of the juicy gossip variety, I wanted to
go a little harder on helping her celebrate her birthday this year, so I tried
making her a Zoom escape/puzzle game. Here's what I tried building, what it
ended up being, and some learnings on the process.

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2020/10/layton_THUMB.png" alt="Professor Layton and Luke Triton, looking good as ever." style="margin: 15px auto;" />
<p style="font-style: italic; text-align: center; font-size: small">Two of these are cribbed from Layton games, one of which <a href="/2010/09/some-professor-layton-prolog.html">inspired me to learn Prolog a decade ago</a>.</p>
</div>

### So you want to make a puzzle room?

Karen is… hardwired for puzzles? If you tell her something is a game, especially
a game of cleverness, she's becomes like the shark in _Finding Nemo_ when he
smells blood. She talks a lot about being competitive in [Orienteering][2] when
she was a little girl, and she gets absolutely radiant anytime I've heard
someone say "that's the fastest anyone's solved this!" after an escape room.

After buying a professional Zoom puzzle room for my birthday, I tried
making one for Karen. I was going to theme it around some media we've enjoyed
together, bring a few of her friends into it, and give it my best.

### The idea

The goal was to theme it around _Overcooked 2_ and Netflix's _Sugar Rush_, both
of which we've enjoyed together in 2020. In this, she and a few of her friends
get "trapped" and have to bake their way out of a cupcake round, a confection
round, and a cake round (per _Sugar Rush_'s format). Each of these rounds
requires completing three steps: gather ingredients, preparing ingredients, and
final assembly (this is something like _Overcooked_, where each dish might
require chopping vegetables, grilling meat, mixing batter, etc.). Each of these,
of course, would be some kind of puzzle.

I piped in selections from the _Overcooked_ soundtrack (love that [Kevin
Level song][5]), and [made a fake "select chef" screen][7], since that's a happy 
part of the ritual.

Finally, much of the chaos of _Overcooked_ is the stages: the layouts of
the kitchens greatly influence how you'll play. In this one, you'll see that all
chefs have all they need to cook and serve without any substantive obstacles:

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2020/10/basic_stage_THUMB.jpg" alt="Overcooked screenshot with all the chefs on a single landmass." style="margin: 15px auto;" />
</div>

But here, you'll note that the cutting board is on the top "island," but the
fryers and plates are on the bottom; to get around this, the two chefs have to
toss things back and forth.

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2020/10/islands_THUMB.png" alt="Overcooked screenshot with various islands and chefs on them." style="margin: 15px auto;" />
</div>

And this one has a moving platform at the bottom that ferries items that can't
be tossed, adding some timing mechanics.

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2020/10/moving_platforms_THUMB.png" alt="Overcooked screenshot where there are islands and a moving platform" style="margin: 15px auto;" />
</div>

Now with all this throat-clearing out of the way, the goal was:

- Intro, music, ambiance. I played [~20 seconds of _Murder Trivia Party_'s
  intro][6] to tell them they were trapped, then the opening credits of
  Overcooked to remind them this was wholesome, actually.
- Cupcake round: all three puzzles are available to all players at all times, it
  ends when they produce solutions to all the puzzles.
- Confection round: this would be the second "stage" above, with the islands, so
  _some_ players could access some puzzles, but no player could see all three,
  since they were on different "islands."
- Cake round, on the third "stage" with the moving platform: as before, only
  some players can be on any given puzzle, but they'd _rotate_ which puzzle they
  were looking at every _n_ minutes.

Lastly the wildcard! Karen is hardwired for games _and surprises,_ so I asked a
friend to hop in the call between rounds 2 and 3 as an evil rival chef who could
interfere with the players.

(He fucking **killed it** btw, the mechanic we introduced was that he could mute
a player for 2 minutes at a time. He came in wearing a chef outfit, holding a
rolling pin, calling himself "Chef Mütter!" He even watched _Sugar Rush_ for the
role, so bless this friend)

After the final round had been solved, [they were "judged"][3] by one of the
real-life judges of _Sugar Rush_ (thanks, [Cameo][4]) and I served Karen some
real cake.

If you want to see the puzzles themselves, they're here:

<table>
<th>
<td>Cupcakes</td>
<td>Confection</td>
<td>Cake</td>
</th>
<tr>
<td>Ingredients</td>
<td><a href="/no_robots/karen_game/db06cb12-8b6f-41cf-a529-bd8e39f931dd-cupcake-fetch.html">Straight-up logic puzzle</a></td>
<td><a href="/no_robots/karen_game/395f9c33-a3c5-417b-b33f-2717d0358880-confection-fetch-ingredients.html">Smullyan puzzle</a></td>
<td><a href="/no_robots/karen_game/28330ba2-df21-4e54-9f72-fb1d7e7f5885-cake-ingredients.html">"not-static" programming</a></td>
</tr>
<tr>
<td>Chop/Assemble</td>
<td><a href="/no_robots/karen_game/5f4a5a92-8b84-4f1e-9eb3-e57e00184ae3-cupcake-bake.html">Milkman puzzle</a></td>
<td><a href="/no_robots/karen_game/3ac0e207-2306-4153-b19c-bfdeec928060-confection-chop.html">Slide Puzzle</a></td>
<td><a href="/no_robots/karen_game/cb53d220-5b0b-4b70-b6bf-ddddeefafaaf-cake-chop.html">Multiplication + Logic</a></td>
</tr>
<tr>
<td>Serve</td>
<td><a href="/no_robots/karen_game/5ef777d7-4214-4be0-8bba-276997778419-cupcake-serve.html">Arithmetic Snake</a></td>
<td><a href="/no_robots/karen_game/c57b63a9-cc8b-4a88-aa98-824513779d9f-confection-serve.html">Stepdown</a></td>
<td><a href="/no_robots/karen_game/86b61653-adba-41e2-94a3-5bb43acf2106-cake-serve.html">Colin's Test</a></td>
</tr>
</table>

Feel free to send me your candidate answers, they're meant to be pretty hard
lol.

### How it went, actually

Not nearly this smoothly! We hit a few snags!

- I ran it on very little sleep, having pulled a lot of late nights for work
  that week, and the last late night finding, curating, and hosting all these
  puzzles lol.

- I didn't rehearse the intro/transitions very thoroughly, so a lot of the
  theming got lost. Advanced mechanics (those of the Overcooked "stages,"
  mostly) got dropped, and much of the narrative felt muddled.

- Many logistics with invited players… complicated things. It was still a
  success, but herding cats is challenging and one player didn't make it, while
  another came late, leaving us with fewer solving brains for the puzzles.

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2020/10/smullyan_THUMB.jpg" alt="FILLME. Click for full size." style="margin: 15px auto;" />
<p style="font-style: italic; text-align: center; font-size: small">Another puzzle came from <a href="https://en.wikipedia.org/wiki/To_Mock_a_Mockingbird">To Mock a Mockingbird</a>, by Raymond Smullyan, above. That book is <em>delightfully</em> brain-twisty, and great for D&D adventures.</p>
</div>

### Learnings, cutting room floor

Main learning is **there's no replacement for time investment and playtesting.**
I ran through the puzzles to make sure they were doable, but I didn't get to
playtest with a group of people, and there are still plenty of rough edges.

On puzzle rooms generally, I don't love how this was mostly "puzzle gauntlet"
where they get sent to you; much of the fun is discovering the puzzles in the
first place without explicit instructions of how they're meant to be
interpreted. Something like a page with a painting but nothing else, and
once you solve another puzzle you find how it fits into the painting. Or red
herrings!

I had a few ideas in this vein: the solution to a puzzle being a Twilio number
you could SMS, or making them derive what their window arrangement was on my
Zoom view and make them "link arms" by reaching for the boundaries of their
webcams. Basically, more raw discovery, boundary-breaking, and different kinds
of puzzles.

(also, it could stand to have been more thematically unified lol: those
puzzle pages are pretty bare, and I wanted to GIF them up)

One puzzle would have been a "scavenger hunt" on the internet, where the
solution was to produce things like "a phrase you could put through Bing that
only returns one result," or a light research task (some [Castlevania monsters,
for example][8], have some wild histories!)

The "antagonist enters halfway through" was a wild success with Chef Mütter, and
I toyed with the idea of surprising _him_ with another friend who'd throw _him_
into the pit with the puzzle solvers team, a "betrayal betrayal," but didn't get
that in time.

One of our participants made a great little CYOA game from using [Twine][8] and
a few other code-free tools for a similar puzzle party, if I'd invested a little
time to learn them it might have been easier to construct a more coherent
experience.

But! The only way to get great at something is by sucking at it for a bit. This
was still a success — folks were merry, cake was delicious, and it was fabulous
seeing friends again. I'm now more clear on what blockers look like for the
_next_ Zoom puzzle game 😊

(big thanks to Ian McQuade for Chef Mütter, and [Saurya Velagapudi][9] for
workshopping puzzles with me)

   [1]: https://www.reddit.com/r/nba/comments/3qzwlu/not_sure_if_you_guys_care_but_the_voiceover_guy/
   [2]: https://en.wikipedia.org/wiki/Orienteering
   [3]: https://morepablo.com/files/2020/cropped_zumbo.mp4
   [4]: https://www.cameo.com/
   [5]: https://www.youtube.com/watch?v=SQMhmGyydsI&list=PLndid7j4vly5Aj0vwICw1oRxPpaW5Q9-N&index=5
   [6]: https://www.youtube.com/watch?v=O8EpuvoFOfo&list=PLE02fmZNMCEEoclkx6iuC7pIqSR3pyfJE&index=1
   [7]: https://morepablo.com/no_robots/karen_game/select_chef.html
   [8]: https://twinery.org/
   [9]: https://saurya.com/blog/
