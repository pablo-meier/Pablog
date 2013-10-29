    Title: Some Professor Layton Prolog!
    Date:2010-09-30T22:47:00
    Tags: pablolife

Time to combine two of my favorite things:  [Professor Layton][1] and obscure
languages!  There was one puzzle (of the hardest diffficulty) that I could have
spent 40 minutes working out, but instead spent an hour and half solving in
Prolog (for those unfamiliar with Prolog, check out [this post][2] for a
description of what this magic language is!).


<!-- more -->

I'll post the puzzle and solution here; hopefully someone finds it fun!

[![][3]][4]

### No 151 from Professor Layton and the Diabolical Box: Colin's Score

Four students took a test where every question had two possible answers, A or
B. Each question was worth 10 points, for a total of 100 points.

The students' test results were posted as seen below, but the teacher forgot
to tally Colin's score. Colin was heading to the teacher's office when Mary
called him back, saying they could figure out his score using the results from
the other tests. Can you figure out Colin's score?

-

Below is the program I wrote to solve it. Verbose by contemporary language
standards, but almost no thinking required, and the answer in an instant! Note
the original version didn't have so many comments; these are to guide the
curious reader.

```prolog
%% A question is a [[question number,answer], correctness].
%% Example:
%% [[1,a], correct]
%% A test is a list of questions.


%% We create a rule that every correct answer is 10 points.
points([_, correct], 10). points([_, incorrect], 0).

%% Create rules flip solutions and whether or not they are incorrect.
flip(a, b). flip(correct, incorrect).
flip(b, a). flip(incorrect, correct).

%% Given a test, calculates the score based on the correctness.
test_score([], 0).
test_score([H|T], Score) :-
  points(H, These_Points),
  test_score(T, Rest_of_Points),
  Score is These_Points + Rest_of_Points.

%% This is the critical rule: it ensures that all tests are scored
%% by the same answer key. This way, Prolog won't find a binding that
%% works for each individual test, but for all tests that get bound.
%% Two empty tests naturally follow the same grading criteria:
sensible_scores([], []).

%% We investigate tests recursively: if both tests have identical heads
%% (e.g. they agree on an answer and its correctness) then the test is
%% 'sensible' (follows a common rubric) as long as the rest of the test does.
sensible_scores([A|T1], [A|T2]) :-
  sensible_scores(T1, T2).

%% If they have the same number but differ in answer, they must also differ
%% in correctness.
sensible_scores([[[A,B],Aye]|T1], [[[A,C],Nay]|T2]) :-
  flip(B, C),
  flip(Aye, Nay),
  sensible_scores(T1, T2).


%% A cheap rule that binds X to Mary's score sheet. Correctness
%% is automagically bound by Prolog!
mary_test(X) :-
  X = [ [[1, b], _],
        [[2, b], _],
        [[3, a], _],
        [[4, b], _],
        [[5, a], _],
        [[6, b], _],
        [[7, b], _],
        [[8, a], _],
        [[9, b], _],
        [[10, b], _]].

%% Dan's score sheet.
dan_test(X) :-
  X = [ [[1, b], _],
        [[2, a], _],
        [[3, a], _],
        [[4, a], _],
        [[5, b], _],
        [[6, a], _],
        [[7, b], _],
        [[8, a], _],
        [[9, a], _],
        [[10, a], _]].

%% Lisa's score sheet.
lisa_test(X) :-
  X = [ [[1, b], _],
        [[2, a], _],
        [[3, a], _],
        [[4, a], _],
        [[5, b], _],
        [[6, b], _],
        [[7, b], _],
        [[8, a], _],
        [[9, b], _],
        [[10, a], _]].


%% And Colin's, whose score we don't know.
colin_test(X) :-
  X = [ [[1, b], _],
        [[2, b], _],
        [[3, a], _],
        [[4, a], _],
        [[5, a], _],
        [[6, b], _],
        [[7, b], _],
        [[8, a], _],
        [[9, a], _],
        [[10, a], _]].

%% Finally, the meat! We bind Lisa, Dan, and Mary to their score sheets.
%% We then use sensible_scores to ensure that their sheets follow the same
%% grading rubric. Finally, we ensure that this rubric adheres to the scores
%% that Mary, Dan, and Lisa obtained.
test_integrity(X) :-
  lisa_test(Lisa),
  dan_test(Dan),
  mary_test(Mary),
  sensible_scores(Lisa, Dan),
  sensible_scores(Dan, Mary),
  sensible_scores(Mary, X),
  test_score(Mary, 70),
  test_score(Dan, 50),
  test_score(Lisa, 30).

%% Finally, we bind Score to what Colin's score is by setting
%% it to his test results, ensuring that his score has the same
%% answer key as his peers, then calculating the score with that
%% answer key.
colin_score(Score) :-
  colin_test(X),
  test_integrity(X),
  test_score(X, Score).
```

   [1]: http://www.morepaul.com/2010/09/repost-professor-layton-and-hell-yes.html
   [2]: http://www.morepaul.com/2009/12/prologgin.html
   [3]: http://2.bp.blogspot.com/_3ys1dwfzc2w/TKV8eSSBEJI/AAAAAAAAAHI/tHj6Z8VErXE/s320/PL2151B.png
   [4]: http://2.bp.blogspot.com/_3ys1dwfzc2w/TKV8eSSBEJI/AAAAAAAAAHI/tHj6Z8VErXE/s1600/PL2151B.png
