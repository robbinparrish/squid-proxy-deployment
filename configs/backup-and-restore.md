## Backup and Restore.

### Backup Squid instance.
Since Squid stores all data in the configuration files so we will just need to backup the all configuration files.

For the backup following directories must be `manually` backed up.  
```
./squid-data/cache-dir
./configs/squid.conf
./configs/squid.conf.d
```

#### Triggering Backup.
Run following command to trigger the backup.
This will copy all the configuration files in the `./squid-data/backups` directory.
```bash
cp -a ./squid-data/cache-dir ./configs/squid.conf ./configs/squid.conf.d ./squid-data/backups/
```

#### Triggering Restore.
Followings conditions must be met for restore.
- A working Squid instance.

#### Restore.
- Stop the Squid container.
```bash
docker-compose down squid
```

- Restore/Copy the configuration files.
```
First remove existing directories.
./squid-data/cache-dir
./configs/squid.conf
./configs/squid.conf.d

Now copy backed up directories.
Copy cache-dir to ./squid-data/cache-dir
Copy squid.conf to ./configs/squid.conf
Copy squid.conf.d to ./configs/squid.conf.d
```

### Stop all the container.
```
docker-compose down
```

### Starting the container.
```
docker-compose up -d
```

### Checking the container logs.
```
docker-compose logs -f
```

[Automatic Backup Setup](./automatic-backup/README.md)
