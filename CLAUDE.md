# QBS Products Hub — qbsglobal.net

> Product showcase landing page for QBS Global's 8 SaaS products.
> **URL:** https://qbsglobal.net / https://www.qbsglobal.net
> **Type:** Static HTML/CSS site served via nginx in Docker

---

## TECH STACK

- Static HTML + CSS (no framework, no build step)
- nginx:alpine Docker image
- Deployed via Coolify on Hetzner VPS

---

## VPS DEPLOYMENT (Self-Hosted — Hetzner CX43 via Coolify)

> **Hosting:** Self-hosted on Hetzner CX43 VPS (8 vCPU, 16GB RAM, 160GB SSD)
> **Orchestration:** Coolify v4 — git-based deploy from GitHub, auto-SSL, Docker containers
> **Domain:** qbsglobal.net (Cloudflare DNS active)

### Infrastructure Access

All credentials stored in **1Password** (never hardcode secrets in this file).

| Resource | URL | 1Password Location |
|----------|-----|-------------------|
| **Coolify Dashboard** | https://coolify.qbsglobal.net | QBS Infrastructure → Hetzner VPS CX43 |
| **Supabase Studio** | https://supabase.qbsglobal.net | QBS Infrastructure → Supabase Studio VPS |
| **SSH** | Via 1Password SSH Agent (Touch ID) | QBS Infrastructure → Hetzner VPS CX43 |

**Step-by-Step Deployment via Coolify:**

1. **Push code to GitHub** — create a repo for this project

2. **Deploy in Coolify:**
   - Open https://coolify.qbsglobal.net
   - Click **Add New Resource** → **Application** → **GitHub**
   - Select the repo and branch
   - Set **Build Pack** to Dockerfile
   - Set **Domains** to `qbsglobal.net,www.qbsglobal.net`
   - No environment variables needed (static site)
   - Click **Deploy**

3. **Post-deploy:**
   - Verify at https://qbsglobal.net and https://www.qbsglobal.net
   - Coolify auto-manages SSL via Traefik

**No database, no env vars, no migrations.** This is a static site — the simplest possible deploy.

---

## FILE STRUCTURE

```
index.html    — Main page (product showcase)
styles.css    — All styling
Dockerfile    — nginx:alpine container
CLAUDE.md     — This file
```

---

**Last Updated:** 2026-03-21
