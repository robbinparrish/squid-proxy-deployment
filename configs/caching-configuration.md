## Caching Configuration.

The default configuration provided here does not includes Caching functionality. This can be easily configured here.

### Enable Caching Configuration.
First enable the caching in [Caching Configuration](./squid.conf.d/caching-configuration.conf) file. We will need to `uncomment` the lines those enable the caching.

### Create Cache directory..
```bash
docker-compose exec -it squid chown -R squid.squid /var/spool/squid
```

### Restart the container.
```bash
docker-compose restart
```

### Initial configuration validation.
As this configuration enable the Caching of any contents. We can validate this with curl.
```bash
# Check the Caching storage information.
du -sh ./squid-data/cache-dir/

# Download a file, the first time it will take some time.
curl --proxy http://127.0.0.1:3128 SOME_FILE_URL -o SOME_FILE_NAME

# Download the same file again. this time it should get downloaded from Cached contents.
curl --proxy http://127.0.0.1:3128 SOME_FILE_URL -o SOME_FILE_NAME

# Check the Caching storage information.
du -sh ./squid-data/cache-dir/
```

### Purging the Cache.
```bash
docker-compose exec -it squid rm -rf /var/spool/squid/*
```
