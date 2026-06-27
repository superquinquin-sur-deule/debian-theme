# Splash screen

Custom theme for superquinquin desktop.

## Build

Assets are built with `imagemagick`.

```console
$ make
```

## Testing

Install `xorg-xhost`.  
Use docker or podman.

```console 
$ podman-compose build plymouth
$ podman-compose run --rm plymouth 
```
