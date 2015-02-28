    Title: _Sup for Android_ - Part 3
    Date: 2014-12-01T23:40:28
   Tags: programming, pablolife

And the final part!! [Part 1][1] covered architecture, and [Part 2][2] covered
libraries.  Let’s finish this pup up!

<!-- more -->

## Testing

I confess we don’t have enough automated testing on our client. The idea is much
like [jwz describes in his Coders At Work interview][3]:

> **Seibel:** In retrospect, do you think you suffered at all because of that?
> Would development have been easier or faster if you guys had been more
> disciplined about testing?
> 
> **Zawinski:** I don’t think so. I think it would have just slowed us down.
> There’s a lot to be said for just getting it right the first time. In the early
> days we were so focused on speed. We had to ship the thing even if it wasn’t
> perfect. We can ship it later and it would be higher quality but someone else
> might have eaten our lunch by then.
> 
> There’s bound to be stuff where this would have gone faster if we’d had unit
> tests or smaller modules or whatever. That all sounds great in principle. Given
> a leisurely development pace, that’s certainly the way to go. But when you’re
> looking at, “We’ve got to go from zero to done in six weeks,” well, I can’t do
> that unless I cut something out. And what I’m going to cut out is the stuff
> that’s not absolutely critical. And unit tests are not critical. If there’s no
> unit test the customer isn’t going to complain about that. That’s an upstream
> issue.
> 
> I hope I don’t sound like I’m saying, “Testing is for chumps.” It’s not.
> It’s a matter of priorities. Are you trying to write good software or are you
> trying to be done by next week? You can’t do both. One of the jokes we made at
> Netscape a lot was, “We’re absolutely 100 percent committed to quality. We’re
> going to ship the highest-quality product we can on March 31st.”

Truth is, I _did_ have to go from 0 to done in 6 weeks for 1.0, then I had to do
it again for 2.0. I got some basics in there, but I would call this the least
battle-tested part of this blog post.

First off, we use [Spoon][4] as our runner. It’s convenient at the very least for
installing the build on a bunch of devices. We use [Espresso][5] to send commands to
the device to run the tests.

The kind of TDD practitioner who [just wants it hooked into their veins][6] (who
will only write code after a failing test, and MUST re-test several times a
commit) will want to check out [Robolectric][7].

### The APK limit: The "Escort Mission" of Android Dev

Designers of strategy or war games almost inevitably, when realizing they can’t
make a single-player campaign entirely of "kill all the bad things" missions,
resort to at least a few escort missions, where they give you a weak AI teammate
that you have to ensure doesn’t die. Everyone hates Escort Missions.

Well, Android has a special development constraint you won’t hit anywhere else:
[you’re limited in the number of methods that are allowed to have defined in your
app][8]. You may, as I did, break the build because you took a block of code and
generalized it into a new method. After that moment, you’ll always hesitate to
include libraries, and when you do, you’ll inevitably worry “God, I hope this
library doesn’t define too many methods.” This is building an app defensively.
This is a development equivalent of the Escort Mission.

There’s not much I can tell you that you probably couldn’t derive on your own.
[This repo][9] was handy in figuring out which libraries bloat. I had to replace
[Joda-Time][10] with the standard [Android Date][11] to buy a few thousand methods.
[Guava][12] had to go. Remember when I said using Dagger would hinder your ability
to use ProGuard? This is an instance where you’ll feel it -- the Guava team
[encourages ProGuard to avoid problems related to its size][13].

Mercifully, Google [listened to the prevailing wisdom][14] and [is splitting up
Play Services on their newer SDKs][15]. Lollipop devices don’t have this limit.
[Jack & Jill][16] probably also help with this. So be confident that in, oh, 3–5ish
years the ecosystem will have permeated these changes, so you no longer have to program
_like a barbarian_ and can use your programming language’s "reusable function"
feature. Until then, decide which library or method you love least, and cull it.

### Resources

When getting to know a new ecosystem, it’s always handy to see who’s in that
space and what they’re saying. I’ve written about almost all the Square
libraries out there, so be sure to give [their blog a follow][17].

[Cyril Mottier][18] comes up in a lot of places, check out his work. I found [this
post on reducing APK size][19], in particular, to be simple, straightforward, and
taught me a lot about the platform I didn’t know.

[Chiu-Ki Chan][20] has some great talks online demystifying and demonstrating
techniques on many Android components, so give her a look.

Lastly, the official Android resources, like the [Android Developers Blog][21]
and the [Android Developers YouTube page][22] will keep you up on what’s fresh.

   [1]: http://morepaul.com/2014/12/tech-of-sup-android.html
   [2]: http://morepaul.com/2014/12/tech-of-sup-android-libraries.html
   [3]: https://gigamonkeys.wordpress.com/2009/10/05/coders-unit-testing/
   [4]: http://square.github.io/spoon/
   [5]: https://code.google.com/p/android-test-kit/wiki/Espresso
   [6]: https://www.youtube.com/watch?v=m4xIy1rlJKs
   [7]: http://robolectric.org/
   [8]: https://medium.com/@rotxed/dex-skys-the-limit-no-65k-methods-is-28e6cb40cf71
   [9]: https://github.com/mihaip/dex-method-counts
   [10]: https://github.com/dlew/joda-time-android
   [11]: http://developer.android.com/reference/java/util/Date.html
   [12]: https://github.com/google/guava
   [13]: https://code.google.com/p/guava-libraries/wiki/UsingProGuardWithGuava
   [14]: http://jakewharton.com/play-services-is-a-monolith/
   [15]: http://android-developers.blogspot.com/2014/11/google-play-services-65.html
   [16]: https://www.saikoa.com/blog/the_upcoming_jack_and_jill_compilers_in_android
   [17]: http://corner.squareup.com/
   [18]: http://cyrilmottier.com/
   [19]: http://cyrilmottier.com/2014/08/26/putting-your-apks-on-diet/
   [20]: http://chiuki.github.io/
   [21]: http://android-developers.blogspot.com/
   [22]: https://www.youtube.com/user/androiddevelopers
