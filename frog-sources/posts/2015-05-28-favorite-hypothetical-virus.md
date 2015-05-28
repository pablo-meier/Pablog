    Title: My favorite hypothetical virus
    Date: 2015-05-28T20:31:28
    Tags: programming, pablolife

I took and TA-ed my college's [Computer Security course][1], where we did things
like write malware and put it on VMs, or sillier projects like [port knocking][2].
Who knows what they're doing now.

Anyways, I always had one idea for a virus I wanted to write to maximize chaos:

Every _n_ hours, the virus finds two files on the filesystem that have identical
filetypes. Then, it _swaps the files_, but also _swaps their filenames._ Let's
see this in action:

```
# Find two files of similar types, then do something like:

File1=$HOME/Videos/wedding_video.mp4
File2=$HOME/secret/gigli_ben_afflect_j_lo.mp4

mv $File1 $HOME/secret/gigli_ben_afflect_j_lo.mp4.tmp
mv $File2 $HOME/Videos/wedding_video.mp4
mv $HOME/secret/gigli_ben_afflect_j_lo.mp4.tmp $HOME/secret/gigli_ben_afflect_j_lo.mp4
```

What this does is: over time, the user's filesystem will _appear_ identical by
most human measurement (the 'Movies' directory will contain a bunch of video
files, with the same names as it's ever had), but when if and when the user ever
tries to open/use it, it contains something else entirely. In the example above,
when the owner wants to watch Bennifer's _Gigli_, they'll see a wedding video
instead. When they want to watch their wedding video, they'll get _Gigli_. Do
this slowly, across the entire filesystem and any filetypes.

I never even wrote a prototype, but when I considered doing anything like that,
I always envisioned keeping something like a 'transaction table' so it would be
easy to roll back.

   [1]: http://cs.brown.edu/courses/cs166/
   [2]: http://www.portknocking.org/
