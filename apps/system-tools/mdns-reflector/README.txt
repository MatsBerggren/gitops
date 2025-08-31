mDNS Reflector (Avahi) for K3s - Alternative image
--------------------------------------------------
This variant avoids lscr.io / ghcr.io and uses Alpine + apk to install avahi/dbus
at container start. Useful when pulling linuxserver/avahi fails (403/ratelimit).

Key points:
- hostNetwork: true, dnsPolicy: ClusterFirstWithHostNet
- NET_RAW capability
- Runs dbus-daemon --system and avahi-daemon in foreground
- Same ConfigMap-driven avahi-daemon.conf
- Overlays identical; only image+command differ

Apply:
  kubectl apply -k apps/network/mdns-reflector/overlays/homelab

Edit interfaces in overlays/homelab/patch-interfaces.yaml:
  allow-interfaces=bond0.72,bond0.60 (example)
