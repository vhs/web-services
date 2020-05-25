# IsVHSOpen Docker Container

Is it open? IS IT?!

## Installing

Run create.sh. This will create a docker container and run it. By default it will restart automatically
when docker is restarted. The image is built in docker hub automatically, source code can be found at http://github.com/vhs/isvhsopen

## Starting and Stopping

```bash
$ docker stop isvhsopen
$ docker start isvhsopen
```

Kill can be used instead of stop 

## Updating

```bash
$ docker stop isvhsopen
$ docker rm isvhsopen
$ docker pull vanhack/isvhsopen
$ ./create.sh
```
