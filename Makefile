SHELL := /usr/bin/env bash

.PHONY: install-argocd validate check-redis

install-argocd:
	kubectl apply -k clusters/homelab/bootstrap/argocd

validate:
	kustomize build clusters/homelab/bootstrap/argocd >/dev/null

check-redis:
	scripts/check_redis_command.sh argocd
