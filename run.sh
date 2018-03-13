#!/bin/sh

cd /usr/local/bin

if [ ! -f "/data/cayley.yml" ]; then
  cp /cayley.yml /data/cayley.yml
  ./cayley init --config "/data/cayley.yml"
fi

./cayley http --assets="/assets" --config "/data/cayley.yml" --logtostderr=true --host="0.0.0.0:64210"
