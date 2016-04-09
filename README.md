# phoenix-docker-alpine
Alpine based Dockerfile for the Phoenix framework

Usage:
```
$ docker build -t phoenix .
$ docker run -v $(pwd):/home/app -p 4000 phoenix mix phoenix.server
```
