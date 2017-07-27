#!/bin/sh
# inotify-tools watch script

while inotifywait -e close_write \
file_to_watch_1 \
file_to_watch_2 \
do ./some_script; done;
