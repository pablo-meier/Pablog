    Title: 🏄‍♀️ How I Surf the World Wide Web 🕷
    Date: 2019-09-04T14:12:15
    Tags: culture, pablolife, engineering
    og_image: https://morepablo.com/img/2019/9/pi-setup_THUMB.jpg
    og_description: I'm your friend wearing a tinfoil hat re: web browsing.

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=zL2wGYCINwY">Timebomb</a>, by Kylie Minogue.</em> 🎵</small>

I was at a party last Sunday with some great people, and I cynically mentioned
that we're all hacked and the internet is shit (I was thinking about how
[iPhones have been hacked and quietly sending passwords home for years][1],
which is sad because iPhones are the best widely-available consumer-grade
device, all things considered). A bright lawyer friend acknowledged and could
even relate to my cynicism, but implored everyone to do what they can to
maintain their data privacy; and to not stop caring and stop taking precautions.

Then we got to talking about how to mitigate harm, and folks, it was like
asking me [if I've seen a road with so much dust and sand.][2]

We had a great chat and follow-ups were sent; here's an adapted email about my
browsing habits. Also! I still "browse the web." The title of the post is a
throwback to the funny way we talked about being on the Internet when that was
what everyone did, instead of, like, opening the same 3 apps and scrolling. The
web! It used to be a thing!

### Pablo's (adapted) web browsing email to friend

[Pi-hole][3] is software that's meant to run on a [Raspberry Pi][4], a tiny,
very cheap computer (like, $30-$50) that you can then connect to your router to
block all ads on your WiFi. I got it working and joke that our apartment has
"vegan Internet." If you're not someone who builds computers, messes with your
router much, or runs software from the command-line, it's not easy, but it's not
the hardest thing I've done either.

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2019/9/pi-setup_THUMB.jpg" alt="Pablo setting up a Raspberry Pi" style="margin: 15px auto;" />
<p style="font-style: italic; text-align: center; font-size: small">Setting up the Pi in June</p>
</div>

[This tech blogger wrote up a decent article about it][5], though he (and [one of my
favorite articles on advertising on the web][6]) uses a fatphobic frame to talk
about it. If this is interesting to you, let me know! I can totally help you and
[friend] set it up!

I also mentioned Firefox. I specifically use [Firefox Quantum][7], which is a
"release channel" that's like an advanced Beta version. It's got newer features of
Firefox before they go out to general release, which means you get to experience
a lot of cool stuff pretty early (it's also a lot less vetted, so it'll crash
more often than the standard releases, but I haven't experienced it much).

After that, extensions! I install [HTTPS Everywhere][8], since there's no great
reason to use vanilla HTTP (the 'S' stands for Security!). I also use
[uBlock Origin][9] to block ads and trackers for other WiFi, and [Privacy Badger,][10]
which works a little differently and can catches a few things uBlock doesn't.

_Last_ thing I do: In Firefox, I use [Multi-Account containers][11], which is a fancy
way of saying "Internet condom." It basically means all my Google tabs only know
about each other, and all my Social tabs (Twitter) only know about each other,
and all my Banking/Finance tabs only know about each other, etc… The way a lot
of these sites work is to track all your activity across sites, so Facebook sees
what you were browsing on Amazon, and when you visit a news site, it displays an
ad based on what those two tell the news site about you, etc. This way, Amazon
only knows my Amazon habits, Google doesn't know about my Seamless account, etc.
This isn't a foolproof way to eliminate tracking, but it goes most of the way
there.

Lastly lastly, I'm looking into joining the [NYC Mesh][12] network, a volunteer effort
of a bunch of nerds, which would mean we could host our own servers, and we
could get/serve Internet from someone who isn't Comcast or Verizon.

Apart from getting tracked on ads, there's also password security. You can enter
your email address at [haveibeenpwned.com][13] to see which companies you have
accounts with that have been breached. I've been in 12!

These things happen all the time (hey, did you use [Slack in 2015?][18]), and when
it happens, a common attack is to use the password from the breach on other
sites, since most people re-use the same password. So one of my breaches is
[XSplit][14], an account I made in 2011 when I wanted to steam StarCraft, and if
I was using the same password for Facebook or my bank, in theory someone who
bought the passwords off the black market could do me real harm.

These days, every site I'm on has its own custom password that looks like
`&DcEoEX1d^#5gzxm` or `mA^c**HF7cESgj!d`. I store my passwords in
[LastPass][15], and when a new site asks for a login, I use their [password
generator][16] to make a new hard-to-guess one. [1Password][17] is another great
offering. It's an extra step when signing up, and an extra step when logging in
(I have to copy + paste whatever that site's password is), but again, it keeps
me safe from the worst of it.

(also, do you know how many sites need a password? LastPass is storing 154
credentials for me!)

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2019/9/fingerprinting.png" alt="A report stating my browser is unique in fingerprinting" style="margin: 15px auto;" />
<p style="font-style: italic; text-align: center; font-size: small">I am easily fingerprinted, however.</p>
</div>

This is all overkill for most people, and I invite anyone in the comments to
tell me what I might be missing. This also, paradoxically, makes me pretty
susceptible to [browser fingerprinting][19], since my habits are far from the
norm.

If you're feeling like having some fun, I invite you to try [Track THIS!][20],
which does something of the opposite: it'll open 100 or so tabs _without_
tracking to throw ad collectors off your scent, and make them think you're one
of a few stock characters.

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2019/9/track-this_THUMB.png" alt="Track THIS front page." style="margin: 15px auto;" />
</div>

If I were _really_ into this, I might try browsing through TOR or setting up my
own VPN and browsing through that, but there are new risks those expose that I
can't say I care enough about to mitigate either.

   [1]: https://www.technologyreview.com/s/614243/websites-have-been-quietly-hacking-iphones-for-years-says-google/
   [2]: https://www.youtube.com/watch?v=mNj6spCtUE0
   [3]: https://pi-hole.net/
   [4]: https://www.raspberrypi.org/
   [5]: https://blog.codinghorror.com/an-exercise-program-for-the-fat-web/
   [6]: https://idlewords.com/talks/website_obesity.htm
   [7]: https://www.mozilla.org/en-US/firefox/developer/
   [8]: https://www.eff.org/https-everywhere
   [9]: https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/
   [10]: https://addons.mozilla.org/en-US/firefox/addon/privacy-badger17/
   [11]: https://support.mozilla.org/en-US/kb/containers
   [12]: https://www.nycmesh.net/
   [13]: https://haveibeenpwned.com/
   [14]: https://www.xsplit.com/
   [15]: https://www.lastpass.com/
   [16]: https://www.lastpass.com/password-generator
   [17]: https://1password.com/
   [18]: https://techcrunch.com/2019/07/18/slack-password-breach/
   [19]: https://pixelprivacy.com/resources/browser-fingerprinting/
   [20]: https://trackthis.link/
