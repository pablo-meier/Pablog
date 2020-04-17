    Title: In defense of LocalTime
    Date: 2018-09-12T19:56:22
    Tags: DRAFT
    og_image:
    og_description:

<small><em>The song for this post is <a href=""></a>, by .</em></small>

What's a programming abstraction that you feel gets no love? I rarely get mad
over engineering decisions anymore, but here's a thing that got me mad, and I'll
use this space to air out an unpopular opinion. Here it is: _LocalTimes aren't
useless._

### What is LocalTime?

LocalTime is an object representing a time (or DateTime) _without a timezone._
So, "16:00" instead of "16:00 EST". Most time libraries have multiple
representations of instants: one with the timezone, and one without (compare
Joda-Time's [LocalDateTime][1] with [DateTime][2], or Elixir's
[NaiveDateTime][3] with [DateTime][4]).

### What sucks about LocalTime?

If you're storing them, you can't confidently compare them with each other with
confidence, since without a timezone, you don't really know when they happened.

### How do you fix LocalTime?

When you're designing an application, the general tips are "you should always
normalize you times to UTC" _or_ "you should store times with their time zones."

### So… why are you _defending_ LocalTime?

I found a case where I believe it makes sense to use them. Fitness


   [1]: http://www.joda.org/joda-time/apidocs/org/joda/time/LocalDateTime.html
   [2]: http://www.joda.org/joda-time/apidocs/org/joda/time/DateTime.html
   [3]: https://hexdocs.pm/elixir/NaiveDateTime.html
   [4]: https://hexdocs.pm/elixir/DateTime.html
