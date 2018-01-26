# Battletoad

Static site generator using OCaml.

## What else?

I'm using it to build off my former [Frog][1] project but to adapt to my own
needs. It's not quite a port (won't support everything Frog does) but neither is
it completely divorced from it.

## y tho?

Frog is an _amazing_ project, but a number of features are harder to implement
without full-on forking. Submitting PRs are an option, but it relies on the
author a) agreeing with the scope of my changes, and b) handling them promptly.
I'd rather not put that pressure on him or that dependency on me. I could
XEmacs-style port and DGAF about whether or not Greg can take my upstreams, but
I don't think I like that either.

Furthermore, I view building tools for my site to be something like how Jedi
have to make their own lightsabers.

Besides, I want to write some OCaml. I feel I will deeply come to regret this.

## Things I'd want different

The assumption on using Bootstrap is a bit hard on me. Generating more/less
links is done in Racket and not in the templates.

CSS/JS pipeline

I'd like to have more support for what metadata I can add/remove from posts,
like og:image/og:description per-post.

Medium-style "X minute read."
https://blog.medium.com/read-time-and-you-bc2048ab620c

Per-post actions, like adding a comment thread to a Discourse instance, or
posting to social media with various parameters.

Linkable paragraphs.

Versioned posts.

## Commands

To facilitate a smooth transition with Frog, I'll be porting over a number of
the settings and commands.

```
battletoad <option>

  -n <TITLE>
    Creates a new post in the configured source directory.
  -b
    Builds the site.
  -s
    Builds, starts a server.
  -p
    Builds, starts server, opens web page.
```


### TODO

- `ocamllint`
- `opam` friendliness
- use, like, clean modules.
- tests

### Modules used

- Omd
- ISO8601
- 

   [1]: https://github.com/greghendershott/frog
