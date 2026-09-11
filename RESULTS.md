# Configuration results

## 2026-09-12 — local VS Code preparation

- Added macOS archive selection to bootstrap and a project-local Python 3.12 installer.
- Added VS Code command entry points and Chinese setup instructions.
- Selected ChatGPT subscription authentication; credentials stay in ignored local files.
- The standalone download was slow, so this machine reuses its existing Python 3.12.14, Node 24.19.0 and native Codex CLI 0.153.4. The Python environment is local and may read existing bundled packages; new packages install only into the local environment.
- Added native Codex binary support in the wrapper; the npm-based route remains available.
- Existing ChatGPT login is recognized through a local credential-cache link. All three Danus MCP registrations are recognized by Codex.
- Service and dependency validation is pending. No mathematical job or model invocation has been started.
