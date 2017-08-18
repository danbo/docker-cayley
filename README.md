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

There are two images available:

1. Dockerfile - Forked from https://github.com/saidimu/cayley-docker for release versions of cayley, here are the changes:


#### Changes from fork:

- Updated to latest release version of cayley
- Rebuilding image automatically pulls latest released version of cayley from github.
- Auto create initial config and init DB if it does not exist.
- Changed image to alpine with glibc support for minimal footprint
- Removed fig for now.


2. Dockerfile.master - Forked from https://github.com/sugarush/cayley, here are the changes:
-  Auto create initial config and init DB if it does not exist.