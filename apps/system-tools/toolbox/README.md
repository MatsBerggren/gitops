# Toolbox: build + GitOps deploy (namespace: system-tools, utan RBAC)

Den här zippen innehåller allt du behöver för att bygga och rulla ut en egen felsökningscontainer.
- **Build**: `docker/Dockerfile`, `Makefile`, GitHub Actions
- **GitOps**: Kustomize base + overlay (`homelab`) under `apps/system-tools/toolbox/deploy`

> Namespace `system-tools` **skapas inte här** – det antas finnas redan.

## Bygg & pusha
```bash
make build print
make push-latest
```

Eller via GitHub Actions (push till `main`).

## Deploy med Kustomize
```bash
kubectl apply -k apps/system-tools/toolbox/deploy/overlays/homelab
kubectl -n system-tools get deploy,pod
kubectl -n system-tools exec -it deploy/toolbox -- bash
```

## Anpassningar
- Byt registry/owner i `Makefile` (`REGISTRY`) och i `kustomization.yaml` (`images:`) om du vill.
- `hostNetwork: true` används i `homelab` overlay för smidigare nätverksfelsökning. Ta bort i prod.
- Kör som root för verktyg som `tcpdump`. Byt gärna säkerhetsprofil i hårdare miljöer.
