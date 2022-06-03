## Rebuilding the image
```
docker build -t kbaylosis/flutter-stable .
```

## Running the image

### Detached mode
```
docker run -it kbaylosis/flutter-stable .
```

### Mounted mode
```
docker run -itv <path on host>:/root/app kbaylosis/flutter-stable
```

NOTE: Paths must be absolute.

### Mounted mode on current directory
```
docker run --network=host -itv `pwd`:/root/app kbaylosis/flutter-stable
```

### Releasing
```
docker tag <image-sha / name> kbaylosis/flutter-stable
docker push kbaylosis/flutter-stable:latest
```
