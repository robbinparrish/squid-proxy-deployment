# Perform an automatic backup of Squid Deployment.

## Copy backup script.
```bash
cp -a squid-proxy-deployment-backup.sh /usr/bin/
chmod +x /usr/bin/squid-proxy-deployment-backup.sh
```

## Update the configuration path in the backup script.
Update following in `/usr/bin/squid-proxy-deployment-backup.sh`
```
SQUID_DEPLOYMENT_DIR="${HOME}/squid-proxy-deployment"
SQUID_DEPLOYMENT_BACKUP_PATH="${HOME}/squid-proxy-deployment-backup"
```

## Copy systemd unit and timer files.
```bash
cp squid-proxy-deployment-backup.timer squid-proxy-deployment-backup.service /etc/systemd/system/
```

## Enable the timer.
```bash
systemctl daemon-reload
systemctl enable --now squid-proxy-deployment-backup.timer
```