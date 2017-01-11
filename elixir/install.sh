#!/bin/sh

brew install elixir
mix local.hex --force
mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force
