This Puppet module manages an rss2email installation on a machine.  You may
wonder why you would *ever* want to bother with managing `rss2email` via
Puppet... I use it to send notifications of security updates to sysadmins,
when there's no better means of receiving them (there's no announcements
e-mail list to subscribe to, for example).

Usage is pretty simple.  You just use the `rss2email::feed` type to create a
new feed.  It'll take care of everything behind the scenes (setting up the
cron job, etc).  See the docs in the type definition itself for all the gory
details.
