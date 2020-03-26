# DOCKER DEV-MACHINE

Below examples must be put inside `configs` folder.

To use openconnect you need to create a `vpnserver.conf` with vpn server inside.

To customize docker configuration `daemon.json`.

vpnserver.conf:
```txt
vpnserver
```

daemon.json:
```json
{
  "graph": "/new/path/docker/root",
  "dns": ["8.8.8.8"],
  "max-concurrent-downloads": 1,
  "max-concurrent-uploads": 1
}
```

For sqldeveloper you need to [download](https://download.oracle.com/otn/java/sqldeveloper/sqldeveloper-19.2.1.247.2212-no-jre.zip),
rename it `sqldeveloper.zip` and put inside `apps` folder.