    Title: 🗣 Recent Sound Adventures 🔊
    Date: 2019-11-26T22:47:41
    Tags: art, culture, pablolife, projects, works
    og_image: https://morepablo.com/img/2019/11/greenhouse_THUMB.jpg
    og_description: I made sounds!! For installations, mostly. It was fun doing this again.

<small>🎵 <em>The song for this post is <a href="https://www.youtube.com/watch?v=EmAH9XcDKb8">The Spinach Rag</a>, by Nobuo Uematsu for Final Fantasy VI.</em> 🎵</small>

<div class="caption-img-block" style="margin: 25px auto">
<a href="https://pxhere.com/en/photo/133305" target="blank"><img src="/img/2019/11/greenhouse_THUMB.jpg" alt="A photo of a greenhouse." style="margin: 15px auto;" /></a>
</div>

I was having fun with friends a few months ago where I got to stretch my old
sound designer muscles and made three little pieces. I'll first document what
they are, then talk a little about how I built them, for if you ever want to try
something similar. All were made under pretty severe time and energy
constraints, so they're not at "professional" level polish, but I still like how
they came out 😊

## The Work

### Personal Climate Impact Sound Effects

The most bite-sized and immediately entertaining, I designed six effects for an
installation that told a user if their personal climate impact was responsible
or irresponsible. They stood in front of the installation, pressed a button,
and were evalutated, playing one of these 6 at random.

<audio controls src="/audio/2019/11/climate_responsibility1.mp3">
Your browser does not support the <code>audio</code>element</audio>

<audio controls src="/audio/2019/11/climate_responsibility2.mp3">
Your browser does not support the <code>audio</code>element</audio>

<audio controls src="/audio/2019/11/climate_responsibility3.mp3">
Your browser does not support the <code>audio</code>element</audio>

<audio controls src="/audio/2019/11/climate_responsibility4.mp3">
Your browser does not support the <code>audio</code>element</audio>

<audio controls src="/audio/2019/11/climate_responsibility5.mp3">
Your browser does not support the <code>audio</code>element</audio>

<audio controls src="/audio/2019/11/climate_responsibility6.mp3">
Your browser does not support the <code>audio</code>element</audio>

### Greenhouse sanctuary

I designed a soundscape that played in a set piece of an installation. It
imagined the world ravaged by climate change: virtually all animals were dead,
and all the vegetation was represented as being contained in the greenhouse. It
was supposed to be a peaceful space for people to relax and ruminate, and I
produced a generative track that dynamically created a soundscape within
parameters, continuously. Here's about two minutes of it.

<audio controls src="/audio/2019/11/greenhouse_soundscape1.mp3">
Your browser does not support the <code>audio</code>element</audio>

There's a fair bit of randomness involved in exactly how it sounds; that
iteration is a little darker; further down the track, it might sound like this:

<audio controls src="/audio/2019/11/greenhouse_soundscape2.mp3">
Your browser does not support the <code>audio</code>element</audio>

### Fake Animal Facts

In the same setting above, we intended to have a table with headphones someone
could put on to hear looped "facts" about animals that were reconstructed by
people desperate to know about them, but completely wrong about everything. It
was Attenborough-esque, and meant to loop continously, so anyone could come and
put them on to listen to as many or few as they liked.

Most of these were recorded in a panic, by speaking directly into my laptop, in
a hallway with people coming and going. Especially in the early "facts," you can
hear things happening in the background, and some amateur mistakes like popping
in the mic.

I condensed the lines a little so you can hear it all in a few minutes, instead
of the 5 meant for passers-by.

<audio controls src="/audio/2019/11/attenborough_condensed.mp3">
Your browser does not support the <code>audio</code>element</audio>

## How

All of these were on my Mac laptop, so I keep in mind it's pretty OS specific.

### Personal Climate Impact Sound Effects

This required 3 tools. The easiest was [the `say` command][3], which lets you use
Apple's historically excellent accessibility skills to make your computer speak
out loud. For example, if you want to [recreate the old "DROID" sound][2] from
Android phone commercials, you can run `say -v Cellos DROID`, [like so][1].

One of the options lets you save the playback as a file, which is how I made the
Samantha voice say all those things.

The next step was sourcing the other sound effects (All Star, Yakety Sax, the
dial-up modem noise). This pipeline of tools is super useful (and there are
probably other ways to do this).

The first step is downloading [youtubedown.pl][4], a 6000-line Perl script by
[Jamie Zawinski][5]. It's fantastic, old-internet hackery that takes a YouTube
or Vimeo URL and pulls the video down to your computer. Find the sound effects
you need on YouTube and download them locally.

From here, I used [ffmpeg][6] to extract the sound into its own track.

Lastly, I used the hideous-but-powerful [Audacity][7] to split and splice the
tracks together, then exported them to a WAV file.

### Greenhouse sanctuary

For this I wanted to use generative sounds since it'd be looping in a space for
hours and hours. I used [Sonic Pi][10] for this, which is a wonderful music
coding environment I recommend to everyone to play with; the tutorial has you
making sounds pretty quickly and gives you music-making tools in hours, and it's
_super_ easy to share and edit the clips of others.

So there were two main components: the chords, and the samples.

Samples are concrete sound effects taken from other pre-recorded media, in this
case, animal sounds. I ripped frog, bird, and whale sounds from YouTube, used
Audacity to isolate them into individual sounds for the files. Then made a
little Sonic Pi script to load them into memory, then loop forever, playing them
with little delays.

The chords came from one of the provided examples "Cloud Beat." It sounds like
this:

<audio controls src="/audio/2019/11/cloud_beat.mp3">
Your browser does not support the <code>audio</code>element</audio>

I kept and isolate the code bits that did those 8 second chords (so removed the
vinyl hiss and snare):

<audio controls src="/audio/2019/11/cloud_beat_chords.mp3">
Your browser does not support the <code>audio</code>element</audio>

Then I altered the chords: I asked Karen "what's your favorite musical key?" She
said C Minor, so I made that my 1. I added chords for IV, V, VII. Finally, made
all the following change at random:

* Which chord in the progression we play (I, IV, V, VII).
* The synth we use (Cloud beat has one, I swap around 5 or 8).
* How "wide" our chords are (five, seven, or nine notes).
* The "character" of the chords (sometimes it plays them diminished, or augmented).
* _Ocassionally_, we modulate to a new key entirely.

The samples go at random as well:

* Which animal sound we play.
* How fast it plays (down to half speed, up to double).
* Whether it plays forward or backward.
* How long to wait until playing another one.

This was my first non-trivial project with Sonic Pi, and I'm sure I footgunned
hard here, but I had a ton of fun with it.

### Fake Animal Facts

This was built much like the Personal Climate Impact sound effects: I pulled a
generic background soundscape from YouTube, and layered my voice recordings
over that soundscape.

I'll mention a few other techniques for making your voice sound better: the
[remove noise][8] effect is _extremely_ good for coming from a free tool, and
[normalizing your audio][9] helps get your amplitude up.

   [1]: https://www.youtube.com/watch?v=kV7k8SqGFGY
   [2]: https://www.youtube.com/watch?v=UBL47tHrvMA
   [3]: https://www.techradar.com/how-to/computing/apple/terminal-101-making-your-mac-talk-with-say-1305649
   [4]: https://www.jwz.org/hacks/youtubedown
   [5]: https://www.jwz.org/blog/
   [6]: https://www.ffmpeg.org/
   [7]: https://www.audacityteam.org/
   [8]: https://fedoramagazine.org/audacity-quick-tip-quickly-remove-background-noise/
   [9]: https://www.youtube.com/watch?v=j1fvmeKj1gI
   [10]: https://sonic-pi.net/
