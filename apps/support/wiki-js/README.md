# Wiki.js for homelab

This app adds a simple Wiki.js + PostgreSQL deployment that fits the existing GitOps repo layout.

## Included
- Wiki.js `ghcr.io/requarks/wiki:2`
- PostgreSQL 17 on a StatefulSet
- Ceph RBD PVC for the database
- NGINX Ingress with cert-manager annotation
- ExternalSecret manifests for database and app configuration

## External secrets
This version is prepared for your existing External Secrets + OpenBao pattern.

It expects a `ClusterSecretStore` named `openbao` and the following secret path:

- `homelab/wiki-js/postgres`
  - `POSTGRES_PASSWORD`

The following Kubernetes Secrets are created by External Secrets:
- `wiki-postgres-secret`
- `wiki-secret`

## Important
Update these before syncing:
- `apps/support/wiki-js/overlays/homelab/externalsecrets.yaml`
- `apps/support/wiki-js/overlays/homelab/ingress.yaml`

## Suggested first steps after deploy
1. Open the Wiki.js URL.
2. Complete the initial admin setup.
3. Configure authentication later if you want SSO.
4. Start with a small docs structure (Operations, Kubernetes, Network, Services, Runbooks).
