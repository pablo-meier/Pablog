    Title: Tech overview for _Sup for Android_ - Part 1
    Date: 2014-12-01T23:37:28
    Tags: engineering, pablolife

I’m one of a small team of engineers for [Sup][1], now on the [Play Store][2]
and [App Store][3]. Download it! Use it! Every day! Make our founders and their
investors happy. The more people are happy, the more likely it is I continue to
get paid. I don’t need the money, but the people I owe do.

I wrote the first iteration of the server, but since the beginning of August
I’ve worked almost exclusively on our Android client. While I did some very
basic Android work in college 4 years ago (cringingly documented in part
[here][4]) I consider this project, effectively, my first real exposure to
Android.

Here’s a little overview of the tech behind the product: some architecture
decisions, techniques and libraries that facilitated code re-use, a few gotchas,
and resources if you ever want to delve into more Android work. This post is
primarily about Architecture; Part 2, on Libraries, is [here][5]. Part 3 on other
miscellany is [here.][6]

<!-- more -->

<h2 id="architecture">Architecture</h2>

<h3 id="few-activities-many-fragments-or-viewgroups">Few Activities, many Fragments (or ViewGroups)</h3>

[Activities][7], [Intents][8], [Fragments][9], and [Contexts][10] are, like
politics, [weird... and creepy][11]. Similar to gall bladders, they either
directly are or have many elements of evolutionary residue of the framework and
therefore have odd relationships to each other. These classes remind you that
[Android has been a lot of places in its history.][12] There’s a reason
[this xkcd][13] refers to the badly-designed route as "the Android Route."

Considering how to best structure your app in this environment can be
challenging; what I’ve more or less settled on is the approach in the title:
consolidate Activities when possible, and delegate most screen-specific work to
Fragments.

Let me be absolutely clear on something: [Fragments are garbage.][14] Fragments
are the relief from the thumbscrews. To say they’re "not an elegant solution" is
to imply they’re a solution at all: fragments will frequently deceive, lie, and
disappoint you. Fragments are the little death, the mind-killer.

That said, I’m using them everywhere.

Being a seed round startup, it was more important to _get the product out_ rather
than _fully understand every facet of every component we’re working with_, so when
our app went on to have more than 3 screens, I picked Fragments because it was
the least bad of my choices given that I had to ship yesterday. I knew they were
initially designed to "be like" Activities, so I could carry over that
knowledge, and worst comes to worst, they’ve been around for a few years so I
was confident StackOverflow would carry palliatives for headaches.

Per the Square article linked above, the most appealing solution that I would
love to explore would be to simply use POJO’s around ViewGroups, and handling
transitions between screens in the app in a simpler way than Fragments. This
looks to be the rationale behind [Flow][15], though I hesitate to recommend it
as it’s not hit 1.0 yet, it looks to be optimized for use with [Mortar][16]
(which I have less charitable opinions of), and Saint Jake [seems to be][17]
[holding off on][18] endorsing it.

<h3 id="what-benefits-has-this-approach-given">What benefits has this approach given?</h3>

The biggest benefit is that you can seperate app-wide logic from screen-specific
logic. As an example, consider Profile Cards in Sup:

<div style="margin: 20px auto; width: 650px;">
  <a href="/img/2014/12/sup-screenshot-1.png">
    <img style="width: 200px; display: inline" src="/img/2014/12/sup-screenshot-1.png" alt="Profile Card in Feed" />
  </a>
  <a href="/img/2014/12/sup-screenshot-2.png">
    <img style="width: 200px; display: inline" src="/img/2014/12/sup-screenshot-2.png" alt="Profile Card in Likes" />
  </a>
  <a href="/img/2014/12/sup-screenshot-3.png">
    <img style="width: 200px; display: inline" src="/img/2014/12/sup-screenshot-3.png" alt="Profile Card in Following" />
  </a>
</div>

There are many points in the app (the Feed, the Likes screen, and the Following
Screen, above) where we wanted a user to tap another user’s name or photo and be
presented with options to follow or Sup that user.

With each of those screens as Fragments, it’s pretty simple for any of those
fragments to call something like `activity.openProfileCard()`. The code to present
the card (which is, itself, a fragment) is in one place, no matter which screen
the user is looking at.

In an app using multiple activities, this consolidation can become hairier. You
can create an Activity superclass that presents the card, and have all your
activities subclass it? Alternatively, anywhere you can abuse inheritance, you
should consider a composition solution, so you could have an object containing a
method that can take an activity and use it as a context upon which to present a
profile fragment.

This is probably the best solution, frankly, since it makes testing easier by
decoupling an activity from it’s ability to present a card. That said, the
single-activity consolidation was helpful in our fast dev cycle like [painting
with a palette knife over a brush for speed.][19] This also made holding on to
other logic (such as the network calls to Sup or follow a user) localized with
the Context those calls will need. You trade in some "God Object"-ness of your
central Activity but in return get a pretty simple model for Things That Happen
Anywhere In The App that is distinct from Things That Happen On This Screen
(this is how we can Sup users from most screens, and receive invites from them
too).

<h3 id="dag-your-apps-data-flow">DAG your app’s data flow</h3>

_Try to ensure that everything flows in one direction, and relies on as few other
components as possible._ This seems obvious is retrospect and almost silly on
paper to spell out, but it can be a bear to manage when you’re trying to throw
an app together from scratch. Recall the chaos upon which your stateful app must
remain consistent: the app has many screens, each will need to save and/or
retrieve persistent data; the app as a whole will need to sync up with a server
and handle the subsequent response asynchronously; at any point the user can
change screens and minimize your app; at any point in which you may receive a
notification which prompts a response or alters data being viewed.

In Android especially, where most meaningful operations require a `Context`, it’s
very tempting to put Important Code in your Activities or Fragments. _Resist!
Limit the contamination!_ Let your Activities and Fragments handle any complex
View mungling, but avoid letting them fetch data that would alter the model.

A very high level view of what Sup does is here (solid lines are method calls,
dotted lines are events):

<a href="/img/2014/12/sup-dataflow.png"><img src="/img/2014/12/sup-dataflow.png" alt="Dataflow Visualization of Sup" style="margin 15px auto; width: 600px;" /></a>

This splits up the work into discrete blocks that don’t pollute one another:

* Notification handling doesn’t require much code or special logic of its own:
  simply delegate the work to the server call.
* Once we get updated data from the server, update the model.
* Notify anyone who cares via an event bus that the model has been updated, let
  them re-render appropriately.

   [1]: http://www.supme.com/
   [2]: https://play.google.com/store/apps/details?id=com.looksee.sup&hl=en
   [3]: https://itunes.apple.com/us/app/sup-live-video-from-friends/id887742297
   [4]: http://brownandroidattack.blogspot.com/
   [5]: /2014/12/tech-of-sup-android-libraries.html
   [6]: /2014/12/tech-of-sup-android-misc.html
   [7]: http://developer.android.com/reference/android/app/Activity.html
   [8]: http://developer.android.com/reference/android/content/Intent.html
   [9]: http://developer.android.com/guide/components/fragments.html
   [10]: http://developer.android.com/reference/android/content/Context.html%5C
   [11]: https://www.youtube.com/watch?v=4FHd5JDhu5A
   [12]: http://arstechnica.com/gadgets/2014/06/building-android-a-40000-word-history-of-googles-mobile-os/
   [13]: http://xkcd.com/844/
   [14]: http://corner.squareup.com/2014/10/advocating-against-android-fragments.html
   [15]: https://github.com/square/flow/
   [16]: https://github.com/square/mortar
   [17]: http://www.reddit.com/r/androiddev/comments/1w63ro/simpler_android_apps_with_flow_and_mortar_eschews/cezmahw
   [18]: https://twitter.com/jakewharton/status/442907679854317568
   [19]: https://www.youtube.com/watch?v=FNVF2rBo6y0

