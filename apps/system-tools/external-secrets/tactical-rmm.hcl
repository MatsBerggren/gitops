# Tillåt UI-preflight på KV-mounten "homelab"
path "sys/internal/ui/mounts/homelab" {
  capabilities = ["read"]
}
path "sys/internal/ui/mounts/homelab/*" {
  capabilities = ["read"]
}
# KV v2: data-path för write/read
path "homelab/data/kv/tactical-rmm/*" {
  capabilities = ["create","update","read","list"]
}
# KV v2: metadata-path för list mm.
path "homelab/metadata/kv/tactical-rmm/*" {
  capabilities = ["read","list"]
}
