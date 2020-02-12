watchexec-docker
================

A docker image that contains s statically linked version of [watchexec](https://github.com/watchexec/watchexec).

Usage Example
=============

It was specifically build for running dev environment using docker-compose without changing
your docker images. The following example shows how to restart a python server on file change:

```yaml
version: "2.4"
services:
  watchexec:
    image: recamshak/watchexec

  service1:
    image: service1
    build:
      context: service1
    entrypoint: "/watchexec/watchexec"
    command: ["--restart", "--no-shell", "--exts", "py", "python", "service1/server.py"]
    volumes:
      - "./service1/src:/app/src:ro"
    volumes_from:
      - watchexec:ro
```

The `watchexec` binary is self-contained and should run inside any container. It's language agnostics and can 
be used to restart your services as the example above or to run linter, complier, tests, etc.

