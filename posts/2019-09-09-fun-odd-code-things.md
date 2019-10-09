    Title: 🤓 Fun, odd code things 🐉
    Date: 2019-09-09T22:59:02
    Tags: engineering, pablolife
    og_image: https://morepablo.com/img/2019/9/langs_THUMB.png
    og_description: Pointers to some *\_-eXtReMe c0d3 cr4Ft-_/* that tickles me

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=6wEx_EiZfaM">The Auctioneer</a>, by Leroy van Dyke as performed by Steve Goodman.</em> 🎵</small>

Despite the best efforts of industry, capitalism, my nasty depressed brain, and
tech monopolies, I do Fucking Love Computers. Karen once described my computer
aesthetic as "does nothing useful, but very cleverly." Here are some cool
projects that scratch some itches for me.

### 128-Language Quine Ouroboros

<div class="caption-img-block" style="margin: 25px auto">
<a href="https://github.com/mame/quine-relay" target="blank">
<img src="/img/2019/9/langs_THUMB.png" alt="FILLME. Click for full size." style="margin: 15px auto;" />
</a>
</div>

The first part of this is knowing what a _quine_ is: a quine is a program that,
when run, prints itself. Here's an example in Python:

```
s = 's = %r; print (s%%s)'; print (s%s)
```

which you can run with `python3 -c "s = 's = %r; print (s%%s)'; print (s%s)"`.
Standard out should print the source code.

So what is this project? It's a program that you can run from any point to
produce the next program in the chain, in a different language; which you can run
to produce the next program in the chain, in a different language; which you can
run…

Each "link" of the chain is in a different language, in alphabetical order, for
128 languages. Check it out [here][1], or [the old 50-language version][2].
Selfless plug: I solved [22-odd problems in that many languages.][3]

### SQL Mandelbrot Set

I have a blog post waiting in the wings showing you how you can write
general-purpose programs in SQL (much like Prolog: your tables contain your
Prolog "facts" and your queries/views are the "rules"); but a decent
illustration of this is [this beautiful SQL query][5], which if you run it in
Postgres:

<pre style="background-color: #ededed; font-size: 0.8em"><code>
WITH RECURSIVE
x(i)
AS (
    VALUES(0)
UNION ALL
    SELECT i + 1 FROM x WHERE i < 101
),
Z(Ix, Iy, Cx, Cy, X, Y, I)
AS (
    SELECT Ix, Iy, X::FLOAT, Y::FLOAT, X::FLOAT, Y::FLOAT, 0
    FROM
        (SELECT -2.2 + 0.031 * i, i FROM x) AS xgen(x,ix)
    CROSS JOIN
        (SELECT -1.5 + 0.031 * i, i FROM x) AS ygen(y,iy)
    UNION ALL
    SELECT Ix, Iy, Cx, Cy, X * X - Y * Y + Cx AS X, Y * X * 2 + Cy, I + 1
    FROM Z
    WHERE X * X + Y * Y < 16.0
    AND I < 27
),
Zt (Ix, Iy, I) AS (
    SELECT Ix, Iy, MAX(I) AS I
    FROM Z
    GROUP BY Iy, Ix
    ORDER BY Iy, Ix
)
SELECT array_to_string(
    array_agg(
        SUBSTRING(
            ' .,,,-----++++%%%%@@@@#### ',
            GREATEST(I,1),
            1
        )
    ),''
)
FROM Zt
GROUP BY Iy
ORDER BY Iy;
</code></pre>

Produces a printout of [the Mandelbrot set][4]:

<pre style="background-color: #ededed; font-size: .6em"><code>
             ....................................................................................
            .......................................................................................
           .........................................................................................
          ...........................................................................................
        ....................................................,,,,,,,,,.................................
       ................................................,,,,,,,,,,,,,,,,,,.............................
      ..............................................,,,,,,,,,,,,,,,,,,,,,,,,..........................
     ............................................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,........................
     ..........................................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,......................
    .........................................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,....................
   ........................................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,...................
  .......................................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.................
 .......................................,,,,,,,,,,,,,,,,,,,,,,,,--,,,,,,,,,,,,,,,,,,,,................
......................................,,,,,,,,,,,,,,,,,,,,,,,,,,-+--,,,,,,,,,,,,,,,,,,,...............
....................................,,,,,,,,,,,,,,,,,,,,,,,,,,,,-----,,,,,,,,,,,,,,,,,,,..............
...................................,,,,,,,,,,,,,,,,,,,,,,,,,,,,--- -----,,,,,,,,,,,,,,,,,.............
.................................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,---++--++,,,,,,,,,,,,,,,,,,............
................................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,-----%++---,,,,,,,,,,,,,,,,,............
..............................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,-----+%----,,,,,,,,,,,,,,,,,,...........
.............................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,----- %%+----,,,,,,,,,,,,,,,,,,..........
...........................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,---%-+%   ----,,,,,,,,,,,,,,,,,,,.........
..........................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,---+ +##  %+%---,,,,,,,,,,,,,,,,,,.........
........................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,-----#      # +---,,,,,,,,,,,,,,,,,,........
.......................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,-------%       %-----,,,,,,,,,,,,,,,,,........
.....................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,---------+         ------,,,,,,,,,,,,,,,,,.......
....................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,-----------+@       +-----------,,,,,,,,,,,,.......
..................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,----@-------++       ++-----------,,,,,,,,,,,,......
.................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,--+@% ---+ +@%%@     %%+@+@%------+-,,,,,,,,,,,......
................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,----  # ++%               % @-----++--,,,,,,,,,,,.....
..............,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,----+    %                  %%++ %+%@-,,,,,,,,,,,.....
.............,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,-----+#                       #%    ++-,,,,,,,,,,,,....
............,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,------+                             @---,,,,,,,,,,,,....
..........,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,-------++%                             ---,,,,,,,,,,,,....
.........,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,--------+ +                             %+---,,,,,,,,,,,,,...
........,,,,,,,,,,,,,,,,,,,,,--------------------@                                +----,,,,,,,,,,,,...
.......,,,,,,,,,,,,,,,,,,,,,,- +-----------------+                                 ----,,,,,,,,,,,,...
.......,,,,,,,,,,,,,,,,,,,,,--++------+---------+%                                 +++--,,,,,,,,,,,,..
......,,,,,,,,,,,,,,,,,,,,,,--%+-----++---------                                     #+-,,,,,,,,,,,,..
.....,,,,,,,,,,,,,,,,,,,,,,----#%++--+@ -+-----+%                                     --,,,,,,,,,,,,..
.....,,,,,,,,,,,,,,,,,,,,,,-----+## ++@ + +----%                                    +--,,,,,,,,,,,,,..
....,,,,,,,,,,,,,,,,,,,,,,------+@  @     @@++++#                                   +--,,,,,,,,,,,,,..
....,,,,,,,,,,,,,,,,,,,,,-------%           #++%                                      -,,,,,,,,,,,,,..
...,,,,,,,,,,,,,,,,,,,,,------++%#           %%@                                     %-,,,,,,,,,,,,,,.
...,,,,,,,,,,,,,,,,,,,--------+               %                                     +--,,,,,,,,,,,,,,.
...,,,,,,,,,,,,,,,,,,-----+--++@              #                                      --,,,,,,,,,,,,,,.
..,,,,,,,,,,,,,,,,,-------%+++%                                                    @--,,,,,,,,,,,,,,,.
..,,,,,,,,,,,-------------+ @#@                                                    ---,,,,,,,,,,,,,,,.
..,,,,,,,,,---@--------@-+%                                                       +---,,,,,,,,,,,,,,,.
..,,,,,------- +-++++-+%%%                                                       +----,,,,,,,,,,,,,,,.
..,,,,,,------%--------++%                                                       +----,,,,,,,,,,,,,,,.
..,,,,,,,,,,--+----------++#                                                       ---,,,,,,,,,,,,,,,.
..,,,,,,,,,,,,------------+@@@%                                                    +--,,,,,,,,,,,,,,,.
..,,,,,,,,,,,,,,,,,------- +++%                                                    %--,,,,,,,,,,,,,,,.
...,,,,,,,,,,,,,,,,,,---------+@              @                                      --,,,,,,,,,,,,,,.
...,,,,,,,,,,,,,,,,,,,,------- #              %@                                    +--,,,,,,,,,,,,,,.
...,,,,,,,,,,,,,,,,,,,,,-------++@           %+                                      %-,,,,,,,,,,,,,,.
....,,,,,,,,,,,,,,,,,,,,,-------            %++%                                     %-,,,,,,,,,,,,,..
....,,,,,,,,,,,,,,,,,,,,,,------+#  %#   #@ ++++                                    +--,,,,,,,,,,,,,..
.....,,,,,,,,,,,,,,,,,,,,,,-----+ %%++% +@+----+                                    +--,,,,,,,,,,,,,..
.....,,,,,,,,,,,,,,,,,,,,,,,---%+++--+#+--------%                                    #--,,,,,,,,,,,,..
......,,,,,,,,,,,,,,,,,,,,,,--++-----%%---------                                    @#--,,,,,,,,,,,,..
.......,,,,,,,,,,,,,,,,,,,,,---------------------+@                                +-++,,,,,,,,,,,,...
........,,,,,,,,,,,,,,,,,,,,,--------------------+                                 ----,,,,,,,,,,,,...
.........,,,,,,,,,,,,,,,,,,,,----,,,-------------                                #+----,,,,,,,,,,,,...
..........,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,-------+ +                              +---,,,,,,,,,,,,,...
...........,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,--------+%#                           #---,,,,,,,,,,,,....
............,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,------+#                        @   @---,,,,,,,,,,,,....
.............,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,-----+#                        +    @--,,,,,,,,,,,,....
..............,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,---+%   %+@                 %+-+ +++%-,,,,,,,,,,,.....
................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,----% %@++              # %  -----++-,,,,,,,,,,,,.....
.................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,-- ++ ---+ + +%@     %++++++------%-,,,,,,,,,,,......
...................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,---- -------++       +------------,,,,,,,,,,,,......
....................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,-----------+%       +--------,,,,,,,,,,,,,,,.......
......................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,--------+#        -----,,,,,,,,,,,,,,,,,,.......
.......................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,-------+       #----,,,,,,,,,,,,,,,,,,........
.........................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,----+%      %#---,,,,,,,,,,,,,,,,,,,........
..........................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,---+%+%@  %+%%--,,,,,,,,,,,,,,,,,,.........
............................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,---+-+%  %----,,,,,,,,,,,,,,,,,,..........
.............................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,-----+%@+---,,,,,,,,,,,,,,,,,,,..........
...............................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,-----+%----,,,,,,,,,,,,,,,,,,...........
................................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,-----%+ +--,,,,,,,,,,,,,,,,,............
..................................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,---++----,,,,,,,,,,,,,,,,,.............
...................................,,,,,,,,,,,,,,,,,,,,,,,,,,,,---@-----,,,,,,,,,,,,,,,,,.............
.....................................,,,,,,,,,,,,,,,,,,,,,,,,,,,-----,,,,,,,,,,,,,,,,,,,..............
 .....................................,,,,,,,,,,,,,,,,,,,,,,,,,,--%,,,,,,,,,,,,,,,,,,,,...............
 .......................................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.................
  ........................................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,..................
   ........................................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,...................
    .........................................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,....................
     ..........................................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,......................
      ............................................,,,,,,,,,,,,,,,,,,,,,,,,,,,,........................
       .............................................,,,,,,,,,,,,,,,,,,,,,,,,..........................
        ................................................,,,,,,,,,,,,,,,,,.............................
         .....................................................,,,,....................................
          ...........................................................................................
           .........................................................................................
            ......................................................................................
             ....................................................................................
               .................................................................................
                ..............................................................................
                  ...........................................................................
                   ........................................................................
</code></pre>

### TypeScript/JavaScript polyglot

Like quines, _polyglots_ are a lot of fun. It's a source file that is valid, and
can be run on multiple languages. Here's an example that runs as valid C, PHP,
and bash:

<pre style="background-color: #ededed;"></code>
#define a /*
#<?php
echo "\010Hello, world!\n";// 2> /dev/null > /dev/null \ ;
// 2> /dev/null; x=a;
$x=5; // 2> /dev/null \ ;
if (($x))
// 2> /dev/null; then
return 0;
// 2> /dev/null; fi
#define e ?>
#define b */
#include <stdio.h>
#define main() int main(void)
#define printf printf(
#define true )
#define function
function main()
{
printf "Hello, world!\n"true/* 2> /dev/null | grep -v true*/;
return 0;
}
#define c /*
main
#*/
</code></pre>

So what happens when one language tries to be a strict superset of another? Can
you produce a polyglot that runs on both, to different outputs? [Here's an
amazing breakdown of how the author found][6] a valid JavaScript program that
prints "I'm JavaScript" when run on JavaScript, but prints "I'm TypeScript" when
first run through a TypeScript compiler, _even though TypeScript is specifically
designed to prevent this outcome._

### Whitespace

There's the [wide world of "esolangs,"][7] esoteric programming languages that
seem to be about having fun and [proving a point][8] more than anything else.
Bored and depressed on the Google Bus during my year working there, I wrote [a
Whitespace interpreter][9] in Racket, and learned a lot about macros in the
process.

Whitespace is a language where all the valuable computing is done with spaces,
tabs, and newlines (everything else is comment). So [here's the program for
Fibonacci sequence][10] and here's [one for ROT13.][11]

### Bonus: Euonia

Poet Christian Bok [produced a work called Eunoia][12], where each chapter only
contains a single vowel. Here's from Chapter I:

>  Writing is inhibiting. Sighing, I sit, scribbling in ink
> this pidgin script. I sing with nihilistic witticism,
> disciplining signs with trifling gimmicks — impish
> hijinks which highlight stick sigils. Isn’t it glib?
> Isn’t it chic? I fit childish insights within rigid limits,
> writing shtick which might instill priggish misgiv-
> ings in critics blind with hindsight. I dismiss nit-
> picking criticism which flirts with philistinism. I
> bitch; I kibitz — griping whilst criticizing dimwits,
> sniping whilst indicting nitwits, dismissing simplis-
> tic thinking, in which philippic wit is still illicit.

   [1]: https://github.com/mame/quine-relay
   [2]: https://github.com/mame/quine-relay/tree/50
   [3]: https://github.com/pablo-meier/advent-of-code
   [4]: https://en.wikipedia.org/wiki/Mandelbrot_set
   [5]: https://wiki.postgresql.org/wiki/Mandelbrot_set
   [6]: https://medium.com/@jasvir/monoglots-when-a-subset-is-not-1604e3a51d9
   [7]: https://github.com/angrykoala/awesome-esolangs
   [8]: https://twitter.com/dril/status/435373709344251904
   [9]: https://github.com/pablo-meier/invisible-thief
   [10]: https://github.com/pablo-meier/Invisible-Thief/blob/master/examples/fibonacci.ws
   [11]: https://github.com/pablo-meier/Invisible-Thief/blob/master/examples/rot13.ws
   [12]: https://en.wikipedia.org/wiki/Eunoia_%28book%29
