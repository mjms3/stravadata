#!/bin/bash
echo "Running unit tests..."
git stash -q --keep-index
nosetests tests --with-coverage --cover-inclusive --cover-tests
RESULT=$?
git stash pop -q
[ $RESULT -ne 0 ] && exit 1


#Run pylint
echo "Running pylint..."
find . -path ./stravalib -prune -o -type f -name '*.py' | xargs pylint