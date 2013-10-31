This is mostly for operations that you may want to do on the finalized HTML.
First use case is for automatable performance tweaks, like consolidating script
requests and minifying them. Doing this from the Racket level is hard because of
Scribble rendering templates, and the fact that most minifying tools would have
to run in another process anyways.

Here we can consolidate what's present in "page-template" once, do the
minifications + consolidations once, and just apply it to all the generated
HTML.
