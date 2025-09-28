# WordPress on k3s (Kustomize) — base-first

## Storage (in base)
- **MariaDB** → `storageClassName: ceph01` (Ceph RBD, RWO)
- **wp-content** → `storageClassName: cephfs` (CephFS, RWX)

## Probes & startup
- `startupProbe` prevents early liveness/readiness failures.
- InitContainer waits for MariaDB DNS + TCP health.

## Ingress
- Host: `wordpress.support4u.se`
- Annotation: `cert-manager.io/cluster-issuer: letsencrypt-dns`

## Layout
- `base/` — everything needed out of the box (storage included)
- `overlays/homelab/` — optional future tweaks (e.g., host/issuer/resources)

## Apply
```bash
# 1) Edit base/secret-mariadb.yaml (passwords)
# 2) Deploy
kubectl apply -k base
# or, if you prefer to keep using overlays:
kubectl apply -k overlays/homelab
```


## Storage classes in this cluster
Detected (from your output): `longhorn` and `local-path`.
- Base now uses **longhorn**:
  - MariaDB: RWO on `longhorn`
  - wp-content: RWX on `longhorn` (uses Longhorn share-manager)
- If you want pure local disks, use overlay:
  ```bash
  kubectl apply -k overlays/local-path
  ```
