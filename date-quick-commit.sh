#!/usr/bin/env bash

./add-date.sh;

echo "Enter commit message:";
read input;
git add .; git commit -m "$input"; git push;
