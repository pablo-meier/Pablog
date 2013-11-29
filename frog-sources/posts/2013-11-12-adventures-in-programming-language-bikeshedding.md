    Title: Adventures in Programming Language Bikeshedding
    Date: 2013-11-12T10:56:17
    Tags: plt, culture

["Greg"][2] opens a great little [bikeshedder][5] on rust-dev, proving that you can
wink and "ironically" be aware that you're doing something you might think is uncool
in the general sense while still totally doing it, even if you're aware of it (see
["ironic racism"][3]). While much less harmful than marginalizing people, he's
suggesting in the subject title ("For Great Justice") and his many qualifications
('I am aware that I am jumping into an issue at a point in time that's considered
"late in the game".') he seems to be aware that his emails are coming from a place
where they probably won't be implemented, but he still just can't help himself
but send them.

I don't mean to be too hard on the guy -- he's cordial, and I don't want to hate
too hard on someone who's just loving what they do, and wanting to spread it.
I think the Rust devs did a good job in their responses of giving his requests
credence while also declining. The thread makes for a cute read if you're not
used seeing these things.

<!-- more -->

---

[Yin Wang][1] decides to try to shed light into why FP and OOP are _both_ just 
wrong.  I'm guessing the certainty in this statement

> Over the years of doing programming languages research, I have seen the answer
> clearly, so I often find it pointless debating with people on these issues.

is more likely to do with poor use of language than the kind of bravado needed to
claim "solving" subjective qualities for a domain as large as computing and the
languages behind them.

The article disappoints, imo: in order to suggest that OOP is "wrong," he writes

> You may argue that in Python or Scala, functions are also objects. In Python,
> every object with the method `__call__` is a function. Likewise, in Scala,
> functions are just objects with a method named apply. But after some careful
> thought, you will see that this is confusing the fundamental with the derived.
> Functions are fundamental, but objects containing them are derived. `__call__`
> and apply are themselves the “function objects” you are trying to define in
> the first place. Python and Scala just kidnapped the functions, jailed them
> into “objects”, labeled them "`__call__`" and "apply", and then call them
> "methods". Of course, when you wrap a function into an object, you can use the
> object like a function, but this doesn’t mean you can say “functions are also
> objects”.

But semantically, you don't lose a whole lot, right? I mean, yes, syntactically,
writing

```rkt
(map (λ (x) (transform (string-append "prefix->" (str x))) list))
```

is way more fun than writing something like

```java
Lists.map(new Function<DomainElement, RangeElement>() {
    @Override
    public RangeElement apply(DomainElement t) {
       RangeElement elem = transformObject.apply("prefix->".concat(t.toString()));
       return elem;
    }
}, list);
```

but they do about the same thing, right? So saying a "fundamental" is "jailed"
doesn't really say OOP is inherently flawed: just that you may not like the
definitions.

His analysis on FP is similarly meh -- he states circular data structures are
"hard" in Haskell, but

```hs
circularList = [4,5,6] ++ take 3 circularList
```

works in one line. It's the kind of statement you make when you read a lot of
people fight about programming languages, but don't do a whole lot of work on
them yourself.

---

Bikeshedding is a lot of fun, and we [do it for a lot more than languages.][4]
It's also critically important: everyone needs to go through a phase where they
have passion and opinions before they learn things that might temper them a bit.
Not to say that strong opinions are themselves a sign of not knowing things -- if
you're lucky, you'll keep your passionate opinions, but have a bit more
ammunition to back them. Check out [Robert Harper's blog][6], where he can more
or less go to war with Haskell calling it [exceptionally unsafe][7] and that its
monads are [really no big deal compared to SML's][8], but the author has also
written [amazing books on type theory.][9].

If we're lucky, Greg and Yin here can get over smartasses like me and continue
with their work, and maybe end up writing more bikesheds in the future, backed
by field-forwarding scholarship :D

   [1]: https://yinwang0.wordpress.com/2013/11/09/oop-fp/
   [2]: https://mail.mozilla.org/pipermail/rust-dev/2013-November/006466.html
   [3]: http://www.xojane.com/issues/hipster-sexism-is-not-a-new-concept
   [4]: http://xkcd.com/1289/
   [5]: http://bikeshed.com/
   [6]: http://existentialtype.wordpress.com/
   [7]: http://existentialtype.wordpress.com/2012/08/14/haskell-is-exceptionally-unsafe/
   [8]: http://existentialtype.wordpress.com/2011/05/01/of-course-ml-has-monads/
   [9]: http://existentialtype.wordpress.com/2013/06/20/the-homotopy-type-theory-book-is-out/
