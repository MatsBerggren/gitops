#!/usr/bin/env bash
set -euo pipefail
echo "[i] Rullar om Argo application controller..."
kubectl -n argocd rollout restart statefulset/argocd-application-controller || true
echo "[i] Hård refresh på vanliga appar..."
for app in root-homelab homeassistant zigbee2mqtt mosquitto; do
  kubectl -n argocd annotate application $app argocd.argoproj.io/refresh=hard --overwrite || true
done
echo "[✓] Klart."
