## Certificate based authentication.

The default configuration provided here does not includes Certificate based authentication. This can be easily configured here.  
https://wiki.squid-cache.org/ConfigExamples/Intercept/SslBumpExplicit

For this we will need to create RootCA that will be used to intercept the SSL certificates of https sites.

### Generate RootCA.
```bash
openssl genrsa -out ./configs/squid.conf.d/Squid-RootCA.key 4096
openssl req -x509 -new -nodes -key ./configs/squid.conf.d/Squid-RootCA.key -days 365 -out ./configs/squid.conf.d/Squid-RootCA.crt -subj '/CN=Squid Root CA/C=/ST=/L=/O=Squid RootCA'
```

### Enable Certificate based authentication.
First enable the certificate based authentication in [Certificate Based Authentication](squid.conf.d/certificate-based-authentication.conf) file. We will need to `uncomment` the lines those enable the authentication.

### Disable default configuration.
We will need to comment out the default `http_port 3128` line in [Squid.conf](./squid.conf) file. Along with this, if requires then we can enable the [User based authentication](./user-based-authentication.md). This will make sure that every access must provide the user authentication. For https requests must provide the RootCA along with user authentication.

### Create SSL certificate database.
```bash
docker-compose exec -it squid /usr/lib/squid/security_file_certgen -c -s /etc/squid/conf.d/ssl_db -M 4MB
docker-compose exec -it squid chown -R squid.squid /etc/squid/conf.d/ssl_db
```

### Restart the container.
```bash
docker-compose restart
```

### Initial configuration validation.
As this configuration require a certificate based authentication. We can validate this with curl.
```bash
# Access a website with certificate authentication.
# Here we can also check that certificate is issued by Squid-RootCA by using `-v` option in curl.
# This should work.
curl --proxy http://127.0.0.1:3128 --cacert configs/squid.conf.d/Squid-RootCA.crt https://SOME_HTTPS_WEBSITE

# Access a website without certificate authentication.
# This should not work.
curl --proxy http://127.0.0.1:3128 https://SOME_HTTPS_WEBSITE
```
