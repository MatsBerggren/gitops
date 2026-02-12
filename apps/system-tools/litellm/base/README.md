# LiteLLM (GitOps)

This app intentionally does **NOT** store secrets in git.

## Required secret

Create in `litellm` namespace:

- `litellm-secrets` with key `LITELLM_MASTER_KEY`
- optional `OPENAI_API_KEY` (only if you want fallback to OpenAI)

Example:

```bash
kubectl -n litellm create secret generic litellm-secrets \
  --from-literal=LITELLM_MASTER_KEY="$(openssl rand -hex 32)"

# Optional
kubectl -n litellm patch secret litellm-secrets \
  --type merge -p '{"stringData":{"OPENAI_API_KEY":"sk-..."}}'
```
