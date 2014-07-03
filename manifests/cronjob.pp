# Create an rss2email cronjob for a given user.
#
# Available options:
#
# * `$name` (*namevar*; string)
#
#    Which user to setup the cronjob for.  You specify the user as the
#    namevar because there should be only one cronjob for a given system
#    user (otherwise madness will result, with more RSS feed checking than
#    is generally considered sensible).
#
#    If you're using this type yourself, you'll need to do your own
#    duplicate checking (using `defined()`); the `rss2email` types which use
#    this type do that checking as well.  It's a shit of a situation, but
#    it's the least-worst I can do under the circumstances.
#
# * `$hour` (integer, string, array of integers, or `absent`; optional; default: `0`)
#
#    The hour of the day at which to run the cronjob.  This can be specified
#    in a great many different ways -- see the Puppet `cron` type docs for
#    all the fun and games that can be had here.
#
# * `$minute` (integer, string, array of integers, or `absent`; optional; default: `0`)
#
#    The minute at which to run the cronjob.  This can be specified in a
#    great many different ways -- see the Puppet `cron` type docs for all
#    the fun and games that can be had here.
#
define rss2email::cronjob(
		$hour = 0,
		$minute = 0
) {
	include rss2email::core
	
	cron { "${name}/rss2email":
		command => "/usr/bin/r2e run",
		user    => $name,
		hour    => $hour,
		minute  => $minute,
		require => Package["rss2email"]
	}
}
