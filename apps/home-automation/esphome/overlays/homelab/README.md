This overlay enables hostNetwork for the esphome Deployment so that mDNS discovery works
across VLANs. It adds:

- hostnetwork-patch.yaml -> sets hostNetwork: true and dnsPolicy: ClusterFirstWithHostNet
- namespace.yaml -> optional namespace with pod-security labels allowing privileged pods

Security note: hostNetwork exposes the node IP to the pod. Review PodSecurity and RBAC before deploying.
