# 在 Mac 的 VS Code 使用 Danus

在 VS Code 打开 Danus 文件夹，终端使用 Bash 运行以下命令。

如果环境已经配置好，直接跳到“日常启动及检查”。本次配置复用了本机现有的
Python、Node 和 Codex：`runtime/runtime.env` 记录这些本机路径，
`DANUS_CODEX_NATIVE` 可让启动包装器使用现有的 Codex 二进制文件。
若桌面应用更新后移动了这些路径，重新设置路径或执行下方独立安装流程。

独立首次安装（需已有可用的 `python3 -m pip`；Python 3.12、Node 22、Codex 和依赖均位于 `runtime/`）：

```bash
bash scripts/bootstrap-macos.sh
cp -n config/danus.env.example config/danus.env
cp -n config/codex.env.example config/codex.env
```

使用 ChatGPT 订阅时，在 `config/danus.env` 添加 `CODEX_BACKEND=chatgpt`，
然后完成登录：

```bash
bash scripts/vscode.sh login
```

日常启动及检查：

```bash
bash scripts/vscode.sh doctor
bash scripts/vscode.sh start
```

本地启动入口保留 Codex 的工作区沙盒与按需确认。首次运行由 Danus 的
initialize 技能询问研究目标、停止条件与工作规模；明确这些条件后再启动
数学任务。启动入口会开启验证 HTTP 服务，但不会自行创建项目或派发 workers。

退出主会话并不等同于停止已派发的 workers；若已启动研究任务，先让主 agent
停止对应项目，再退出。停止验证服务：

```bash
bash scripts/vscode.sh stop
```

本机 Python、Node 和服务启动已做兼容适配；完整研究运行与论文生成仍需按任务
验证。长期任务可继续使用原有 Linux Codespace。

本机 `.vscode/tasks.json` 提供 `Danus: 登录 ChatGPT`、`Danus: 环境检查`、
`Danus: 启动` 和 `Danus: 停止验证服务`。在菜单 **Terminal → Run Task** 选择即可。
`.vscode/`、`config/*.env` 和 `runtime/` 均不提交；登录凭据也不提交。

参考：[Codex 登录说明](https://learn.chatgpt.com/docs/auth)、
[uv Python 安装说明](https://docs.astral.sh/uv/guides/install-python/)。
