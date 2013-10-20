    Title: CS Pranks:  Push it!
    Date:2010-10-27T23:21:00
    Tags: pablolife

While working as a [Sunlab consultant][1] at Brown, my buddy and I would
frequently find ways to 'spice up' the workspace. If we ever found the other
person's workstation empty without being properly xlocked, we'd usually pull
pranks on each other: 'alias ls='eject; ls' being a popular harmless one, or
writing zwrite `&lt;`username`&gt;` -m "PAUL LOGGED OUT" on my .logout file,
executed anytime I logged out.


The sad thing about these pranks was that occasionally someone else would do a
more malicious one, and we'd get blamed :( But there's still so much fun to be
had from finding ways to shake things up.


[This tweet][2] by [Coding Horror's][3] Jeff Atwood gave me the idea for the
next one:

> by law, every fifth push to DVCS must be followed by this video link
> http://www.youtube.com/watch?v=vCadcBR95oU


Naturally, the youtube link plays this:

<iframe width="560" height="315" src="//www.youtube.com/embed/vCadcBR95oU" frameborder="0" allowfullscreen></iframe>

_Gotta_ love the 80's.


Were I still there, I would love to institute this. But for now, I'm setting
it up on my machine, to keep things from getting too boring. To do this
yourself you'll need the following:


* [mpg123][4], a simple command-line mp3 player. Easily installable.
* An mp3 of Salt-n-Pepa's _Push It_

Given all this, the rest is easy as pie. There are surely more elegant
solutions than what I did:

* Store the number of pushes in an external file echo "1" > how\_many\_pushes.txt
* Write a script to keep track of and increment that number as time goes on.

Here's my Ruby script:

```rb
    #!/usr/bin/ruby

    FILENAME = "this_many_pushes.txt"
    PUSH_IT_DIR = "/Users/pmeier/Desktop/projects/push_it"

    command = "git push "
    ARGV.each { |x| command += x + " " }
    puts command
    success = system(command)

    if not success then puts "Push failed!"; Process.exit end

    num_pushes = File.read(FILENAME).strip.to_i

    puts num_pushes.to_s

    if num_pushes == 0
		puts "Push it!"
		system("mpg123 #{PUSH_IT_DIR}/push_it.mp3 &")
		system("echo '5' > #{FILENAME}")
    else
		system("echo '#{num_pushes - 1}' > #{FILENAME}")
    end
```

* Execute git config --global alias.psh !push_wrapper.rb.


Now just use git psh instead of git push, and have a surprise every now and
then ^\_^


   [1]: http://www.cs.brown.edu/ugrad/jobs/consult/
   [2]: http://twitter.com/codinghorror/status/21559239552
   [3]: http://www.codinghorror.com
   [4]: http://www.mpg123.de/
