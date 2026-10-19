# Ports

Host ports are assigned per project so more than one sandbox can run at the same time. If you add a server, pick a free port and add a row here.

Laravel and WordPress keep their databases on a private compose network. `db/postgres` and `db/mysql` publish their own host ports. No project shares a database volume or network with another.

| Project | Service | Host port |
| --- | --- | --- |
| `js/next-app` | Next.js | 3000 |
| `js/nest-api` | Nest | 3001 |
| `js/graphql-api` | GraphQL | 4000 |
| `db/postgres` | PostgreSQL | 5432 |
| `db/mysql` | MySQL | 3306 |
| `db/sqlite` | SQLite file | none |
| `js/angular-app` | Angular | 4200 |
| `js/react-app` | Vite | 5173 |
| `js/vue-app` | Vite | 5174 |
| `css/tailwind-playground` | Vite | 5175 |
| `php/laravel-app` | PHP | 8000 |
| `php/wordpress-site` | Apache | 8080 |
| `css/plain` | static files | none |
| `rust/hello` | CLI | none |
| `cpp/hello` | CLI | none |
| `asm/x86-nasm` | CLI in Docker | none |
| `asm/arm64` | CLI in Docker | none |
| `asm/wasm-wat` | CLI in Docker | none |

The scaffold template for a new CSS app defaults to port 5199, and the PHP template defaults to port 8090, so a new project does not take a port already listed above. Change that default before you rely on it, and record the final port in this file.
