## Upgrading Squid to latest Stable Release.

**NOTE** - Before proceeding further please make sure that you have created a backup. If not then follow [Backup and Restore](./backup-and-restore.md) to create a backup.

### Identify the latest released version.
- https://hub.docker.com/_/alpine/tags
- https://pkgs.alpinelinux.org/packages?name=squid&branch=&repo=&arch=x86_64&maintainer=

Once the latest released version is identified we can update the corresponding version in the [Dockerfile](./../Dockerfile) file.

We can use the latest stable released version of the [Alpine](https://hub.docker.com/_/alpine/tags) image that will contain the stable version of Squid.

### Upgrading the container.
```bash
docker-compose up -d
```

### Checking the container logs.
```bash
docker-compose logs -f
```
