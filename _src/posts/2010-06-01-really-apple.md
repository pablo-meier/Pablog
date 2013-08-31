    Title: Really, Apple?
    Date:2010-06-01T12:47:00
    Tags: pablolife

Apple just showed themselves to be a bit lame about security, at least on Mac
OS X two years ago. Here's the story:

My sister had a MacBook to use for college when she was supposed to enroll in
2008. A few weeks later [she got sick with her encephalitis][1], and had her
remarkable recovery story.

Unfortunately, she didn't remember the root password she used for her laptop,
and it wasn't any of her 'standards' (we'd tried them all). So while she could
still use the computer via the auto-login function, she couldn't install or
update software (since this requires an authorized user to enter their
password). Regarding use of passwords, this was a stranger's computer.

This presented mild problems over the last few years, but this came to a fore
last night: with a very outdated iTunes, she couldn't sync her iPhone on her
laptop while a summer student at Columbia's School for Continuing Education.
This is on top of using and outdated and insecure OS, being unable to install
new software...

So I googled "recover lost root password Mac OS X," and lo and behold, [the
instructions I found worked!][2]

**This should not happen. I shouldn't be able to set or reset root passwords
with physical access to a stranger's computer.** Below is the fix, in both
technical terms and non-technical metaphor terms, for the curious:

_Technical:_ Holding Command-S on startup allows you to run in single-user
mode, _as root_. So a simple mount -uw / followed by passwd root allowed me to
set the password of user 'root' to letmein. Then I reboot, and log into Mac OS
X normally with admin privileges as user root.

_Non-technical Metaphor:_ Suppose you're building is guarded by a lazy
doorman. He has a list with all the tenants in the building, but when you walk
up to him, you notice he just looks at the placards on the mailboxes. I
effectively scribbled 'root' on a postcard, taped it to a mailbox, and walked
up to the guard the next day and said "My name is root!" Seeing it written on
a mailbox, he let me in and I changed the locks on a stranger's apartment.

While I haven't felt that elated in years (and saved my sister's computer from
having its reset to disk factory settings, our best alternative), this is a
major lame sauce from Apple.


   [1]: http://www.facebook.com/paul.meier#!/group.php?gid=25800962459
   [2]: http://www.macosxhints.com/article.php?story=20001217230925152
