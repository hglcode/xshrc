#!/usr/bin/sh

set -e
self=$(realpath "$0")
here=$(dirname "$self")

# shellcheck disable=SC1091
. "$here/shrc.sh"
