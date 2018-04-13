#!/bin/sh

APP_ROOT=$(pwd)
PLUGIN_ROOT=$APP_ROOT/foreman_discovery

git clone -b rails_52 https://github.com/mmoll/foreman_discovery.git

echo "gem 'foreman_discovery', :path => '${PLUGIN_ROOT}'" >> bundler.d/Gemfile.local.rb
