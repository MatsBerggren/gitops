# WordPress on k3s (Kustomize) — fixed

## What’s inside
- MariaDB (StatefulSet) with **tcpSocket** startup/readiness/liveness probes
- WordPress (Deployment) with **initContainer** waiting for DB using **app-user SELECT 1**
- Storage: **longhorn** in base
  - MariaDB PVC: RWO on `longhorn`
  - wp-content PVC: **RWX** on `longhorn` (share-manager)
- Ingress prefilled for `wordpress.support4u.se`

## Apply
```bash
# edit base/secret-mariadb.yaml to set passwords first
kubectl apply -k base
# or
kubectl apply -k overlays/homelab
```

## Optional overlay
- `overlays/local-path`: uses `local-path` for both MariaDB and wp-content (RWO).
  ```bash
  kubectl apply -k overlays/local-path
  ```

## Notes
- If your Longhorn setup doesn’t have RWX enabled, change wp-content PVC to ReadWriteOnce or use the `local-path` overlay.
- Probes and init are tuned to avoid early restarts and to wait for DB correctly.
