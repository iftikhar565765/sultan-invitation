# Deploying Sultan

## One-time setup

1. Create a Cloudflare API token with **Edit Cloudflare Workers** and
   **Edit D1** permissions (account → My Profile → API Tokens).
2. In this GitHub repo: **Settings → Secrets and variables → Actions**,
   add two secrets:
   - `CLOUDFLARE_API_TOKEN` — the token from step 1
   - `CLOUDFLARE_ACCOUNT_ID` — your Cloudflare account id
3. Push to `main`. The workflow builds, **creates the D1 database
   automatically**, applies migrations, patches `wrangler.jsonc` with the
   new database id and deploys.
4. The live invitation is at `https://sultan-invitation.<your-subdomain>.workers.dev`.

## Local development

```bash
npm install
npm run build
npm run db:migrate:local
npx wrangler dev --port 8788
```

Local mode stores published invitations in a local D1 database under
`.wrangler/state`.

## Notes

- Until the two secrets exist, pushes stay green and skip deploying.
- `wrangler.jsonc` starts with a placeholder `database_id`; the deploy
  workflow replaces it after the first `d1 create`. Commit that patch so
  later deploys reuse the same database.
