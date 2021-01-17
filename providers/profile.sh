#!/usr/bin/env bash
set -euo pipefail

rm -fv .bash_profile
echo 'export GIT_DISABLE_UNTRACKED_CACHE=true' >> .bash_profile
