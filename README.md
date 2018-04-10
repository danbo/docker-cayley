A Docker image for [Cayley](https://github.com/google/cayley), an open-source graph database inspired by [Freebase](http://freebase.com) and Google's [Knowledge Graph](http://www.google.com/insidesearch/features/search/knowledge.html).

#### Getting Started

Building

If you want the release build, simply run

```
docker-compose build
```

If you want the master build, you'll need to invoke the build manually

```
docker build -t danbo/cayley -f Dockerfile.master .
```

then to run:

```
docker-compose up -d
```

Then open `http://<host>:64210` from your browser for the web GUI.


#### Notes

From https://github.com/sugarush/cayley/tree/alpine-docker
