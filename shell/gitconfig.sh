#!/bin/bash
username=jessebl
email=j.bl@posteo.net

git config --global user.name $username
git config --global user.email $email
git config --global core.editor "nvim"

# By default, push only the current branch instead of all branches
## All branches would be "matching" instead of "simple"
git config --global push.default simple

# Cache credentials when pushing
git config --global credential.helper 'cache'
