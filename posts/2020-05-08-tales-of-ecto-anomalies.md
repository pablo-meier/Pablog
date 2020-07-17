    Title: 👻 Tales of Ecto Anomalies 📚
    Date: 2020-05-08T03:56:03
    Tags: engineering, blurb
    og_image: https://morepablo.com/img/2020/5/ecto_ghostbusters_THUMB.jpg
    og_description: Ecto is my favorite DB library; I document some odd corners (or limitations) I've found working in it.

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=pwD25Kv_49A">K.K. Synth</a>, by Kazumi Totaka for Animal Crossing.</em> 🎵</small>

[This article][1] called "small, sharp tools can cut you, is a good complement to
[the little thing I wrote about old command-line utilities][2].

Also, Karen left a barbell by my door in _Animal Crossing_ and I nearly cried. I
miss weight training. You wouldn't know it because I'm not that big but
last year I was really getting into it, and bodyweight exercises just don't
feel as great. It's also the ritual of leaving whatever bullshit is happening in
your brain, your house, or your office for an hour, by yourself, for yourself.
_That's_ what I'm feeling the lack of. 

My friend shared a short story which had a scene with two people having a
conversation over stale nachos and a cafeteria burrito, and I thought "good
lord, I'd love a burrito."

I don't miss much (social situations tend to make me anxious lol), but I miss
things like these, and since [the plan is to have no plan][3] it looks like we
won't be safe to really go out until, like, November.

### Four Ecto stories

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2020/5/ecto_ghostbusters_THUMB.jpg" alt="Ecto 1, from Ghostbusters." style="margin: 15px auto;" />
</div>

What's this? A technical blog post? Get it while it's hot, _ya nerds._

[Ecto][11], the most popular database library for Elixir, is my favorite tool of
its kind. It makes me pull my hair out far less than SQLAlchemy; the only tools
I like as much are "just use SQL" tools like [Dropwizard's JDBI][12] connections
or something like [PugSQL][13], and Ecto's abstractions (query objects that
compose well, changesets that are easy to test and inspect) legit provide a fair
bit of convenience with few surprises.

That said, I've run into a few hairs that I'm documenting to show that
yes, every tool makes tradeoffs, every abstraction leaks, and might save you
some time if you use Ecto.

#### Ecto Schema's "where it came from" + Phoenix editability

Following "convention over configuration," Ecto and its schemas work very
closely with Phoenix to provide a smooth workflow. In the default Phoenix world,
for new and edit forms, you usually define a template for that form and pass
it a Changeset which it uses to populate the fields. So your `new` controller
does something like:

<pre style="background-color: #efefef; font-size: .8em">
changeset =
  %MyEntity{}
  |> change()
render("new.html", changeset: changeset)
</pre>

and your `edit` controller does something like

<pre style="background-color: #efefef; font-size: .8em">
changeset =
  entity_id
  |> MyEntity.get_entity!(entity_id)
  |> change()
render("edit.html", changeset: changeset)
</pre>

where `"new.html"` and `"edit.html"` both contain a `"form.html"` sub-template,
and `new` keeps the fields empty, while `edit` populates the fields of your
entity.

So I got confused when I converted an Ecto query to a raw SQL one with a custom
mapper, I suddenly never rendered the form as an `edit`, always a `new`, even
though I called it from an edit controller?

The cause: schemas will set where they "came from:" did they come from an
existing database entity that's already been persisted, or does this represent
an new instance that hasn't yet been persisted? Schemas have a `meta` field
with its `source` field that either gets set from a fetch function as `:loaded`
("I represent a persisted entity, I come from the DB") but, if not set (as in
the case when you build a schema in your code) instead defaults to `:built`.
When I created a custom mapper for `MyEntity`, I created an instance of it and
filled in the fields manually from the fetched rows of the SQL. Since its meta
was set to `:built`, not `:loaded`, Phoenix took it to mean "oh, this entity
isn't represented in the DB, so you must be creating a new one," and creates a
`new` form. You can see some relevant sources [here][14] and [here][15].

The fix was to put my custom-mapped structs through `Ecto.put_meta(schema,
state: :loaded)` ([doc][16]), so Phoenix knew this represents an object from the
DB, and thus should open an edit form.

#### Relationships 1: The Hidden Inner Join

Ecto does something cool: if you specify a relationship between two entities
(e.g. a Post has lots of Comments) and fetch one, it won't _ever_ pull the
related entities unless you ask explicitly (in fact, the only way to talk to the
DB at all is with a call that goes through `Repo`, so you're never accidentally
touching the DB). SQLAlchemy, by default, does ["lazy joining,"][17] so if you
get a blog post:

<pre style="background-color: #efefef; font-size: .8em">
p = db.session.query(Post)\
      .filter(Post.id == 10)\
      .one_or_none()              # hey, a SQL query happened!

for comment in p.comments:        # another SQL query happened here,
   check_for_profanity(comment)   # like you obviously intended.
   send_thank_you(comment.writer) # Maybe one happens in this for loop?
</pre>

Ecto doesn't do this, if you tried to pull the comment or the comment's author,
it'll return a useless value, informing you that you haven't "preloaded" the
related entity. There are two ways to do this: either _after_ you've loaded the
initial entity:

<pre style="background-color: #efefef; font-size: .8em">
from(p in Post, where: p.id == 10) |> Repo.one() |> Repo.preload([:comments])
</pre>

This is two round trips. Or, you can preload as part of your initial query:

<pre style="background-color: #efefef; font-size: .8em">
from(p in Post,
  where: p.id == 10,
  preload: [comments: c])
  |> Repo.one()
</pre>

That's one round trip, so it's obviously better!

**But!** There be dragons in that above query 👆 I had a query that looked like:

<pre style="background-color: #efefef; font-size: .8em">
from(e in Entity,
  where: e.id == ^id,
  left_join: a in RelationA,
  left_join: b in RelationB,
  left_join: c in RelationC,
  preload: [relation_a: a, relation_b: b, relation_c: c])
</pre>

Where e always had a relation to one of A, B, or C. It was returning 0 rows,
but when I printed it with [the StackOverflow accepted answer for "how do I print
the SQL of my Ecto query,"][18] it looked like:

<pre style="background-color: #efefef; font-size: .8em">
SELECT &lt;some fields&gt; FROM entity e
  LEFT JOIN relation_a a ON (&lt;condition&gt;),
  LEFT JOIN relation_b b ON (&lt;condition&gt;),
  LEFT JOIN relation_c c ON (&lt;condition&gt;)
WHERE e.id = &lt;id&gt;
</pre>

_and which, when I ran it, produced rows!_ What gives?

Turns out, to support the "one roundtrip preload," it uses an inner JOIN, _but
that won't be printed when you ask for the SQL representation_. See [this
issue][19].

The solution was to bite the bullet and accept a second round-trip:

<pre style="background-color: #efefef; font-size: .8em">
from(e in Entity,
  where: e.id == ^id,
  left_join: a in RelationA,
  left_join: b in RelationB,
  left_join: c in RelationC)
  |> Repo.one!()
  |> preload([:a, :b, :c])
</pre>

Tradeoffs in design!

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2020/5/ecto-cooler_THUMB.jpg" alt="Ecto Cooler children's drink." style="margin: 15px auto;" />
</div>

#### Relationships 2

This one stumped me, so I wrote a [Stack Overflow question][112].

> I'm trying to model one entity A as append-only, with another child entity
> that references the first. So A has a structure like (sorted by `inserted_at`
> DESC):
> 
> <pre style="background-color: #efefef; font-size: .8em">
> |  id  |  version  |  column | inserted_at |
> |------|-----------+---------|-------------|
> |   5  |     2     |  "baz"  | 2020-04-20  |
> |   3  |     2     |  "zoot" | 2020-04-20  |
> |   3  |     1     |  "bar " | 2020-04-18  |
> |   5  |     1     |  "foo"  | 2020-04-10  |
> </pre>
> 
> `(id, version)` forms the primary key for A (One could do `(id, inserted_at)`
> as well, but the developer decided version numbers were more readable).
> 
> Now B belongs to A, and each B will correspond with exactly one `(id,
> version)` pair of A. So something like:
> 
> <pre style="background-color: #efefef; font-size: .8em">
> |  id  |  a_id | a_version |  column | inserted_at |
> |------|-------+-----------+---------+-------------|
> |   4  |   5   |    2      |  "pigs" | 2020-05-05  |
> |   3  |   5   |    2      |  "goats"| 2020-05-03  |
> |   2  |   5   |    1      |  "rams" | 2020-05-02  |
> |   1  |   3   |    1      |  "bears"| 2020-04-18  |
> </pre>
> 
> my question is, how can I model these with Ecto Schemas? I think I know from
> reading docs what the A schema looks like, except for the has_many:
> 
> <pre style="background-color: #efefef; font-size: .8em">
> defmodule MyASchema do 
>   use Ecto.Schema
> 
>   @primary_key false
>   schema "table_a" do
>     field :id, :id, primary_key: true
>     field :version, :integer, primary_key: true
>     field :column, :string
>     field :inserted_at, :utc_datetime
>     has_many :bs, MyBSchema  # what goes here for :foreign_key?
>   end
> end
> </pre>
> 
> But the B schema (especially belongs_to) is less clear to me:
> 
> <pre style="background-color: #efefef; font-size: .8em">
> defmodule MyBSchema do 
>   use Ecto.Schema
> 
>   @primary_key
>   schema "table_b" do
>     field :id, :id, primary_key: true
>     field :column, :string
>     field :inserted_at, :utc_datetime
> 
>     # how does belongs_to work here? would it be 
>     #
>     # belongs_to :a, MyASchema, primary_key: [:id, :version]
>     #
>     # or 
>     #
>     # belongs_to :a, MyASchema, define_key: false
>     # field :a_id, :id
>     # field :a_version, :integer
>     #
>     # ? If so, how could I query such that the :a field of the
>     # struct is populated?
>   end
> end
> </pre>

The solution, it seems was… there isn't a way! [Thanks Everett for digging it
up][113]:

> According [to the Elixir forum][114], Ecto does not support compound foreign keys
> when working with associations.
> 
> One solution would be to add a "regular" unique primary key (e.g. an
> auto-incrementing integer or UUID) and base the references off of that id.
> Sometimes you make consolations when working with database abstraction layers
> because relationships are easier to define when the database has a simple
> one-column primary key (i.e. not a composite).
> 
> If altering the database schema is not possible, then you would need to
> manually resolve the associations in your code. You may need to set up
> multiple transactions as outlined by [this post][115].

This isn't to say its _impossible_, just that I'd have to wrap a lot of "normal"
Ecto operations into some strange contortions for this one entity, unless I have
an otherwise-meaningless ID on the row that only serves to give Ecto some
assistance. I haven't decided what I'll do yet.

#### Plans, indices, preparedness, Ecto

This one made the rounds when it was first released, but [lain's post while
developing Pleroma][111] shows some peculiarities that can be observed with
Ecto's default behaviour to used prepared statements and certain index types.
Worth reading the whole thing (and lain does a fantastic job of injecting humor,
humanity, and relevant examples).

#### Anyway

Ecto is great. But taking a declarative, relational model and moving it to
domains people use general-purpose languages in always produces casualties.

   [1]: https://avdi.codes/the-limits-of-small-sharp-tools/
   [2]: /2020/04/command-line-aoc.html
   [3]: https://pressthink.org/2020/05/the-plan-is-to-have-no-plan/
   [11]: https://hexdocs.pm/ecto/Ecto.html
   [12]: https://www.dropwizard.io/en/latest/manual/jdbi3.html
   [13]: https://pugsql.org/
   [14]: https://github.com/elixir-ecto/ecto/blob/96f1d6b7de14283b01155829a1bd77bc0cfaacbb/lib/ecto/schema/metadata.ex#L5-L15
   [15]: https://github.com/elixir-ecto/ecto/blob/96f1d6b7de14283b01155829a1bd77bc0cfaacbb/lib/ecto/schema.ex#L1742
   [16]: https://hexdocs.pm/ecto/Ecto.html#put_meta/2
   [17]: https://docs.sqlalchemy.org/en/13/orm/loading_relationships.html#lazy-loading
   [18]: https://stackoverflow.com/a/36770980/196469
   [19]: https://github.com/elixir-ecto/ecto/issues/1734#issuecomment-252689042
   [111]: https://blog.soykaf.com/post/postgresql-elixir-troubles/
   [112]: https://stackoverflow.com/questions/61647533/reference-a-composite-key-in-a-belongs-to-association-in-ecto
   [113]: https://stackoverflow.com/a/61648751/196469
   [114]: https://elixirforum.com/t/ecto-assoc-with-a-composite-foreign-key/11848/9
   [115]: https://stackoverflow.com/questions/61250436/how-to-retrieve-id-from-previous-inserted-table-key-by-ecto-multi/61316039#61316039


