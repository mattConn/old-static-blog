#!/usr/bin/env bash

echo "Enter bookmark url and name:";
read url name;
echo "<li><a href=\"$url\">$name</a></li>" >> src/includes/bookmarks/links.html;
