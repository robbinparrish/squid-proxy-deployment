## User based authentication.

The default configuration provided here does not includes an User based authentication. This can be easily configured here.  
https://wiki.squid-cache.org/Features/Authentication

For this we can create multiple user accounts that will be only able to access the squid server.

### Enable User based authentication.
First enable the user based authentication in [User Based Authentication](./squid.conf.d/user-based-authentication.conf) file. We will need to `uncomment` the lines those enable the authentication.

### Enable User based authentication for private network.
By default private network will be allowed to access squid server without any authentication. To enable authentication for private network comment out `http_access allow private-network` line in [Squid.conf](./squid.conf) file.

### Create User account.
Once the authentication enabled we can create user account.
```bash
touch configs/squid.conf.d/basic-auth.htpasswd
docker-compose exec -it squid htpasswd -bB /etc/squid/conf.d/basic-auth.htpasswd USERNAME PASSWORD
```

### Restart the container.
```bash
docker-compose restart
```

### Initial configuration validation.
As this configuration require an user based authentication. We can validate this with curl.
```bash
# Access a website with user authentication.
# This should work.
curl --proxy http://127.0.0.1:3128 --proxy-user USER_NAME:USER_PASSWORD https://SOME_HTTPS_WEBSITE

# Access a website without user authentication.
# This should not work.
curl --proxy http://127.0.0.1:3128 https://SOME_HTTPS_WEBSITE
```