# Header Stomper

[Frog][1] uses a [Racket Markdown][2] library that turns this:

```
### This is a level 3 header
```

into

```
<h3 id="this-is-a-level-3-header">This is a level 3 header</h3>
```

but [Omd][3], the library I used for the replacement tool, turns it into

```
<h3 id="This-is-a-level-3-header">This is a level 3 header</h3>
```

Meaning any time I've deeplinked a header anywhere else is effectively broken.

This is one solution the problem: a little awk script that finds headers and
does the substitution directly, the Racket way, since Markdown allows arbitrary
HTML.
