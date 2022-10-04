#!/usr/bin/env bash

function logger() {
  echo "-----> $*"
}

function indent() {
  c='s/^/       /'
  sed -u "$c"
}
