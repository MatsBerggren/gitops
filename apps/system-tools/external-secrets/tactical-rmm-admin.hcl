# tactical-rmm-admin.hcl
path "sys/internal/ui/mounts/*"  { capabilities = ["read"] }
path "sys/mounts"                { capabilities = ["read"] }
path "sys/mounts/*"              { capabilities = ["read"] }

path "homelab"    { capabilities = ["read","list"] }
path "homelab/*"  { capabilities = ["read","list"] }

# KV v2 data (skriv/läs/lista/radera)
path "homelab/data/kv/tactical-rmm/*"     { capabilities = ["create","update","read","list","delete"] }
# KV v2 metadata (läs/lista/radera versioner)
path "homelab/metadata/kv/tactical-rmm/*" { capabilities = ["read","list","delete"] }
