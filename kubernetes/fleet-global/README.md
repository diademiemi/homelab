# ArgoCD

This Fleet project deploys Rancher managed applications and ArgoCD on the downstream clusters.  

I use ArgoCD on downstream clusters instead of fleet for better encryption support. Specifically I use [viaduct-ai/kustomize-sops](https://github.com/viaduct-ai/kustomize-sops) for secret encryption with [age](https://github.com/mozilla/age) encryption keys.  