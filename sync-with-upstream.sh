#!/bin/sh
git fetch upstream template
git checkout template
git merge --ff-only upstream/template
git push

git checkout live
git rebase --onto live template

git push --force-with-lease