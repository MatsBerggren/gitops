# WordPress on k3s — homelab (NGINX Ingress)

This package deploys a small WordPress + MariaDB stack via Kustomize for a single environment: **homelab**.

- Hostname: **wordpress.support4u.se**
- Ingress class: **nginx**
- TLS: enabled via cert-manager (issuer: `letsencrypt-dns`)
- Storage:
  - MariaDB: Longhorn (RWO) 5Gi
  - WordPress uploads (wp-content): Longhorn (RWO) 5Gi

> Adjust storageClassName if you don't use Longhorn.

## Apply
```bash
kubectl apply -k overlays/homelab
```

## Update secrets
Edit `base/secret-db.yaml` to change passwords before applying.
For production, consider External Secrets Operator instead of a plain Secret.
