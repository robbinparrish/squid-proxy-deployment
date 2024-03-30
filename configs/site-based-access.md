## Site based access configuration.

The default configuration provided here does not includes site based access configuration. This can be easily configured here.

For this we can create some text files that will contains domain list which need to be either allowed or denied.

### Enable Site based access.
First enable the site based access in [Site Based Access](./squid.conf.d/site-based-access.conf) file. We will need to `uncomment` the lines those enable the authentication.

### Enable site based access for private network.
By default private network will be allowed to access squid server without any site based access. To enable site based access for private network comment out `http_access allow private-network` line in [Squid.conf](./squid.conf) file.

### Allowed domain list.
Create a file that will contain all domain names which are in allowed list.
```bash
touch ./configs/squid.conf.d/allowed_urls.txt
# Add all domain names in the file.
```

### Denied domain list.
Create a file that will contain all domain names which are in denied list.
```bash
touch ./configs/squid.conf.d/denied_urls.txt
# Add all domain names in the file.
```

### Restart the container.
```bash
docker-compose restart
```

### Initial configuration validation.
As this configuration allow and deny certain domain names. We can validate this with curl.
```bash
# Access a website from allowed list.
# This should work.
curl --proxy http://127.0.0.1:3128  https://SOME_ALLOWED_HTTPS_WEBSITE

# Access a website from denied list.
# This should not work.
curl --proxy http://127.0.0.1:3128 https://SOME_DENIED_HTTPS_WEBSITE
```
