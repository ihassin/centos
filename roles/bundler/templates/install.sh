#!/usr/bin/env bash
bundle install --binstubs
mkdir infra -p
cd infra
bundle exec cucumber --init
git init
vagrant init
