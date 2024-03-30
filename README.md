## Disclaimer.
The content on this account/repository provided solely for educational and informational purposes.
It is not intended for use in making any kind of business, investment and/or legal decisions.
Although every effort has been made to keep the information up-to-date and accurate, no representations and/or warranties, express and/or implied, completeness, accuracy, reliability, suitability, and/or availability of the content.

## Squid.
This can be used to setup a Squid Server as a Forwarding and Caching Proxy.  
Squid - https://www.squid-cache.org/Doc/

## Docker Compose Version.
Always validate that [docker-compose](https://github.com/docker/compose/releases/) version is latest.
If not then use the latest released version. As of updating this document `v2.24.0` was latest released version.

### Starting the container.
```bash
docker-compose up -d
```

### Checking the container logs.
```bash
docker-compose logs -f
```

### Initial configuration validation.
As the default configuration provided here is sufficient as it provides default access to private network. We can validate this with curl.
```bash
# Check that access is allowed for any website with port 80 (http) or 443 (https).
# This should work.
curl --proxy http://127.0.0.1:3128 http://SOME_HTTP_WEBSITE
curl --proxy http://127.0.0.1:3128 https://SOME_HTTPS_WEBSITE

# Check that access is blocked for any website with some other ports (eg. 8443).
# This should not work.
curl --proxy http://127.0.0.1:3128 https://SOME_HTTPS_WEBSITE:8443
```

### Additional configuration setup.

[Documentation Config](https://www.squid-cache.org/Doc/config/)

[Configure User based authentication](./configs/user-based-authentication.md)

[Configure Certificate based authentication](./configs/certificate-based-authentication.md)

[Configure Site based access](./configs/site-based-access.md)

[Configure Caching](./configs/caching-configuration.md)

[Backup and Restore](./configs/backup-and-restore.md)

[Upgrading Squid](./configs/upgrading-squid.md)
