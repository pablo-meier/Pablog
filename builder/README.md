Builds my [Frog][1] based blog with my own preferences and targets. Since it
relies on some modifications to frog itself (namely, the ability to change
source and destination directories) I include my own copy of Frog until all the
changes get merged upstream, (if they do).

Changes from the original Frog:

* .frogrc takes a "src-dir" and "output-dir" option, which determine where Frog
  gets its files to process, and where it puts them post-process.

   [1]: https://github.com/greghendershott/frog
