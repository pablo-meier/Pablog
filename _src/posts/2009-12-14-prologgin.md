    Title: Prologgin'
    Date:2009-12-14T00:51:00
    Tags: pablolife

Exam season is a royal pain, but I find ways to entertain myself.  My most
recent delight has been [Project Euler][1]: I discovered it late last
semester, and took a break until about November to tackle some [Facebook
puzzles][2]. But with the gaps between commitments getting smaller and
smaller, and with a desire to use some more unorthodox languages (Facebook
doesn't accept Scheme or SML submissions, for example), tackling 15 or so of
the easier Project Euler problems proved fitting.

I recently solved [Problem 54][3], an unusually straightforward implementation
problem (most problems require some mathematical insight, this was a straight-
up write-it-out problem). In Problem 54, they provide a file with 1000 games
of poker, and you must determine how many games the first player wins.

**So here I saw an opportunity: Prolog!** Wouldn't it be more fun to just
_declare_ the rules of Poker and say "go," rather than hard-code every
individual evaluation possibility?

-

For those who don't know what Prolog is, here's a quick (very, very brief)
primer: **Prolog is a language that attempts to satisfy truth clauses given a
set of relations, and rules that govern them.** So if I were to define the
following relation **R**:

<div style="text-align: center">
(_a_ **R** _b_) is true if and only if _a_ is the reverse of _b_.
</div>

Then we know that ("paul" **R** "luap") is a true statement, but ("paul" **R**
"robert") is false.

In Prolog, you supply the language with any relations you like (such as **R**,
above), and when you provide data to those relations it can tell you if they
are true or not.

Yawn. Here's the kicker: **In Prolog, you can supply variables to the
relations, and the language will bind those variables to values that satisfy
its truth, without having to specify exactly how to find such a value.** Using
the example above, if I fed Prolog

<div style="text-align: center">
_x_ **R** "cantankerous"
</div>

Prolog returns

<div style="text-align: center">
_x_ = "suoreknatnac"
</div>

The key to this is that I never told Prolog _how_ to reverse a word, I simply
_declared_ that **R** is true when one side is the reverse of the other. This
becomes more clear as I go through the poker example: when you program in
Prolog, you aren't thinking "what instructions can I give a machine primarily
using destructive memory updates such that I can compute my goal?" (generally
what happens in imperative programs), or "what functional abstractions can I
define such that one's output evaluates to my goal?" (functional programs),
but rather "what is my goal?" (logical programs, of which Prolog is the most
popular language).

-

I'll throw a little syntax in before we dive into the example. In Prolog,
square brackets define a list, so \[\] is an empty list, `[paul, robert,
annalisa]` is a list with my siblings and I, and `[[galosh, wader],[souvlaki,
moussaka, gyro],gawker]` is a list of two lists and "gawker."

In my poker program, each card is a list of the cards value and its suit (e.g.
`[ace,spades]` or `[8,diamonds]`). A list of five cards is a hand, and a list of
two hands is a game between two players.

Throwing it all together, here's are some of the rules I wrote that determine
a player's hand in poker:

```prolog
determine_hand([[_,X],[_,X],[_,X],[_,X],[_,X]], flush).
```

In English, this says: the relation _determine\_hand_ is true if two conditions
are met. The first value is a hand of cards, for which the second value on
every pair (the suit) is the same value X. Second, the second value of
_determine\_hand_ is the value "flush." The underscore in the place of the
values of the cards tells Prolog "we don't care what goes there," since
getting a flush is only dependent on the suits of the cards. Here is another:

```prolog
determine_hand([[10,X],[jack,X],[queen,X],[king,X],[ace,X]], royal_flush).
```

This clause says: the relation _determine_hand_ is true if two things occur:
the first, its left side is a 5-tuple of pairs. The values of the represented
cards must be 10, jack, queen, king, and ace; the second value (the suit) for
each card must all be the same value X. Secondly, the right side of
_determine_hand_ must be the value "royal_flush."

So if I then prompted Prolog with:

```prolog
determine_hand([[10,clubs],[3,clubs],[8,clubs],[queen,clubs],[6,clubs]], HandType).
```

Prolog would search the possible values for HandType (variables begin with
capital letters) until it found some value to make it true given the rules
I've provided above. We see that all suit values are the same ("clubs"), so
Prolog replies:\*

```prolog
HandType = flush.
```

-

Like any evaluator of conditional statements, the relation rules can be
chained together with standard boolean operators. The following mean:

* _left_`:-`_right_ means _left_ is true if _right_ is true.
* Commas mean logical AND.
* Semicolons mean logical OR.
* And, of course, you can group with parenthesis (AND gets higher precedence
than OR).


This should be enough (coming at you very fast!) to give you a flavor for how
the program worked. Here is the top-level relation:

```prolog
winner(H1, H2, Winner) :-
   sort_hand(H1, Sorted_Hand1),
   sort_hand(H2, Sorted_Hand2),
   determine_hand(Sorted_Hand1, X1),
   determine_hand(Sorted_Hand2, X2),
   beats(X1, X2, Verdict),
   (Verdict = X1, Winner = H1;
    Verdict = X2, Winner = H2;
    Verdict = tie,
    tiebreak(X1, Sorted_Hand1, Sorted_Hand2, SortedWinner),
     (SortedWinner = left, Winner = H1 ;
      SortedWinner = right, Winner = H2)).
```

It goes something like this in English: The _winner_ relation is true if the
following are true, for two poker hands H1 and H2, and some value Winner:

1. Sorted\_Hand1 is bound to the first value that makes sort\_hand(H1,
Sorted\_Hand1) true. In this case, it's true when a hand is sorted by ascending
value, so if

    H1 = [[4,spades],[king,clubs],[9,hearts],[3,diamonds],[9,spades]].

the predicate becomes true if

    SortedHand = [[3,diamonds],[4,spades],[9,spades],[9,hearts],[king,clubs]].

Which Prolog will find for us ^\_^

2. Find the same value for the second Hand.

3. X1 and X2 are the values of determine\_hand for the Sorted\_Hands, and
these are bound to the appropriate types of hand in poker (e.g. "two pair" and
"full house").

4. beats is true when the third value (in this case, Verdict) is the winner
of the first two hands. If the two hands are the same, Verdict becomes "tie."

5. One of three things is true: Either Verdict is X1, and Winner is H1 (the
left player has a higher hand), OR Verdict is X2, and Winner is H2, OR there
was a tie, in which case tiebreak becomes true if it's fourth value is the
winner of two hands of the same type. (the problem guarantees there's always a
clear winner, so we won't have actual tie games, such as two royal flushes).

-

It's a pretty radical departure from more traditional ways of programming. For
those interested in logic programming, there are some great chapters near the
end of [PLAI][4] on the subject. Also, [The Reasoned Schemer][5] is essential,
and the 'logical Scheme' they use is an interesting counterpoint to Prolog.

I firmly believe you should base your language choice on the problem you're
trying to solve, and you shouldn't contort your problem to fit the language
(this is why Lisp is so much fun). I don't run into too many problems where
Prolog is the answer, but when I always greatly look forward to when I do ^_^

--
Prolog links:

* [SWI-Prolog][6], a free and pretty nice implementation.
* [GNU Prolog][7], a little harder to get started with, but worth looking
into.

* [99 Prolog Problems.][8] These have [since][9] [been][10] [copied][11]
many times over, but the first '99 Problems' set of this sort was by
Prologgers.

* [The First 10 Prolog Programming Contests.][12] A good read for idiomatic
language use, and seeing it solve all levels of problems.


\* = If, given the definitions, you then passed determine\_hand(X,Y), where x
was a royal flush, y would be bound to "flush." why? because the first
predicate we defined was successful (a royal flush is just a more specialized
flush, and prolog saw that determine_hand was true for the flush first). how
do we get around this? you can either by ordering your clauses appropriately,
or explicitly stating that one clause can only be true when the others are
false.


--
the code:

```prolog
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Top Level

main(Num_Wins) :-
  open(hands, read, Fb),
  read(Fb, ListOfHands),
  play(ListOfHands, Num_Wins).

play([],0).
play([[Hand1,Hand2]|Rst], Num_Wins) :-
  winner(Hand1, Hand2, Winner),
  (Winner = Hand1, play(Rst,Remaining), Num_Wins is 1 + Remaining ;
   play(Rst, Num_Wins)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Playing the game.
winner(H1, H2, Winner) :-
  sort_hand(H1, Sorted_Hand1),
  sort_hand(H2, Sorted_Hand2),
  determine_hand(Sorted_Hand1, X1),
  determine_hand(Sorted_Hand2, X2),
  beats(X1, X2, Verdict),
  (Verdict = X1, Winner = H1;
   Verdict = X2, Winner = H2;
   Verdict = tie, tiebreak(X1, Sorted_Hand1, Sorted_Hand2, SortedWinner),
   (SortedWinner = left, Winner = H1 ;
    SortedWinner = right, Winner = H2)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Tiebreaks
tiebreak(straight_flush, H1, H2, Winner) :- higher_last_card(H1, H2, Winner).
tiebreak(four_of_a_kind, H1, H2, Winner) :- higher_middle_card(H1, H2, Winner).
tiebreak(full_house, H1, H2, Winner) :- higher_middle_card(H1, H2, Winner).
tiebreak(flush, H1, H2, Winner) :- tiebreak(high_card, H1, H2, Winner).
tiebreak(straight, H1, H2, Winner) :- higher_last_card(H1, H2, Winner).
tiebreak(three_of_a_kind, H1, H2, Winner) :- higher_middle_card(H1, H2, Winner).

tiebreak(two_pair, H1, H2, Winner) :-
  isolate_pairs(H1, [HighCard1,_], [LowCard1,_], Last1),
  isolate_pairs(H2, [HighCard2,_], [LowCard2,_], Last2),
  (beats_with_hand(H1, HighCard1, H2, HighCard2, Winner),
   Winner \= tie;
   beats_with_hand(H1, LowCard1, H2, LowCard2, Winner),
   Winner \= tie;
   beats_with_hand(H1, Last1, H2, Last2, Winner)).

tiebreak(pair, H1, H2, Winner) :-
  isolate_pair(H1, [PairCard1,_], Rst1),
  isolate_pair(H2, [PairCard2,_], Rst2),
  (beats_with_hand(H1, PairCard1, H2, PairCard2, Winner), Winner \= tie ;
   tiebreak(high_card, Rst1, Rst2, Winner)).

tiebreak(high_card, H1, H2, X) :-
  reverse(H1, RevH1),
  reverse(H2, RevH2),
  highest_card_chain(RevH1, RevH2, X).




beats_with_hand(H1, C1, H2, C2, X) :-
  beats(C1, C2, C1), X = left ;
  beats(C1, C2, C2), X = right ;
  X = tie.

% Really ugly. How to better do this?
isolate_pairs(Hand, High_Pair, Low_Pair, Last) :-
  [[V1,S1],[V2,S2],[V3,S3],[V4,S4],[V5,S5]] = Hand,
  (V5 = V4, High_Pair = [[V4,S4],[V5,S5]],
    (V3 = V2, Low_Pair = [[V3,S3],[V2,S2]], Last = [V1,S1] ;
     V1 = V2, Low_Pair = [[V1,S1],[V2,S2]], Last = [V3,S3])) ;
  (Low_Pair = [[V1,S1],[V2,S2]],
   High_Pair = [[V3,S3],[V4,S4]],
   Last = [V5,S5]).

isolate_pair(Hand, Pair, Rst) :-
  [[V1,S1],[V2,S2],[V3,S3],[V4,S4],[V5,S5]] = Hand,
  (V1 = V2, Pair = [[V1,S1],[V2,S2]], Rst = [[V3,S3],[V4,S4],[V5,S5]] ;
   V2 = V3, Pair = [[V3,S3],[V2,S2]], Rst = [[V1,S1],[V4,S4],[V5,S5]] ;
   V4 = V3, Pair = [[V3,S3],[V4,S4]], Rst = [[V1,S1],[V2,S2],[V5,S5]] ;
   V4 = V5, Pair = [[V5,S5],[V4,S4]], Rst = [[V1,S1],[V2,S2],[V3,S3]]).


highest_card_chain([H1|T1], [H2|T2], X) :-
  beats(H1,H2,Verdict),
  (Verdict = H1, X = left ;
   Verdict = H2, X = right ;
   Verdict = tie, highest_card_chain(T1,T2,X)).

higher_last_card(H1,H2,Winner) :-
  H1 = [_,_,_,_,[V1,_]],
  H2 = [_,_,_,_,[V2,_]],
  beats(V1,V2,Higher),
  (Higher = V1, Winner = left ;
   Higher = V2, Winner = right).

higher_middle_card(H1, H2, Winner) :-
  H1 = [_,_,[V1,_],_,_],
  H2 = [_,_,[V2,_],_,_],
  beats(V1,V2,Higher),
  (Higher = V1, Winner = left;
   Higher = V2, Winner = right).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Hand determination
determine_hand([[10,X],[jack,X],[queen,X],[king,X],[ace,X]], royal_flush).

determine_hand([[A,X],[B,X],[C,X],[D,X],[E,X]], straight_flush) :-
  successor(E,D), successor(D,C), successor(C,B), successor(B,A).

determine_hand([[C,_],[A,_],[A,_],[A,_],[B,_]], four_of_a_kind) :-
  C = A ; B = A.

determine_hand([[A,_],[B,_],[C,_],[D,_],[E,_]], full_house) :-
  A = B, D = E, (C = D ; C = B).

determine_hand([[_,X],[_,X],[_,X],[_,X],[_,X]], flush).

determine_hand([[A,_],[B,_],[C,_],[D,_],[E,_]], straight) :-
  successor(E,D), successor(D,C), successor(C,B), successor(B,A).

determine_hand([[A,_],[B,_],[C,_],[D,_],[E,_]], three_of_a_kind) :-
  (A = B, B = C); (B = C, C = D); (C = D, D = E).

determine_hand([[A,_],[A,_],[B,_],[B,_],[_,_]], two_pair).
determine_hand([[_,_],[A,_],[A,_],[B,_],[B,_]], two_pair).
determine_hand([[A,_],[A,_],[_,_],[B,_],[B,_]], two_pair).

determine_hand([[A,_],[B,_],[C,_],[D,_],[E,_]], pair) :-
  A = B; B = C; C = D; D = E.

determine_hand(_,high_card).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Hand sorting (for easier pattern matching).
sort_hand([], []).
sort_hand([H|T], Sorted) :-
  filter_by_high_card(H,T,Lower,Higher),
  sort_hand(Lower,SortedLower),
  sort_hand(Higher,SortedHigher),
  append(SortedLower, [H|SortedHigher], Sorted).


filter_by_high_card(_, [], [], []).
filter_by_high_card(Pivot, [H|T], [H|Lower], Higher) :-
  beats(Pivot,H,Z),
  (Z = Pivot ; Z = tie),
  filter_by_high_card(Pivot, T, Lower, Higher).
filter_by_high_card(Pivot, [H|T], Lower, [H|Higher]) :-
  beats(Pivot,H,H),
  filter_by_high_card(Pivot, T, Lower, Higher).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Card and Hand Precedence
beats([V,_],[V,_],tie).
beats([V1,S],[V2,_],[V1,S]) :- value_greater_than(V1,V2).
beats([V1,_],[V2,S],[V2,S]) :- value_greater_than(V2,V1).

beats(X,X,tie).
beats(X,Y,X) :- value_greater_than(X,Y).
beats(X,Y,Y) :- value_greater_than(Y,X).

successor(royal_flush, straight_flush). successor(straigh_flush, four_of_a_kind).
successor(four_of_a_kind, full_house). successor(full_house, flush).
successor(flush, straight). successor(straight, three_of_a_kind).
successor(three_of_a_kind, two_pair). successor(two_pair, pair).
successor(pair, high_card).

successor(ace,king). successor(king,queen). successor(queen,jack).
successor(jack,10). successor(10,9). successor(9,8).
successor(8,7). successor(7,6). successor(6,5).
successor(5,4). successor(4,3). successor(3,2).

value_greater_than(X,Y) :-
  successor(X,P),
  (Y = P;
  value_greater_than(P,Y)).

```

Enjoy!


   [1]: http://www.projecteuler.net/
   [2]: http://www.facebook.com/careers/puzzles.php
   [3]: http://projecteuler.net/index.php?section=problems&id=54
   [4]: http://www.cs.brown.edu/%7esk/publications/books/proglangs/2007-04-26
   [5]: http://www.amazon.com/reasoned-schemer-daniel-p-friedman/dp/0262562146/ref=sr_1_1?ie=utf8&s=books&qid=1260806430&sr=8-1
   [6]: http://www.swi-prolog.org/
   [7]: http://www.gprolog.org/
   [8]: https://prof.ti.bfh.ch/hew1/informatik3/prolog/p-99/
   [9]: http://www.haskell.org/haskellwiki/H-99:_Ninety-Nine_Haskell_Problems
   [10]: http://aperiodic.net/phil/scala/s-99/
   [11]: http://www.ic.unicamp.br/%7Emeidanis/courses/mc336/2006s2/funcional/L-99_Ninety-Nine_Lisp_Problems.html
   [12]: http://www.cs.kuleuven.be/%7Edtai/ppcbook/
