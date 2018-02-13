#!/usr/bin/env perl

use v5.10;

# list blog posts (files in blog dir) as an unordered list with anchors

print "<ul>\n";

# return blog post li tag
sub listItem {
	my ($href, $name, $date) = @_;
	return sprintf("\t<li>\n\t<a href=\"blog/%s\">%s</a>\n\t<small>%s</small></li>\n\n", $href, $name, $date);
}

# change to user-specified directory to list
chdir $ARGV[0];

my $name, $date; # name and date of post
while(<*>)
{
	$name = $date = $_;

	$name =~ s/\d|-|\.html//g; # remove numbers, dashes and html extension
	$name =~ s/_/ /g; # replace underscores with spaces

	$date =~ s/[a-zA-Z]|_|\.html//g;


	print listItem($_, $name, $date);
}

print "</ul>\n";
