# Design doc

A few things I'd like this site to be/do

## Statically served

- I don't want to worry about 'uptime' of an application server or a DB, per a
  ton of dynamic blog solutions.

- That shit is _cheap_ to host.

- Less tech to worry about performance or anything like that.

## HTTPS-only, HSTS

It's 2017 and I'm not supporting customers or anything.

## Tweakable

I want to have more flexibility for things like linkable paragraphs, or post
versions, or newsletter-ability.

## Config for use cases

Optimizing images for the web, thumbnail-to-full-size on click, directory
management should all be easier.

Twitter pull: could even do a daily post of what I wrote on Twitter. That's
probably a separate process/set-of-processes I could run in, idk, Lambda, rather
than rent an EC2 instance.
