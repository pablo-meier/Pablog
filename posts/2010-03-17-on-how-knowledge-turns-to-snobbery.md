    Title: On how knowledge turns to Snobbery
    Date:2010-03-17T11:23:00
    Tags: pablolife

I used to read [A List Apart][1] religiously, back when I was a lamer-than-lame
"web developer.\*"  I've slacked off on reading it because I haven't
touched much web dev recently, but it's still an amazing online magazine, an
example of well-published content on the web.

One of their articles is on the ["Cold War" between Flash and HTML5
proponents][2], reignited by the iPad lacking Flash support. He describes the
pointlessness of the fighting effectively, and it generalizes to programming
language fanboy-ism:

<!-- more -->

> The problem with rallying behind a technology is that it traps us within the
> confines of its constraints. We easily shift "don’t know" and "not sure" into
> "can’t" and "won’t." Creativity is dictated by programming languages. How sad.

Technologies aren’t inherently bad or good. They’re only appropriate or
inappropriate for certain circumstances. They’re a means to an end, not
solutions within themselves. Each one is powerful in its own right to
accomplish a certain goal. The responsibility to use an appropriate technology
lies with the one who made the choice. Unfortunately, we’ve misinterpreted
irresponsible development as inadequate technology.

I usually avoid using Java, but this doesn't mean that I hate it, and I'll
never state that it is simply _bad_. I simply usually note that it's not the
best tool for me to use on whatever job I happen to be avoiding it for (and I
don't always avoid it; rarely but sometimes it's the best tool for job).

I referred to this in the [post on my vim use][3]: **flame wars on personal
choices of technology are pointless.**

My favorite part of the above passage is the line _We easily shift "don’t
know" and "not sure" into "can’t" and "won’t."_ Usually, that's what's
happening in a flame war; the opponent of language X doesn't know X or even
familiar with the paradigm, but trashes it because they're perfectly fine
without it. (The logic being: I know programming. I don't know X. X is not
_real_ programming). I get this a lot from people not versed in functional or
declarative languages should I start talking about one.

Similarly, even if you know about and just _know better_ than to use X (many
functional kids like me on C++, Java), flaming is unconstructive, and these
"smarter people" somehow forget a basic fact: great software is written in
these languages. Many people are plenty effective in these languages. So let
them have it.

Last semester I was a real language snob. I still have strong opinions, and
treat language choice like the director of a play treats casting (_its the
most important part_). But hating on a language "just because" is like looking
at an actor and saying there is _no role_ he/she is fit to play, which only
shows you're limited knowledge of plays and lack of imagination for new ones.

-

\* = When I say web developer, I mean it in the lamest sense possible. About 3
years ago, when I first started programming on my own, the motivation was to
make _sweet websites_. Unfortunately, I wasn't much of a programmer. I'll take
the snippet on "web programmer" from [evolution of a Python Programmer][4] to
demonstrate the kind of code I wrote for an old theatre board website (since
destroyed):

```python
    #Web designer

    def factorial(x):
        #-------------------------------------------------
        #--- Code snippet from The Math Vault ---
        #--- Calculate factorial (C) Arthur Smith 1999 ---
        #-------------------------------------------------
        result = str(1)
        i = 1 #Thanks Adam
        while i <= x:
            #result = result * i #It's faster to use *=
            #result = str(result * result + i)
                #result = int(result *= i) #??????
            result str(int(result) * i)
            #result = int(str(result) * i)
            i = i + 1
        return result
    print factorial(6)
```

_(shudder...)_ So glad those days are behind me. Also see [evolution of a
Haskell programmer][5] ^_^.


   [1]: http://www.alistapart.com
   [2]: http://www.alistapart.com/articles/flashstandards/
   [3]: http://www.morepablo.com/2010/02/hiatus-and-voyage-of-vim.html
   [4]: http://gist.github.com/289467
   [5]: http://www.willamette.edu/~fruehr/haskell/evolution.html
