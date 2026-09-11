# Configuration results

## 2026-09-12 — local VS Code preparation

- Added macOS archive selection to bootstrap and a project-local Python 3.12 installer.
- Added VS Code command entry points and Chinese setup instructions.
- Selected ChatGPT subscription authentication; credentials stay in ignored local files.
- The standalone download was slow, so this machine reuses its existing Python 3.12.14, Node 24.19.0 and native Codex CLI 0.153.4. The Python environment is local and may read existing bundled packages; new packages install only into the local environment.
- Added native Codex binary support in the wrapper; the npm-based route remains available.
- Existing ChatGPT login is recognized through a local credential-cache link. All three Danus MCP registrations are recognized by Codex.
- Validation complete: `pip check` reports no broken requirements; `danus list` works and has no projects.
- All three MCP servers completed a real initialize/tools-list exchange (gateway: 5 tools, paper: 6 tools, summary: 1 tool). The main gateway does not expose `fact_submit`.
- The local verify service started successfully; its `/health` PID matches its own pidfile. Every `doctor.sh` check passes, including ChatGPT authentication, Python, Node, Codex, LaTeX, and Chrome.
- The report renderer's markdown-it and KaTeX dependencies import successfully.
- VS Code task JSON is valid and the project Python interpreter is selected. Local settings, dependencies and credentials remain ignored.
- Launched `Danus: 启动` in the VS Code terminal and visually confirmed Codex is ready for input in this repository (gpt-5.6-sol, ultra). Disabled Python extension auto-activation for this workspace so it cannot insert shell activation commands into the Codex input box.
- No mathematical project, worker, proof verification request, or model inference has been started. Full mathematical runs and PDF generation have not been exercised.
- Setup source and this result are synchronized on branch `codex-macos-vscode-setup`; the original `codex` branch is unchanged.
