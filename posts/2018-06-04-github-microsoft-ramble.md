    Title: GitHub + Microsoft ramble 😼
    Date: 2018-06-04T20:17:49
    Tags: engineering
    og_image: https://morepablo.com/img/2018/6/microsoftgithublove_THUMB.jpg
    og_description: Some rambles about the recent acquisition news.

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2018/6/microsoftgithublove_THUMB.jpg" alt="Microsoft and GitHub, together!" style="margin: 15px auto;" />
</div>

<small><em>🎵 The song for this post is <a href="https://www.youtube.com/watch?v=lnGnJWKyBak">Still More Fighting</a>, by Nobuo Uematsu, for Final Fantasy VII. 🎵</em></small>

So, [Microsoft is acquiring GitHub!][1]

### Acquisition was inevitable

GitHub raised [$350m][2] of that explosive-growth VC
money. When a bank gives you a business loan, they expect it back + interest
over time. But Venture Capital wants **giant** wins, and they want them
soon. Unless you failed to notice that GitHub plays the Hot Tech Company
playbook (become a market leader and make unit economics work later, use VC
money on ergonomic chairs + stickers as if you were already hugely profitable),
this shouldn't surprise you. You either get acquired by a titan, or you IPO, but
that second path requires transparency about your financials and even with the
[pricing changes two years ago][3] I really doubt it would have been the right
play. Besides, with [Blue Apron's disaster IPO][25] and [Snap's volatile IPO][26]
fresh in people's memories, it's pretty unlikely GitHub would have. [It's not
the popular move][27].

So! The game becomes less "oh no they got acquired! 😱" and more "given that
they had to get acquired by a tech titan, what does it mean that it was
Microsoft?"

### I'm pretty glad it was Microsoft

Microsoft has committed many evils, but I've liked a number of strategic
decisions they've made in the last few years. [VS Code][13] succeeded at what
Adobe initially tried to do with [Brackets][12] and a similar thing to what
GitHub tried with [Atom][14]: releasing a cross-platform world-class text editor
that's hackable with web technologies. It's [dead-easy to get Ubuntu on your
Windows 10 box.][28] For a while they were [in the "top contributor" category of
Linux contributors.][15].

Even in the Terrible Days, Microsoft has cared about longevity,
archivability, and backwards compatibility more than any other company I can
think of. Software you wrote for Windows 95 still runs on Windows 10. You can
upgrade [from the original Windows all the way up][17]. Compare this to Facebook
capriciously shipping breaking changes to their API in its first few years (Ian
Bogost wrote [one of my favorite articles][16]), or Instagram and Twitter
neutering their APIs, or Apple [deprecating OpenGL and letting their proprietary
method be the only way to draw a triangle on a Mac][18]. Google killed Google
Code, Google Reader, Google Wave, Google Buzz, about 200 messaging apps,
recently [almost killing a ton of games on the Internet.][24] Microsoft is
widely viewed as mismanaging Skype post-acquisition, but it still _runs_, and I
still use it regularly without too much issue.

All this to say, in a world where Facebook sucks so much at privacy (hey, [new
story today][21]), Apple continues to close every door they can, Amazon
accumulates $100b of wealth for their CEO while [their fulfillment center
employees pee in bottles][19] and [makes their white-collar workers cry at their
desks][20], and Google creates a culture of the Damore memo while fumbling
around uselessly… there are issues with Microsoft, but I'll take them over the
others.

I also like that this may help/enable Azure, so we can have more competitors in
the cloud computing space. AWS won't "lose" anytime soon, but I like having more
options + competitors.

Lastly, Microsoft has historically developed many of the best and most powerful
programming tools on the planet. Visual Studio is a joy; with
this corpus of data I have a lot of confidence they can build some amazing
tools.

### I don't love GitHub

Many are afraid this will make them change, and I truly
hope they do. Their product decisions are a big part of why maintainers burn
out. One person getting much richer in this deal than most of the people who've
toiled at GitHub for years is a toxic co-founder [who's heinously mismanaged
a personnel situation.][22] The company also [mismanaged an employee who's worked
very hard to make open source more humane.][23] GitHub is where much of the
shitty "Meritocracy" culture comes from.

(it's complicated. I know a lot of good people there too)

I have faith that [appointing a new CEO][6] can help with some of these
things. I beat this drum regularly: the leadership of most VC-backed
startups possess the properties required to want to start a company, and the
properties to acquire VC (mostly being White and Male, being charming, having
good networks), but they're not necessarily great at running companies.
Microsoft might put an adult in charge now.

GitHub's product choices also alter the way we use the tech. A benign but simple
example that I love is ["Merge Pull Request" considered harmful][5], which shows
another collaboration flow around Git. The reason "PR" is more-or-less synonymous
with what used to be called "patch" or "changelist" is because of GitHub.
There's also the myriad of takes about how we made source control distributed,
only to centralize it all in one place.

### Most things won't change

_Eventually_, we might start to see Azure integrations with GitHub. I think this
will be exciting and I look forward to that later. Some folks are migrating, just
like the Facebook deactivators in light of the last year, and like those
migrations, it won't change much. In the short term, both sides will be focused
on a making sure the transplant is accepted by the host.

### So you're happy?

I'm never happy!

I joked with this initial impression:

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">tired:
migrate your repos to GitLab!<br>wired: switch to Mercurial, re-ignite the
2008-era DVCS war, host on Bitbucket<br>inspired: host your own code server
😎<br><br>inspired (alt): do it all in Fossil</p>&mdash; 💣 b∀BГO 💣 (@SrPablo)
<a href="https://twitter.com/SrPablo/status/1003429168468692992?ref_src=twsrc%5Etfw">June 4, 2018</a></blockquote>

Most of the angst I observe is people using this event to confront realities
they didn't confront at the same time before:

* Wow, GitHub consolidated a lot of power
* Wow, these companies are in this to make money.

I wish we did more to diversify our story around version control
and code hosting. I don't think GitHub solved a very wide spectrum of problems;
most of us shrank our solutions to fit in the GitHub-shaped hole.
I suggest you take this as an opportunity to play around with something else.

If you want to keep using Git, but want a different hosting provider:

* [Bitbucket][11] has been around for years, supports Git _and_ Mercurial, and
  provides largely the same functionality. It's owned by Atlassian, and plays
  well with JIRA and Trello if that matters to you.

* [GitLab][10] is where everyone seems to be going. 

If you want to host your own:

* You can host your own GitLab instance, since it's open source. Alternatively,
  [gitea.][4]

* You can try [Fossil][8] lol.

* Host [your own git server!][9]

* If you can stomach a PHP + MySQL installation, you can host an instance of
  [Phabricator][7].

If you want to try a new DVCS:

* Fossil, as above

* Give Mercurial another shot, it's really pretty pleasant.

The web is supposed to be distributed. While I think we need
systems-level changes to incentives and legal frameworks to truly enact change,
it doesn't hurt to also, in our small way, remove power from these centralized
platforms. I might take this opportunity to throw up some repos on one of my
instances 😛

   [1]: https://www.theverge.com/2018/6/4/17422788/microsoft-github-acquisition-official-deal
   [2]: https://www.crunchbase.com/organization/github#section-locked-charts
   [3]: https://thenextweb.com/dd/2016/05/11/github-new-pricing/
   [4]: https://gitea.io/en-US/
   [5]: https://www.spreedly.com/2014/06/24/merge-pull-request-considered-harmful/
   [6]: https://natfriedman.github.io/hello/
   [7]: https://www.phacility.com/phabricator/
   [8]: https://fossil-scm.org/index.html/doc/trunk/www/index.wiki
   [9]: https://git-scm.com/book/en/v1/Git-on-the-Server
   [10]: https://about.gitlab.com/
   [11]: https://bitbucket.org/
   [12]: http://brackets.io/
   [13]: https://code.visualstudio.com/
   [14]: https://atom.io/
   [15]: https://www.zdnet.com/article/whos-building-linux-in-2017/
   [16]: http://bogost.com/writing/blog/oauth_of_fealty/
   [17]: https://news.avclub.com/watch-a-man-install-every-major-windows-upgrade-from-th-1798259214
   [18]: https://developer.apple.com/macos/whats-new/#deprecationofopenglandopencl
   [19]: https://www.theverge.com/2018/4/16/17243026/amazon-warehouse-jobs-worker-conditions-bathroom-breaks
   [20]: https://www.nytimes.com/2015/08/16/technology/inside-amazon-wrestling-big-ideas-in-a-bruising-workplace.html
   [21]: https://www.nytimes.com/interactive/2018/06/03/technology/facebook-device-partners-users-friends-data.html
   [22]: http://valleywag.gawker.com/meet-the-married-duo-behind-techs-biggest-new-harassme-1545685104
   [23]: https://where.coraline.codes/blog/my-year-at-github/
   [24]: https://www.theverge.com/2018/5/15/17358752/google-chrome-66-web-audio-api-sound-broken-game-change-delay-apology
   [25]: https://www.cnbc.com/2017/08/23/inside-blue-aprons-ipo-communication-lapse-chased-away-investors.html
   [26]: https://qz.com/1201682/snap-stock-closed-above-its-ipo-price-for-the-first-time-since-june/
   [27]: https://www.vox.com/2014/9/11/6134529/a-new-york-stock-exchange-exec-explains-why-ipos-are-becoming-less
   [28]: https://docs.microsoft.com/en-us/windows/wsl/install-win10
