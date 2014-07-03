# Configure an RSS/atom feed to be periodically fetched and e-mailed
#
# Takes a feed, an e-mail address to send it to, and a user to run rss2email as
# (which determines the From: address of the e-mail), and sets it all up.
#
# A newly configured feed is "primed" by downloading all existing entries and
# ignoring them; this means that you *won't* get e-mails for entries that exist
# at the time of the feed being added.
#
# Available attributes:
#
# * `$url` (string; required)
#
#    The URL of the feed to be added.
#
# * `$email` (string; required)
#
#    The e-mail address to send new entries to.
#
# * `$user` (string; required)
#
#    The user to run `rss2email` as, and which will be sending the e-mails
#    that go out for new entries.
#
define rss2email::feed(
		$url,
		$email,
		$user
) {
	include rss2email::core
	
	if !defined(Rss2email::Cronjob[$user]) {
		rss2email::cronjob { $user: }
	}
	
	$quoted_url   = shellquote($url)
	$quoted_email = shellquote($email)
	$quoted_user  = shellquote($user)
	
	exec { "rss2email::${name}::Add '$url' for '$user' to send to '$email'":
		command => "/bin/su -c '/usr/local/bin/rss2email-add-feed $quoted_url $quoted_email' - $quoted_user",
		unless  => "/bin/su -c '/usr/local/bin/rss2email-feed-exists $quoted_url $quoted_email' - $quoted_user";
	}
}
		
