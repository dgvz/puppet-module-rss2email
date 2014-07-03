# What's needed for any machine that wants to do anything with rss2email.
# You should never need to deal with this directly; the user-facing types
# should include it whenever necessary.
class rss2email::core {
	package { "rss2email": }
	
	file {
		"/usr/local/bin/rss2email-add-feed":
			source => "puppet:///modules/rss2email/usr/local/bin/rss2email-add-feed",
			mode   => 0555,
			owner  => "root",
			group  => "root";
		"/usr/local/bin/rss2email-feed-exists":
			source => "puppet:///modules/rss2email/usr/local/bin/rss2email-feed-exists",
			mode   => 0555,
			owner  => "root",
			group  => "root";
	}
}
