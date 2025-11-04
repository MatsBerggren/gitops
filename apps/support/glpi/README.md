# GLPI via Kustomize (homelab)

Denna katalog innehåller Kustomize-manifester för att köra GLPI + MySQL i ett privat homelab-kluster.

Struktur:
- `base/` — generella resurser (GLPI, MySQL, PVC:er, hemligheter)
- `overlays/homelab/` — overlay för ditt homelab (namespace, ingress, repliker, etc.)

## Snabbstart (kubectl)

```bash
# Skapa namespace och deploya allt
kubectl apply -k overlays/homelab
```

Därefter öppnar du GLPI i webbläsaren på:
- http(s)://glpi.homelab.local

Glöm inte att:
- Uppdatera lösenord i `base/secrets.yaml`
- Justera `storageClassName` i `pvc-glpi.yaml` (t.ex. shared-nfs) vid behov
- Säkerställa att din ingress-controller och ev. cert-manager är korrekt konfigurerade
