    Title: Hugh Jass Message 🗣
    Date: 2018-04-19T19:53:49
    Tags: engineering, projects, culture, works
    og_image: https://morepablo.com/img/2018/4/hjm_THUMB.png
    og_description: A small project to troll your friends.

<small><em>The song for this post is <a
href="https://www.youtube.com/watch?v=0Oi8jDMvd_w">200%</a>, by Akdong Musician.</em></small>

<iframe width="560" height="315"
src="https://www.youtube-nocookie.com/embed/y3kVTUHRbWM?rel=0" frameborder="0"
allow="autoplay; encrypted-media" allowfullscreen></iframe>

Unbelievably, I followed through on a threat to do a project the other day. I
present to you [hughjassmessage.com][1].

What is it? A clone of [bigassmessage.com][2], correctly dubbed "the most useful
site on the Internet." I use(d) it all the time to to send links [like these][3]
to my friends. It's a bit like [Let Me Google That For You][4] ([example][5]) in
that it's a troll-ish and fun wrapper around messages you might want to
send your friends.

<div class="caption-img-block" style="margin: 25px auto">
<a href="/img/2018/4/hjm.png" target="blank">
<img src="/img/2018/4/hjm_THUMB.png" alt="a Huge Ass Message. Click for full size." style="margin: 15px auto;" />
</a>
</div>

Why clone it? Because I love it, while also having a few critiques:

* It's backend isn't always up. Often (like, as I'm typing this) I'm unable to
  create new Big-Ass Messages.

* Load time: according to its author, people have submitted tens of millions of
  messages! This is cool! But the underlying datastore is taking a bit longer to
  fetch them from the URL hashes, so when you load a message, you're greeted by
  a placeholder "BIG-ASS MESSAGE," which removes the initial shock (and
  therefore, fun!) of sending this to your friends.

* Querystring option: like Let Me Google That For You, I felt like it would be
  handy to generate a link without having to make a call to a specific
  datastore. I might add proper short IDs like BAM does, but right now you can
  call it with either `q=<MESSAGE>` in plaintext, or `r=<MESSAGE>` for
  [rot13.][6]

* Obscured URLs: if you ask someone to click a url called `bigassmessage.com`,
  there's a bit less surprise in what they're getting. So while I have both
  [hughjassmessage.com][1] and [hugeassmessage.com][7], generated URLs point to
  `hjm.wtf`, so your friends won't see it coming until it hits them.

### Behind the scenes

In a case of _massive overkill_, I used [Phoenix][8] for this, and am hosting it
on a [LightSail][9] instance. It doesn't have a datastore yet, but I might put
SQLite behind it and push backups to S3.

It's The World's Simplest App: the [embiggening][13] of the text happens
with client-side JavaScript, so without a datastore, this app is pretty much a
single static file + rot13. So why use Phoenix? A few reasons, but the main one
is that I'd like to commit to finally learning a full-featured framework for
once. My work at companies has put me on microframeworks like [Express][15] and
[Flask][14], which certainly make it easy to host an endpoint, but you _always_
end up writing a ton of middleware (input validation, logging, asset minification,
etc.) and I would love to be surrounded by something with _opinions_, finally.

[Dropwizard][16] was a favorite for a while, but even it makes certain basic
things hard, and I'm not feeling in a Java mood recently.

I find Elixir strange. That will pass, but its syntax is a bit sugary for
my tastes. I'm finding tools like [Distillery][11], [Mix][10], and [Hex][12]
delightful to use.

[Let's Encrypt][18] is _such_ a blessing.

I avoided Docker. It's a small personal project, so it's a ["pets, not
cattle"][19] model: if I lose the instance, I'd have to manually re-install
Elixir, nginx, and the like. You don't need city food inspectors in your
personal kitchen when cooking yourself dinner, and so your stuff probably
doesn't need anything more than a pet server anyway 😛

---

Have fun! And ping me if you run into any bugs! 😄

   [1]: https://hughjassmessage.com
   [2]: https://bigassmessage.com
   [3]: https://hjm.wtf/view?r=lbhe%20enzra%20vfa%27g%20fcvpl%20rabhtu
   [4]: https://lmgtfy.com/
   [5]: http://lmgtfy.com/?q=Big+ass+message
   [6]: https://en.wikipedia.org/wiki/ROT13
   [7]: https://hugeassmessage.com
   [8]: http://phoenixframework.org/
   [9]: https://aws.amazon.com/lightsail/
   [10]: https://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html
   [11]: https://hexdocs.pm/distillery/getting-started.html
   [12]: https://hex.pm/
   [13]: https://en.wikipedia.org/wiki/Lisa_the_Iconoclast#Embiggen_and_cromulent
   [14]: http://flask.pocoo.org/
   [15]: https://expressjs.com/
   [16]: http://www.dropwizard.io
   [18]: https://letsencrypt.org/
   [19]: https://devops.stackexchange.com/questions/653/what-is-the-definition-of-cattle-not-pets
