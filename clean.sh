#!/bin/sh
# clean ruby environment (for major ruby version updates)
set -ex # halt script on error, echo on

rm -rf "$(grep -v '^#' .gitignore)"
rm Gemfile.lock
