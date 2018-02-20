    Title: Social Golfer problem
    Date:2010-05-06T12:33:00
    Tags: pablolife

One summer I spent working with a professor, the father of a friend heard my
plans and remarked (to my friend, not to me)

> I can't think of anything less intellectually stimulating than writing
> computer code for 7 hours a day.

<!-- more -->

After some thinking, my guess was they were probably confusing _programming_
with _data entry_. Moments like these make me realize how much I take computer
literacy for granted, especially among older folk. The Supreme Court [makes
similar mistakes][1], to much lulz.

I frequently find it helpful then to describe a problem that we work on, since
lots of them can be easily described without mathematical notation. One of
these has been a real hair-puller these last few days, called the **Social
Golfer Problem**.

<h3 id="problem-statement">Problem Statement</h3>

The premise is this: you're organizing a golf tournament with 9 people in it.
They play every week in groups of 3, and want to play for three weeks.

Here's the catch: they are _social_ golfers, meaning if possible, they never
want to play in a group with the same people twice. Your job is to organize the
tournament; you have to arrange who plays with whom every week.

So rather than use names, we'll just use numbers. The first week could look
something like this:

<table>
<tr>
  <th>Week Number</th>
  <th>Team 1</th>
  <th>Team 2</th>
  <th>Team 3</th>
</tr>
<tr>
  <td><strong>1</strong></td>
  <td>1,2,3</td>
  <td>4,5,6</td>
  <td>7,8,9</td>
</tr>
</table>

And here's how it could look after three weeks:

<table>
<tr>
  <th>Week Number</th>
  <th>Team 1</th>
  <th>Team 2</th>
  <th>Team 3</th>
</tr>
<tr>
  <td><strong>1</strong></td>
  <td>1,2,3</td>
  <td>4,5,6</td>
  <td>7,8,9</td>
</tr>
<tr>
  <td><strong>2</strong></td>
  <td>1,4,7</td>
  <td>2,5,8</td>
  <td>3,6,9</td>
</tr>
<tr>
  <td><strong>3</strong></td>
  <td>1,5,9</td>
  <td>2,6,7</td>
  <td>3,4,8</td>
</tr>
</table>

Notice that the player "1" played with two totally different people in week two,
and in week three "1" didn't play with anyone they played with from weeks one
and two.

So here's the question: could you organize a tournament like this with 100
people, in groups of 10, for 10 weeks?

Because if you could, you could get published in a Computer Science paper.
Whether or not its even _possible_ to schedule such a tournament is an open
problem.

For [Solving Hard Problems][2], we have to write a program that takes three
numbers

* _g_ - the number of groups in a week.
* _s_ - the size of each group.
* _w_ - the number of weeks.


and either prints a schedule for a social golfing tournament, or tells you its
impossible.

It's a really cute problem. Hopefully in a few days, when it's done and gone,
I can write about how I wrote the program. In the meantime, how would you go
about it?

   [1]: http://blogs.wsj.com/law/2010/04/19/our-tech-savvy-supreme-court/
   [2]: http://cs.brown.edu/courses/cs258/
