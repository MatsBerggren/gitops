# gitops (skelett, moderniserat)

Detta repo är ett GitOps-skelett för Argo CD i ett HomeLab.

## Snabbstart
```bash
kubectl apply -k clusters/homelab/bootstrap/argocd
kubectl apply -f clusters/homelab/bootstrap/root-app.yaml
```
## Vad som ingår
- Officiella Argo CD-manifester (pinnad) i samma kustomization
- Ingress för argocd-server (`argocd.support4u.se`) + cert-manager annotation (`letsencrypt-dns`)
- **Modern Kustomize**: `patches:` med explicita `target` (inga `patchesJson6902`/`patchesStrategicMerge`)
- Dex initContainer härdad (`copyutil` får köra /bin/cp)
- JSON6902-patch tar bort ev. oavsiktligt `command` på `argocd-redis`
- AppProject + ApplicationSet + tre appar (home-assistant, zigbee2mqtt, mosquitto)
- Makefile + scripts/check_redis_command.sh

## Anpassa
- Byt `repoURL` i `root-app.yaml` och `appset.yaml` till ditt GitHub-repo.
- Uppdatera domäner, lagring och Z2M-config i respektive overlay.
