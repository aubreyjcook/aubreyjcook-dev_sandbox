# __NAME__

Isolated PHP sandbox. PHP, Composer, and MySQL run in this compose project (`sandbox-__NAME__`) on network `sandbox-__NAME__-net`. Nothing here is installed on the host.

Default host port is 8090. Change `APP_PORT` if that port is taken, and add the port to `PORTS.md`. The database is not published to the host.

```powershell
docker compose up --build
```

Open `http://localhost:8090`. Composer is on the image:

```powershell
docker compose run --rm --no-deps app composer --version
```
