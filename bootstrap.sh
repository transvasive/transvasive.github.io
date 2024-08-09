#!/bin/sh
# use rbenv to install base ruby stack (ruby, gem, bundler)
set -ex # halt script on error, echo on

# NOTE: rbenv not needed for current versions used with `brew rbenv-sync`
# rbenv install "$(cat .ruby-version)"
bundle config set --local with ci
bundle install
bundle package
