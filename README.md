# Splash screen

Custom theme for superquinquin desktop.

## Build

Prepare Debian package structure before `dpkg-deb`

```console
$ make
```

Assets are built with `imagemagick`.

```console
$ make assets
```

## Testing

Install `xorg-xhost`.  
Use docker or podman.

```console 
$ podman-compose build plymouth
$ podman-compose run --rm plymouth 
```
