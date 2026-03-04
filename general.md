# Development Environment Rules

## Network Configuration

**ALL apps and services MUST bind to `0.0.0.0`**, never `localhost` or `127.0.0.1`.

Reason: Apps are accessed from another machine on the network via Tailscale.

**Your Tailscale IP:** `100.89.34.114` — use this IP when accessing services.

## Python Projects

**MANDATORY:** Always create and activate a virtualenv for Python apps.

```bash
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

Never install packages globally. Always use the project's virtualenv. 
