# Design doc

A few things I'd like this site to be/do

## TODO

### HTTPS-only, HSTS

It's 2017 and I'm not supporting customers or anything. I already have HTTPS
(though it breaks on `www` subdomain...), now to HSTS

### Tweakable

I want to have more flexibility for things like linkable paragraphs, or post
versions, or newsletter-ability.

- Linkable Paragraphs

### Config for use cases

Optimizing images for the web, thumbnail-to-full-size on click, directory
management should all be easier.

Twitter pull: could even do a daily post of what I wrote on Twitter. That's
probably a separate process/set-of-processes I could run in, idk, Lambda, rather
than rent an EC2 instance.

### LiveJournal import

Get my old old stuff on there.

## Finished (more or less)

### Statically served

- I don't want to worry about 'uptime' of an application server or a DB, per a
  ton of dynamic blog solutions.

- That shit is _cheap_ to host.

- Less tech to worry about performance or anything like that.
