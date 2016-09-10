#!/bin/bash
echo "Running unit tests..."
git stash -q --keep-index
nosetests --with-coverage --cover-inclusive --cover-tests
RESULT=$?
git stash pop -q
[ $RESULT -ne 0 ] && exit 1


#Run pylint
echo "Running pylint..."
find . -type f -name '*.py' | xargs pylint