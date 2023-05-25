#!/bin/sh
# Taken from ublue docs!

# Retrieve latest changes from upstream's template.
git fetch upstream template
git checkout template
git merge --ff-only upstream/template
git push

# Rebase your own "live" changes onto the latest template.
git checkout live
git rebase --onto live template

# Perform a force-push to update your "live" branch on GitHub, to deploy.
# The "lease" ensures that you won't overwrite "live" if GitHub's version
# is different than your local version (ie. if a team member pushed to it).
git push --force-with-lease