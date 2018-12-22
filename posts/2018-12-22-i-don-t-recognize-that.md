    Title: I don't recognize that 🗣 🙉
    Date: 2018-12-22T00:48:00
    Tags: engineering
    og_image: https://morepablo.com/img/2018/12/screamchess_THUMB.jpg
    og_description: Suggesting that CSS-In-JS is just another example of "not my problem, therefore invalid."

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=dSBxNuhmCiM">Drive Away</a>, by Thomas Newman.</em> 🎵</small>

<div class="caption-img-block" style="margin: 25px auto">
<a href="/img/2018/12/screamchess.jpg" target="blank">
<img src="/img/2018/12/screamchess_THUMB.jpg" alt="Our chess set. Click for full size." style="margin: 15px auto;" />
</a>
</div>

My partner Karen also writes software, and we worked together on a screaming
chess set (a player moves a piece, and a speaker would play a sound of the piece
begging for its life). We butted heads on how to model the chess logic.

I was modeling it like a functional programmer (all examples in Python):

<pre style="font-size: .8em; background: #f7f7f7; padding: 15px;">
# Create sum types with enums
Kind = Enum('Kind', 'Pawn Rook Knight Bishop Queen King')
Color = Enum('Color', 'Black White')

# Create product types with Namedtuples
Position = namedtuple('Position', [('x', int), ('y', int)])

Piece = namedtuple(
  'Piece',
  [('kind', Kind), ('position', Position), ('color', Color)]
)

# Use toplevel pure functions to handle the logic + actions. This
# moves a piece. For want of a enumable `case` statement…
def move(piece : Piece, board : Board) ->  Piece:
    if piece.kind is Kind.Knight:
        # Move logic for a knight, returns a new piece with
        # altered position

    elsif piece.kind is Kind.Bishop:
        # Move logic for a bishop...


def can_capture(piece : Piece, board : Board) -> List[Piece]:
    if piece.kind is Kind.Knight:
        # Look at what a Knight can capture…

    elsif piece.kind is Kind.Bishop:
        # Look at what a Bishop can capture…
</pre>

Karen was modelling it in a more classical OOP fashion:

<pre style="font-size: .8em; background: #f7f7f7; padding: 15px;">
# Define a class that others can inherit from
class Piece(object):
    # Common members are stored in the base class, available to subclasses.
    def __init__(position, color):
        self.position = position
        self.color = color

    def move(self):
        pass

    def can_capture(self, board):
        pass


# Subclasses, specialize on behavior
class Knight(Piece):
    def move(self):
        # Move logic for a Knight, mutates the instance

    def can_capture(self, board):
        # Look at what a Knight can capture given a board


class Bishop(Piece):
    def move(self):
        # Move logic for a Bishop...

    def can_capture(self, board):
        # Look at what a Bishop can capture, given a board
</pre>

Karen's reaction to my design was somewhat aghast. "You're losing the
encapsulation that OOP provides! Now your code related to Knights is sprinkled 
in 10 different functions! If you want to learn or change something about a
Knight, you have to hunt around a ton of different functions!"

My reaction to Karen's design was somewhat aghast. "You're losing all the
encapsulation that FP provides! Now all your code related to moving is in 10
different classes! If you want to learn or change something about movement, you
have to hunt around a ton of different object definitions!"

Welp.<sup id="place1"><a href="#footnote1">1</a></sup>

So… we're both right. Karen's preference was to have richer objects
that know how to operate on themselves, mine was to have immutable objects with
toplevel functions that return new instances. Her approach doesn't let her have
a single `move` definition, and mine doesn't let me have a single place to look
for `Knight`-related functionality. **Both would work perfectly fine.**

Our reactions misunderstood each other's preferences and needs. We both
wanted to solve the problem of "model chess" but for me it was more an issue of
limiting any complexity brought about by mutable state, for Karen it was about
consolidating the datatypes and their functionality, hiding their behavior from
others, and finding opportunities for re-use.

So let's talk about CSS-In-JS 😄

To recap: CSS was introduced in 1996, got much more popular in the early aughts
with delights like [the CSS Zen Garden][1]. It aims to fix "how should a page be
rendered" with **toplevel, global, declarative statements based on the structure
of your page.**

[CSS-In-JS][8] seems to be the opposite of this:  CSS-In-JS takes the
"componentization" of our pages to an extreme and lets you style
**granular, localized statements to only the component you're currently looking
at.**

Looking at [this Twitter thread][2], it seems like most people with a horse in
this race are talking past each other. The CSS-In-JS people dislike that the
traditional stylesheet rules are global, that they cascade, and that they're
lexically decoupled from the components they're working on, whereas those against
CSS-In-JS dislike it _precisely_ because it takes those properties away.

Welp.

---

Stepping back, I personally prefer CSS-As-Designed than CSS-In-JS, but the
emergence of CSS-In-JS doesn't surprise me. Over the last 20 years, our pages
became apps, those apps have more users than the populations of most nations,
and as our Webmasters became teams of dozens or hundreds of full-time software
developers working together to support every screen size for hundreds of
millions of people who never log off.

CSS is, frankly, _perfect_ if you view the web as a set of linked documents
whose content is mostly textual, represented by persistent and meaningful URLs.
That's exactly what this blog is, and after you get past the
[browser-normalizing bit][3], you get [something rather readable and
high-performance in very few lines.][4]

I also believe its much easier to work with a stylesheet if you're a smaller
team of people working together with little turnover. You can build and enforce
conventions. You have institutional memory. You don't have too many other toes
to step on.

Most Tastemakers™ in tech are extremely large companies who are flexing how they
scale their processes to hundreds or thousands of engineers for products
servicing hundreds of millions of users. _Just because something doesn't scale
to a larger, more glorious case, doesn't mean it's a bad choice!_ Facebook uses
technologies like React and CSS-In-JS, but that doesn't mean you have to use
them; neither does it mean you're wrong if you want to. Saying that
CSS-As-Designed doesn't happily scale to Facebook's engineering teams shouldn't
disqualify it from your project or your company.

But if you _are_ Facebook (or about 10 other companies), then yes, you have so
many fingers working on the pudding at the same time that it's probably a
blessing to have your work gated off from someone else.

---

Most tech fighting is people saying true statements about a technology to argue
some variation of "I don't yet recognize your what tradeoffs you're making, and
I can't imagine why they're valid." These are oftenl said with a ton of
invective.

I wish we'd stop doing that! I also recognize it's hard (you can probably find
a ton of it on this blog, and not even going that far back). Awareness is a
good first step, and I think CSS-In-JS is a strong example to learn from.

(This topic is well-covered, with a different set of examples, in [this
talk.][5])

---
<span id="footnote1">1.</span> <a href="#place1"><strong>^</strong></a>
SICP looks into [almost the same tradeoff][6], though using a pretty different
vocabulary. It also taps into the ["closures are a poor man's objects; objects
are a poor man's closures"][7] refrain.


   [1]: http://www.csszengarden.com/
   [2]: https://twitter.com/bloodyowl/status/1074642042213593089
   [3]: https://github.com/pablo-meier/Pablog/blob/master/static/css/morepablo.css#L11-L450
   [4]: https://github.com/pablo-meier/Pablog/blob/master/static/css/morepablo.css#L456-L531
   [5]: https://www.destroyallsoftware.com/talks/ideology
   [6]: https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book-Z-H-17.html#%_sec_2.4.3
   [7]: https://people.csail.mit.edu/gregs/ll1-discuss-archive-html/msg03277.html
   [8]: https://hackernoon.com/all-you-need-to-know-about-css-in-js-984a72d48ebc
