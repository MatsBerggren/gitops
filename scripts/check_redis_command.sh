#!/usr/bin/env bash
set -euo pipefail
ns="${1:-argocd}"
dep="argocd-redis"
cmd_jsonpath='{.spec.template.spec.containers[0].command}'
current=$(kubectl -n "${ns}" get deploy "${dep}" -o jsonpath="${cmd_jsonpath}" 2>/dev/null || true)
if [[ -n "${current}" ]]; then
  echo "ERROR: ${dep} has an explicit 'command' set: ${current}"
  echo "This should be removed to let the image entrypoint run redis-server."
  exit 1
fi
echo "OK: ${dep} has no explicit 'command' (good)."
