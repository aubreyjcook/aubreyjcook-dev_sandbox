# __NAME__

Isolated Node sandbox. Dependencies install into this folder only.

Node 24 and pnpm 10 are pinned in `mise.toml`. There is no root workspace, so run commands here:

```powershell
pnpm install
pnpm start
```

Use `pnpm dlx` when you need a one-off CLI. Do not install Node tools globally. If you add a dev server, set a free port and record it in `PORTS.md`.
