    Title: _Sup for Android_ Part 2: Electric Boogaloo
    Date: 2014-12-01T23:38:28
    Tags: engineering, pablolife

Welcome back! [Part 1][1] covered architecture, and [Part 3][3] covers testing and
miscellany. Here we’ll talk about --

<!-- more -->

<h2 id="libraries-the-cause-of-and-solution-to-all-of-androids-problems">Libraries: “the cause of, and solution to, all of Android’s Problems.”</h2>

The first version of Sup was written in about 4 weeks. Being a developer with
little Android experience, I was able to produce this quickly in large part due
to extensive, wonderful libraries. The quote in the title illustrates how these
libraries are both extremely helpful, and also serve to remind you that all
software is broken, and we’re trying to get to the moon by stacking chairs.

The following are some libraries every Android developer should at least know
about, whether or not I used it, and why.

<h3 id="dagger">Dagger</h3>

I’ll start with the most bittersweet: [Dagger][4] is a dependency-injection framework
for Java. The other notable player in this space is [Guice][5]. Dagger builds on the
ideas of Guice but is better-suited for mobile by both doing more work statically,
and having the programmer specify some relationships more explicitly.

Many programmers don’t know what DI is or why it’s useful, so I’ll point you to
[Guice’s Motivation Page][6], which explains the utility behind DI pretty well.

To be clear, _I love Dagger_. I’m using it in this project because I
wholeheartedly believe it provides a major net savings. But like any major
abstraction in software, there’s an investment to learning and understanding it
before you can cash in on that benefit. For many engineers, the cost of
investment feels too high for what we think we’ll get out, so we don’t bother to
invest in the first place (recall the [Blub Paradox][7]).

It can be a challenge to determine when an abstraction or tool is really worth
it. Remember that _even using version control at all_ was an item on The [Joel Test][8]
because there was a time that many vendors thought it wasn’t worth the trouble
of learning it, setting it up, and using it consistently.

There is a learning curve to Dagger, and while the homepage is full of simple,
sweet examples, there _will_ be times you will want to do something seemingly
simple and Dagger won’t let you. You’ll read the options to the `@Module`
annotation several times to get it working, and even after it is working, you
may not exactly know why.

I feel pretty confident now in my knowledge of how it works, but it wasn’t easy,
and when I had another team member join me for part of 2.0, this was a pain
point for them. Fair warning!

That said:

* All object initialization and dependency satisfaction is easy as cake.
* Singletons and their distribution/management, especially, are an absolute
  breeze.
* I love the amount of control I get over different flavors of builds.

If you’d like a good example for how to use Dagger (and a myriad of other
libraries) in a Gradle project with different configurations for other build
flavors, do take a look at [u2020][9].

All that said, Dagger relies heavily on Annotations and code generation. This
has repercussions for your project:

* ProGuard is [very][10] [difficult][15] for Dagger 1.x (the current version). If you use
  Dagger (at least until 2.0), you’re opting not to use ProGuard.
* [Kotlin][11] also becomes a no-go, [or at least very hard][12], for the same
  reason. If you want to try the [new hotness][13] that is Kotlin (the
  [Swift of Android][14]!) this won’t play nicely immediately.

So, think carefully when deciding to use Dagger.

<h3 id="picasso-butterknife">Picasso, ButterKnife</h3>

After the hoo-haa of Dagger, here are two unambiguously good additions to your
project. There is absolutely no reason to use anything other than [Picasso][16]
for loading network images into your ImageViews. The [Transformation interface][17]
made the circle crop in Sup profiles an afterthought, caching makes sure images Just
Work when offline, and it handles all its network requests in a separate thread.
Just use it.

[ButterKnife][18] similarly exists only to make your code more readable and save
you a ton of typing. If you’re working with classes that have a dozen or so views
that need configuring, `ButterKnife.inject(this)` is all you need to wire up your
classes.

<h3 id="otto">Otto</h3>

We use [Otto][19] for our Event Bus. Guava has one, but as Otto’s homepage points out,
it’s not especially suited for mobile. I trusted it because Square Open Source,
but in retrospect I think I should have investigated its competitors more.

Otto is great, here are some gotchas:

* Per Dagger, it relies on annotations, so the same repercussions apply.
* **Unregister your objects.** Registering an object like a Service, Activity, or
  Fragment is an easy way for it to be retained when it’s not needed, since the
  Otto bus will retain a reference to it. Beware the memory leak.
* They explain this on the splash page but it’s easy to get bitten: events will
  not look for Subscription handler code up an inheritance chain, vtable-style.
  If you have an abstract class and want all its children to receive and handle
  events a certain way, you can’t just register the object and put the `@Subscribe`
  methods in the superclass. It violates DRY, but you’ll need it both places.

<h3 id="retrofit-okhttp">Retrofit, OkHttp</h3>

Use these for your network requests. [Volley][20] over [Retrofit][21] is worthy
of consideration, but there seems to be [no major benefit][22] and I prefer the
interfaces of Retrofit.

The only caveat I’d mention for Retrofit is that it may take some tweaking if
the service you’re querying has made certain design decisions on its data, as
Sup did. Retrofit is great if the data being returned to you follows a proper,
consistent resource model — almost all of their examples use return objects like
`List<User>` on a `GET /users` call, `Project` for `GET /project/{projectId}`, etc.

Sup’s server was originally designed to accomodate the iOS client, which
represented the JSON object returned by the server as a queryable dictionary. So
`POST /sups` returned a JSON dictionary with certain naked values the client may
have wanted, but `GET /sups/statuses` returned another dictionary of its _own_
naked values. While they’re both on `/sups`, it’s not a clean interface, and required
the Java client to define a fair number of 'shell classes' -- POJOs who’s only
purpose is to hold the precise, naked values of each and every call. We have
something like 40 of them.

The other caveat would be if your response objects use their data to describe
themselves. Sit tight, because this one’s a doozy:

Given that

* **SPEED IS EVERYTHING** in startups **SHIP SHIP SHIP.**
* The App Store can take one or two weeks to approve updates.
* Any update will require users to install the update.
* We didn’t have product/market fit and wanted to experiment -- would users Sup
  places? Suggested Users for people with no contacts? What if we wanted to show
  people who had them in their contacts?

The solution was to let the the JSON object returned by the server describe its
own contents, and program the client to parse the response object and render it
according to its own spec. So something like:

```
{
  sections : [
    {
      name : "contacts",
      title : "Contacts",
      type : "suppable cell"
    },
    {
      name : "suggested",
      title : "Suggested Users",
      type : "suppable cell"
    },
    {
      name : "places",
      title : "Places",
      type : "nonsuppable"
    }
  ],
  contacts : [ /* list of contacts */ ],
  suggested : [ /* list of suggested */ ],
  places : [ /* list of places */ ]
}
```

This is great for the bullet points above! This is terrible if your library
counts on the response being represented by a POJO and not a dictionary!

For that case I ended up just getting the response data raw and using a JSON
parser on it. Not the end of the world, but gross. Be aware!

[OkHttp][23] is a lot more simple. I use it for non-API network operations like
uploading to S3. They have [a great recipes page][24] that engineer Jesse Wilson
said they were quite proud of in [his OkHttp talk][25], and I would say rightfully
so.

<h3 id="realm">Realm</h3>

A new one! If you’re an Android vet, you may have been nodding along at the
mentions of these previous libraries, but Realm for Android has just shipped two
months ago!

[Realm][26] for iOS has existed for a while, and it was something our iOS engineers
were discussing as a solution to data persistence (apparently CoreData is
terrible). Android [isn’t much better][27]: you’ve got Preferences, raw files
that you write yourself on Internal or External storage, or raw SQLite.

Sup 1.0 had a pretty simple, but laborious and fraught scheme: all individual
data that required persistence (particular strings, booleans, etc.) were stored
in SharedPreferences, and any data of which there can be many elements (items on
the Contacts Screen, pending Sups) were stored in SQLite tables. Migrations were
a pain. There was lots of data conversion, especially since SQLite doesn’t have
a great representation for Dates.

[Realm’s docs][28] (correctly) make it seem pretty easy to operate. And it is!
Go use it!

Some impressions, however:

* Realm ships with a fair bit of native code, and will add a few megabytes to
  your application. I hit a [delightfully gross bug][29] because one of our other
  dependencies shipped armeabi native libraries, but failed after including Realm.
  <br /><br />The issue was that because Realm ships with `armeabi` _and_ `armeabi-v7a`
  directories, armeabi-v7a devices saw the presence of a more specific directory,
  looked there for all their native dependencies, and failed to find the first
  library.
* This also means you need to strip the Realm JAR of architectures you
  don’t want to support, like x86 or MIPS.
* Realm is very new, so unlike a lot of these other libraries or Android itself,
  you won’t find many Stack Overflow questions on it, or blog posts. Use the
  [mailing list][30]! They are very friendly!

Lastly, and this is a harder point to articulate -- Realm, like any other
abstraction, especially a recently released one -- can and will fail in
mysterious ways. Its performance is achieved with the help of native libraries,
but this means when things go wrong, it won’t always be immediately clear why as
the crash can happen at the native level. Looking at my Play Store stats, I’ve
got a few (not many!) Realm-related crashes that I need a bit of time to pore
over, and don’t know how to reproduce.

Furthermore, Realm objects achieve much of their ease and performance with a few
tricks that may come out to bite you. For example, your data is represented as a
Java Object you define, but if you pass that object to another thread (say, the
callback to a network request) and attempt to access its fields without the
proper ceremony, Realm will crash.

Per the other tools, I’m happily using it because I wholeheartedly believe that
it has saved me time and effort. Just understand that there’s some unexplored
territory here, and while SQLite is laborious and gross, it’s generally easier
to understand its use and failures.

<h3 id="lesserknowns-phrase-timber-pidcat-hugo-nineoldandroids-and-actionbarsherlock">Lesser-knowns: Phrase, Timber, pidcat, Hugo, NineOldAndroids, and ActionBarSherlock?</h3>

These I’ll just sprint through.

**[Phrase][31]** does one small thing, and does it well. It’s explained [here][32]. I
prefer it to `String.format` for user-facing Strings but it’s hardly world-changing.

**[Timber][33]** is great, if only because you no longer have to add `public static final
String TAG = "ClassName";` to every class and subsequently use it in every logging
call. That you can ‘plant’ different trees based on your build type is icing on
the cake.

**[pidcat][34]** is my preferred logging view. Just have a full-screen tmux pane with your
logs, beats having to resize your IDE window.

**[Hugo][35]**: frankly I discovered it late and never used it much, but looks delightful.

**[NineOldAndroids][36]** is less and less important now that 4.x phones are gaining
more users. That said, the [Android Dashboards][37] still place about 10% of users on API
10, and NineOldAndroids is handy for the very least for back-implementing
`View.getX` and `View.getY`, inexplicably missing from API 10. Being able to use
ObjectAnimators without fear is an added bonus.

Finally, [ActionBarSherlock][38]. We used to use it, but now with the [Toolbar][39]
being the recommended approach I think you should probably just use AppCompat (we
switched).

   [1]: /2014/12/tech-of-sup-android.html
   [3]: /2014/12/tech-of-sup-android-misc.html
   [4]: http://square.github.io/dagger/
   [5]: https://github.com/google/guice
   [6]: https://github.com/google/guice/wiki/Motivation
   [7]: http://c2.com/cgi/wiki?BlubParadox
   [8]: http://www.joelonsoftware.com/articles/fog0000000043.html
   [9]: https://github.com/JakeWharton/u2020
   [10]: https://plus.google.com/+DonnFelker/posts/fhFucCgy8gr
   [11]: http://stackoverflow.com/a/23959489
   [12]: http://kotlinlang.org/
   [13]: https://youtrack.jetbrains.com/issue/KT-5714
   [14]: https://www.youtube.com/watch?v=ha-uagjJQ9k
   [15]: http://blog.gouline.net/2014/08/31/kotlin-the-swift-of-android/
   [16]: http://square.github.io/picasso/
   [17]: http://square.github.io/picasso/javadoc/com/squareup/picasso/Transformation.html
   [18]: http://jakewharton.github.io/butterknife/
   [19]: http://square.github.io/otto/
   [20]: http://developer.android.com/training/volley/index.html
   [21]: http://square.github.io/retrofit/
   [22]: http://instructure.github.io/blog/2013/12/09/volley-vs-retrofit/
   [23]: http://square.github.io/okhttp/
   [24]: https://github.com/square/okhttp/wiki/Recipes
   [25]: https://www.youtube.com/watch?v=tfD2uYjzXFo
   [26]: http://realm.io/
   [27]: http://developer.android.com/guide/topics/data/data-storage.html
   [28]: http://realm.io/docs/java/0.74.0/
   [29]: https://groups.google.com/forum/#!topic/realm-java/8qOKNdQUavM
   [30]: https://groups.google.com/forum/#!forum/realm-java
   [31]: https://github.com/square/phrase
   [32]: http://corner.squareup.com/2014/01/phrase.html
   [33]: https://github.com/JakeWharton/timber
   [34]: https://github.com/JakeWharton/pidcat
   [35]: https://github.com/JakeWharton/hugo
   [36]: http://nineoldandroids.com/
   [37]: https://developer.android.com/about/dashboards/index.html
   [38]: http://actionbarsherlock.com/
   [39]: http://developer.android.com/reference/android/widget/Toolbar.html
