#!/bin/bash
if [[ $(which ruby) == "/usr/bin/ruby" ]]
then
  echo
  echo "Installing the latest version of Ruby"
  ruby-install --latest --cleanup --no-reinstall ruby
  gem install bundler
fi
