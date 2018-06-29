# Hugo

This image has a latest version of [hugo](http://gohugo.io).
Do not use in production.


## Running

To use this image, you need to mount a volume with the content project in `/var/www`.

There is no `bash`. The hugo is executed by `ENTRYPOINT`. Therefore, parameters must be passed directly.

## Examples

To run a temporary container in **watch mode (-w)**:
```
docker run --rm -it -v $HOME/hugosite:/var/www hitalos/hugo -w
```

