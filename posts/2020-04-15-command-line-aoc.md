    Title: 💻 Command line, AOC 🇺🇸
    Date: 2020-04-15T14:27:46
    Tags: culture, blurb, pablolife, engineering
    og_image: https://morepablo.com/img/2020/4/command_line_hacker_THUMB.jpg
    og_description: Waxing/waning on CLI after a successful sed command. AOC.

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=NuYDKzky4z0">Use Me</a>, by Bill Withers.</em> 🎵</small>

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2020/4/command_line_hacker_THUMB.jpg" alt="FILLME. Click for full size." style="margin: 15px auto;" />
</div>

I've been programming for professionally for 10 years, and nothing still feels as
good as running a sed command on an entire codebase and it more-or-less just
working. Running `git diff` after and seeing several boring hours of work to
rename something, just… _done_.

Of course, I didn't write the sed command from memory. `sed`, by default, uses
Basic Regular Expressions, and most of us day-to-day use PCRE regexes. Knowing
both (and combining between the two) is a bit of a pain. And on Mac, you need to
call `sed` with an empty string for the `-i` flag to get it to work the way it
works on many Stack Overflow answers. And if you want to call it on a group of
files (like an entire directory) I hope you know to add `\{ \} \;` to your
`find/-exec` pairing (with the spaces!) unless you use `| xargs`!

I guess what I'm trying to say is that while these tools are romanticized,
my God are the still hard to pin down. I know _just enough_ of what VIM
calls regexes to use it _a few times_ but not as good as when I use Python
regexes, and neither as good as `sed`. I read about what `sed` and `awk` give
you, but it's a hammer I rarely reach of because I can usually boot an IDE that
will do the operation more reliably.

There's a great tradition of rewriting old UNIX dinosaurs to be more "modern"
(or new tools in that spirit): I'm thinking of [`bat`][12] (`cat` replacement),
[`exa`][13] (`ls` replacement), [`tokei`][14] ([`cloc`][15] replacement),
[httpie][16] (`curl` replacement) and [`jq`][17] (JSON-specific parsing/mangling,
like `awk` on API data instead of raw text streams). `grep` has a million
replacements: `egrep` to solve the regex pain, but also [`ack`][18], [the silver
searcher (`ag`)][19], and the one I'm currently using, [ripgrep (`rg`)][20].
I tried [`fd`][11] for `find`, but couldn't make it stick since I already know a
lot of `find` lol.

Most "modern" takes on these tools are:

- "I wrote it! ⭐️"
- Colorized output in iTerm.
- Remove or consolidate a lot of the functionality to be some version of
  "cleaner," usually on flags and their use (I often agree).
- Sometimes, much better performance (ripgrep and tokei are… very fast).

While there's a lot that I don't love about [this article][21] (I'm sure its
author could say the same: this is a mirror of the entire blog they took down.
And they may have changed their mind about things; this was written 10 years
ago) I do love the phrase "Taco Bell programming" as a way to think about using
shell and pipes to build more sophisticated programs than I would have
otherwise. This came up in the ["more shell less egg" analysis Hillel Wayne
did][22], where one of his takeaways (and mine too, when I first read the
Bentley/Knuth exchange) was that the problem spec was especially well-suited for
UNIX pipeline processing, and if you were to add a few requirements suddenly you
could see the problem becoming much harder, and a "real program" becomes
necessary. He suggested calculating [Levenshtein distance][23]. But then someone
else… [did that with two more lines of "shell."][24] I just keep getting
surprised by this.

Another example: Elixir programmers (though you see this in Clojure and OCaml a
bunch too) love to pipeline their operations:

```elixir
data
  |> ThisModule.frobify()
  |> ThatModule.mangleFort()
  |> IO.inspect()
  |> somethingOrOther()
```

and these are… strictly inferior to Unix pipes? By strictly inferior, I mean
that something like:

```
yes | sudo apt-get install this-package
```

Will _only run as much `yes` as is necessary_. `yes` never terminates, but it
won't hold up the program. Getting the output of one function to lazily and
concurrently "feed" the input of another command is a real Senior
Engineer task in something like Python or Java.

This is, itself, a hyperspecific example, but one I think about a lot when I
look at application code that doesn't surface these operations easily. I think
romantic narratives about UNIX (like Lisp) of "enlightenment" tend to fall short of
putting up results in commercial settings, and get roped into a lot of [silly
showboating rituals.][25] But I think there is something pretty interesting at
the base of it.

I don't know entirely where I'm going with this, other than I have dreams of
becoming That Hippie Programmer.

### AOC, #uspol

I read [this interview with AOC by Astead Herndon][1] and I'm just reminded how
fucking good she is at this. The messaging is centered on issues, is critical to
the centrist wing without hostile enough to bruise their egos, and keeps focus
on who the real enemies are in all this.

Democrats have always been the party of "well, we're not as obvious or overtly
evil as those fuckers," which means they don't produce many firebrands, and
when I look back at the ones they did, they tended to… suck? Be bad at
persuading others, or enacting policy? I'm thinking Alan Grayson, Kucinich (in
the early aughts people were talking about him like he was an AnCom), Barney
Frank, or Al Franken. Many were fine enough I guess, but if you were looking for
someone legitimately scary in how effective they were… the Republicans were
never that scared. But they are scared of AOC (and grateful to have another
woman to cast as Satan, and a Latina to boot, after using Hillary for the last
two decades).

Anyway, it's a quick read. I liked it, you might too.

   [1]: https://www.nytimes.com/2020/04/13/us/politics/aoc-progressives-joe-biden.html
   [11]: https://github.com/sharkdp/fd
   [12]: https://github.com/sharkdp/bat
   [13]: https://the.exa.website/
   [14]: https://docs.rs/tokei/11.1.0/tokei/
   [15]: https://github.com/AlDanial/cloc
   [16]: https://httpie.org/
   [17]: https://stedolan.github.io/jq/
   [18]: https://beyondgrep.com/
   [19]: https://geoff.greer.fm/ag/
   [20]: https://github.com/BurntSushi/ripgrep
   [21]: http://widgetsandshit.com/teddziuba/2010/10/taco-bell-programming.html
   [22]: https://buttondown.email/hillelwayne/archive/donald-knuth-was-framed/
   [23]: https://en.wikipedia.org/wiki/Levenshtein_distance
   [24]: https://www.spinellis.gr/blog/20200225/index.html
   [25]: /2018/03/engineer-showboating.html
