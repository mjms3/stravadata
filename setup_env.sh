#!/bin/bash

source deactivate
source activate stravadata

alias l="ls -la"
alias gitci='git commit'
alias gitst='git s'
alias up='cd ..' 

rm -rf .git/hooks/pre-commit
ln -s ../../pre-commit.sh .git/hooks/pre-commit