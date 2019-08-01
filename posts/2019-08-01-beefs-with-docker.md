    Title: 🐄 Beefs with Docker 🐳
    Date: 2019-08-01T03:58:58
    Tags: engineering
    og_image: https://morepablo.com/img/2019/8/containers_THUMB.png
    og_description: I have beefs with Docker.

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=fUPSz1SOrtM">Aguzate</a>, by Richie Ray and Bobby Cruz.</em> 🎵</small>

I've got some beefs with Docker!

## Containers, but actually VMs

Let's start with a silly point: if you're developing your software on a Mac,
_you're incurring the costs of virtual machines, **not** exclusively containers._

Let's start with what containers _are_: unlike VMs, they have direct access to
syscalls and don't need to virtualize them, saving you a ton of overhead that
makes VMs hard to provision, boot, load, and sluggish to run. This comparison
diagram from _Using Docker: Developing and Deploying Software with Containers_
shows you the difference:

<div class="caption-img-block-2" style="margin: 25px auto">
<img src="/img/2019/8/vms_THUMB.png" alt="VMs have a hypervisor and must contain a guest OS." style="margin: 15px auto;" />
<img src="/img/2019/8/containers_THUMB.png" alt="Containers share the host OS." style="margin: 15px auto;" />
</div>

So you can imagine how great it is to use these instead of VMs.

But if you've worked at companies like I have, all our development is done on
overpriced Mac laptops. And can a Linux container speak _directly_ to a
non-Linux OS as if they were the same kernel? Of course not, so how does Docker
for Mac fix this? By running the Linux kernel _in a Linux VM._

So! There are many technical cool things about containers, many around how much
better they are in utilization than a VM. But if you're on a Mac, you're
actually just on a VM lol. Which is why your laptop heats up when you want to
run `pytest`.

If you and/or your company develop entirely on Linux boxes, I can see how
containers make a compelling story. But if you're not, don't let the buzzword
trick your brain that it's doing something it isn't. Don't ask yourself "what
are the costs of moving all our development into containers?" ask instead "what
are the costs of moving all our development into containers in VMs?"

As you consider that, consider…

## Yet Another Networking Stack

Learning the funny rules of networking, config, and how to get components to
talk to each other is hard enough already, but now on top of hostnames and
ports, you need to learn all the `docker` commands and the rules on naming
between containers. You'll have to shell into them and run diagnostics. You'll
want to know all about `/etc/hosts` and how Docker manipulates them.

Config files? Make sure you're looking at the right filesystem. Environment
variables? Did you build the image with an `ARG` _then_ set it with `ENV`? Were
the secrets available at build time? With all this surface, are you leaking
sensitive information anywhere?

This isn't to say these problems are easy outside of Docker, just that adding
this much surface and multiple copies of every abstraction you're already using
(networks, file systems, environments) doesn't simplify it.

### Stateful but not

When you make a change you'd like to keep inside a Docker container, do you know
the commands on-hand to persist them? To push them back to the image definition?
To the registry? Does your org have and pay for a gated-off image
registry? Are all these components observable so you can catch when something
gets misconfigured?

Do you know off-hand how to rebuild from specific layers of a `Dockerfile`? Do
you remember which commands, off-hand, will be read as state-changing and
trigger a layer rebuild vs. those that don't?

Or do you do what I did for a while, and rebuild from scratch, downloading
gigabytes of containes every month because every once in a while you have to
nuke it?

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2019/8/docker_heroku_THUMB.png" alt="Tweet by Max Lynch: &quot;Docker is convincing too many young startups that they should first build a shitty version of Heroku, then build their product.&quot;" style="margin: 15px auto;" />
<p style="font-style: italic; text-align: center; font-size: small">(<a href="https://twitter.com/maxlynch/status/597768678382305280">via</a>)</p>
</div>

### Sidebar: the cost of abstraction

The main point of the questions in the preceding sections isn't to point out
that Docker is Bad, just that all abstractions carry a cost. It's always worth
asking "does this abstraction do enough for me that it's worth putting the time
into?"

My favorite example of this is the first question on ["Joel Test"][1], from _the
year 2000_.  For those who don't know, the "Joel Test" was simple questions you
can ask any engineering org to find out if they were serious about building
quality software. The first question is laughable in 2019, but is worth
reflecting on: "Do you use source control?"

It's worth noting that before Git and Mercurial (first released in 2005), source
control was pretty hard to do! [CVS][12] and [SVN][13] required someone set up an
always-on machine, secure it from outsiders but make it accessible to employees,
and host a server. Employees then had to learn esoteric commands if they ever
wanted to _edit files_ (the parlance was "checking out the files").

So it's funny to remember a time when a lot of people didn't think it was worth
the effort! Email files, pass around floppies, maybe copy files to a "master"
computer manually—setting up the server was hard! So maybe I'm being a big baby,
or maybe the tooling will get around to make it trivially easy to use. But even
great abstractions can cost teams enough that they don't want to adopt it.

## Docker as VC-backed company (NPM and the lessons therein)

Docker has raised [$292m on 8 funding rounds.][2] In the short run, this means
they can have nice things like hoodies, stickers, salaries, and an office. In
the long run, we see things like NPM's terrible, horrible, no-good, [very][15]
[bad][16] year, and Elastic's [licensing reckoning][14] being exacerbated by the
VCs who gave _them_ [$162m over 6 rounds][3] and will want to see massive
returns.

This is tied to bigger problems of open source and who funds the commons ("the
best thing about Open Source is the whole world can collaborate on San
Francisco's problems"). I won't get into it all here, I'm just nervous that
we're putting so much of our infrastructure and collective future on a very
specialization of a technology (Docker is mostly Linux namespaces and cgroups)
that happens to be massively VC-invested.

## Alternatives

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2019/8/solve_last_problems_THUMB.png" alt="Tweet by Syed Aqueel Haider: &quot;2014 - We must adopt #microservices to solve all problems with monoliths. 2016 - We must adopt #docker to solve all problems with microservices. 2018 - We must adopt #kubernetes to solve all problems with docker&quot;" style="margin: 15px auto;" />
<p style="font-style: italic; text-align: center; font-size: small">(<a href="https://twitter.com/sahrizv/status/1018184792611827712">via</a>)</p>
</div>

Usually before discussing alternatives, it's worth asking what problem it's
solving. But I think the best way to talk about where Docker shines is to do so
in comparison to its alternative, which is…

…the Good Old-Fashioned Build Server! Party like it's 2009! My preferred
alternative to Docker (or at least, _assistant_ to Docker, so your Docker
image just something like `ENTRYPOINT java -jar my_jar.jar`) is to leverage your
language's packaging and deployment mechanisms and run/maintain a server that
builds it on change.

It doesn't have to be too complicated:

* Host an EC2 instance with a public IP. Have it only respond to calls that use
  basic auth in the headers.

* Configure GitHub (or your other host/CI/whatever) webhooks to fire a webhook
  to that box. In response, it can `git pull origin master`, build your
  artifact, then `scp` it to your production hosts.

* Start the new artifact, route ALBs to it.

_For most companies, this will cover your bases for a long, long time._

The magic phrase in the above is "leverage your language's packaging and
deployment mechanisms":

* Erlang and Elixir have [OTP releases][5], which ship your app with all its
  dependencies compiled with the Erlang runtime. The production host only needs
  to be running on the same OS.

* Java has ["fat JARs"][6] which let you pack everything into something
  that can be `java -jar <target>`-ed with all its libraries. You can leverage
  [Java's shared, dynamic libraries the way HubSpot did][4] to push tiny JARs if
  it ever gets problematic.

* Go straight-up compiles binaries, `scp` those. OCaml or C++, too.

And what if you don't have these features? That's where Docker comes in.

See, each of those examples above has some kind of compilation phase, and/or a
VM built by teams or companies over decades that prioritized packaging
and deployment. But those aren't the technologies that are popular for startups.

Ruby and Python don't have much of a compilation step: to distribute the program
(simplistically) is to distribute the sources. The packaging systems are largely
a function of a global environment and machine. They were written in 1995 by
BDFLs who prioritized cases that were more popular in that time, before
ecosystems and package registries and the like exploded.

Generally, fans of Docker are seeking two things:

* "I want to deploy it and know it works the way it did on my computer."

In languages like Ruby and Python, this is notoriously hard to achieve,
thus the need for things like [virtualenv][9] or [Pipenv][8] or [tox][7], or
[this xkcd comic.][10] So while _distributing the program_ is easy (it's just
the sources!), your program depends on a giant, mutable environment, which
Docker makes easy to set up. In the Build Server examples above, you can build
in a way to make the environment almost irrelevant.

After a bunch of complaining, I'll say this: Ruby, Python, and Node projects are
ones where Docker makes more sense to me than in other tech stacks. But! Even
with this in mind, the tradeoffs of Docker in development processes should not
be discounted.

The other thing I see Docker for:

* "My project has a lot of components and I'd like to programmatically express
  their relationships declaratively for local development (anyone can `git
  clone` then `docker-compose up -d`)."

I don't have a great answer to this other than to suggest that exposing that
complexity to developer setup is a) a one-time cost, and b) probably not the
worst thing for them to be mindful of, all things considered? If you're
maintaining Redis and Elasticsearch and RabbitMQ for your api server serving an
SSR React app _in production_, I don't think it's a great sign if your devs can
only work with any subset of it when its all containerized. I've frequently seen
this:

> <p>"How do I run it?"</p>
> <p>"`docker-compose up -d`!"</p>
> <p>"Great! Now… I… don't know how to do anything else now… and it's all opaquely behind Docker…"</p>

## The Future™

<div class="caption-img-block" style="margin: 25px auto">
<img src="/img/2019/8/velartrill_tweet_THUMB.png" alt="Tweet from velartrill: &quot;the year is 2048. the average web page is now gigabytes in size, and contains multiple nested instances of the Linux kernel&quot;" style="margin: 15px auto;" />
<p style="font-style: italic; text-align: center; font-size: small">(<a href="https://twitter.com/velartrill/status/771799311558422528">via</a>)</p>
</div>

This battle is more or less lost, IMO; devs will keep following trends and
optimizing for hypergrowth and engineering org size. There are real benefits to
Docker and containers, and great use cases, but I worry that for many
engineering teams, it makes it ever harder to know what a computer is doing;
meanwhile, everything gets slower, [latencies increase][17], our devices draw more
power, and we keep building datacenters optimizing for scaling cases we wish we
had.

## Further reading

- Jess Frazelle on [Containers vs. Zones vs. Jails][11].

- Dan Woods [skewers a post by Tinder Engineering][18] on their move to Kubernetes.

---

   [1]: https://www.joelonsoftware.com/2000/08/09/the-joel-test-12-steps-to-better-code/
   [2]: https://www.crunchbase.com/organization/docker#section-overview
   [3]: https://www.crunchbase.com/organization/elasticsearch
   [4]: https://product.hubspot.com/blog/the-fault-in-our-jars-why-we-stopped-building-fat-jars
   [5]: https://hexdocs.pm/distillery/introduction/understanding_releases.html
   [6]: https://github.com/musketyr/gradle-fatjar-plugin#gradle-fatjar-plugin
   [7]: https://tox.readthedocs.io/en/latest/
   [8]: https://docs.pipenv.org/en/latest/
   [9]: https://virtualenv.pypa.io/en/latest/
   [10]: https://xkcd.com/1987/
   [11]: https://blog.jessfraz.com/post/containers-zones-jails-vms/
   [12]: https://www.nongnu.org/cvs/
   [13]: https://subversion.apache.org/
   [14]: https://redmonk.com/sogrady/2019/03/15/cloud-open-source-powder-keg/
   [15]: https://www.theregister.co.uk/2019/04/01/npm_layoff_staff/
   [16]: https://www.theregister.co.uk/2019/04/22/npm_fired_staff_union_complaints/#
   [17]: https://danluu.com/input-lag/
   [18]: https://twitter.com/danveloper/status/1118816110571339778?lang=en
