#!/bin/bash
git config --global user.name kantsdog
git config --global user.email j.bl@openmailbox.org
git config --global core.editor "vi"

# By default, push only the current branch instead of all branches
## All branches would be "matching" instead of "simple"
git config --global push.default simple
