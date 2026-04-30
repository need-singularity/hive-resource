# hive-resource

Lightweight host-pool resource CLI — SSOT-aware add/remove/list/status/fix
operator for cross-host inventory declared in a single `.resource` DSL file.

## Install

```
hx install need-singularity/hive-resource
```

The package is fully self-contained at `~/.hx/packages/hive-resource/` —
no monorepo checkout required.

## Usage

```
hive-resource list                    # show host pool (reachable + load + mem)
hive-resource status [host]           # detailed health (ssh + remote shim + claude)
hive-resource add <host>              # probe + bootstrap disclosure (raw 91 C3)
hive-resource remove <host>           # disclosure (manual .resource edit required)
hive-resource fix <host>              # remote shim auto-repair playbook
hive-resource oauth-status <host>     # per-slot OAuth health probe
hive-resource oauth-reset <host>      # slot-pool reset disclosure
hive-resource --selftest              # canonical-form self-check (no host I/O)
```

## Configuration

After install, edit `~/.hx/packages/hive-resource/.resource` to declare your
own host inventory. The shipped file is a placeholder template — replace the
example blocks with actual SSH aliases, remote homes, capabilities, and
scoring weights. Keep the resource state `deferred` until the entry is ready
to participate in pool routing, then flip to `live`.

## Path resolution

The shim self-locates the package root via `$0` (POSIX-portable symlink walk),
so it works for any user installing via `hx install need-singularity/hive-resource`
regardless of `$HOME` path layout.

Resolution priority:
1. `$HIVE_RESOURCE_ROOT` env var (explicit override)
2. self-located via `$0` — resolves to `~/.hx/packages/hive-resource` on hx install

## Dependencies

- `hexa` interpreter (`~/.hx/bin/hexa`) — install via `hx install hexa`.

## License

MIT.
