# Docker Image for [Pidet](https://github.com/dnek/Pidet)

## [Pidet](https://github.com/dnek/Pidet)
* IDE for [Piet](http://www.dangermouse.net/esoteric/piet.html).
* https://github.com/dnek/Pidet

## How to Use

```
$ docker run --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 -v $(pwd)/share:/home/user/share -it okwrtdsh/pidet
```


## How to Build
* Base Image: okwrtdsh/wine

```
$ docker run --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 -it okwrtdsh/wine
```

### Install Dependencies

```
$ winecfg
```
* Wine Mono Installer: `Install`
* Wine Gecko Installer: `Install`
* Wine configuration: `OK`

```
$ winetricks
```

* Winetricks
  * choose `Install an application` and `OK` and `Cancel`
  * choose `Install a Windows DLL or component` and `OK`
  * choose `dotnet462` and `OK`
* .NET Framework 4 Setup
  * check `I have read and accept the license terms.` and `Install`
  * `Finish`

```
$ CTRL + C
```

### Install Fonts

```
$ winetricks allfonts

```

### Download Pidet

```
$ export PIDET_VERSION=20170614
$ wget https://github.com/dnek/Pidet/releases/download/ver${PIDET_VERSION}/Pidet${PIDET_VERSION}.zip
$ unzip Pidet${PIDET_VERSION}.zip && rm Pidet${PIDET_VERSION}.zip
```

### Run Pidet

```
$ wine pidet.exe

```

### Detach From Container Without Stopping

```
$ CTRL + P, CTRL + Q
```

## Push image to DockerHub

```
$ docker commit CONTAINER okwrtdsh/pidet
$ docker push okwrtdsh/pidet
```
