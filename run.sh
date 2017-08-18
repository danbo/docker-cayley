#!/bin/sh

if [ ! -f "/data/cayley.json" ]; then
  echo '{"database" : "bolt", "db_path" : "/data/db", "read_only" : false}' > /data/cayley.json
  /opt/cayley/cayley init -config "/data/cayley.json"
fi

cd /opt/cayley
./cayley http -config "/data/cayley.json" -logtostderr=true -host="0.0.0.0"
