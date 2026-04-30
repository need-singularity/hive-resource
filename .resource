# hive-resource/.resource — runtime resource SSOT (raw-format DSL).
#
# This is a TEMPLATE. After `hx install need-singularity/hive-resource`,
# edit this file with your own host inventory: replace the example
# resource blocks below with actual SSH aliases, remote homes, repo paths,
# and capability tags that match your environment.
#
# Schema reference: docs/formats/resource.md (in the hive monorepo).
#
# Each `resource <N> <state> "<desc>"` block declares one host. Required fields:
#   slug                  unique identifier (kebab-case)
#   kind                  host
#   ssh-alias             SSH alias resolvable via your ~/.ssh/config
#   remote-home           remote $HOME path
#   capabilities          csv tags consumed by the scorer
#   memory-budget         GiB (rough RAM available to dispatched workloads)
#   cpu-budget            cores
#   container             default docker container name
#   container-memory-cap  GiB hard cap for container --memory
#   scoring-weight        relative weight for the LB pick algorithm
#   why                   one-line rationale
#
# Optional fields:
#   repo-path-<repo>      path to a synced repo on the remote host
#   hx-packages-prefix    path to ~/.hx/packages on the remote
#
# Set `state` to `live` to make the resource pickable; `deferred` to hide
# it from the pool while keeping the declaration.

resource 0 deferred "example remote host A — edit with your own host"
  slug host-example-a
  kind host
  ssh-alias example-a
  remote-home /home/<user>
  capabilities cpu,linux
  memory-budget 16
  cpu-budget 4
  container hive-exec
  container-memory-cap 12
  scoring-weight 1.0
  why example placeholder — replace with your actual host

resource 1 deferred "example remote host B — edit with your own host"
  slug host-example-b
  kind host
  ssh-alias example-b
  remote-home /home/<user>
  capabilities gpu,linux
  memory-budget 30
  cpu-budget 8
  container hive-exec
  container-memory-cap 24
  scoring-weight 0.8
  why example placeholder — replace with your actual host
