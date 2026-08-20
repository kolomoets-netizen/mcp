#!/usr/bin/env bash
set -euo pipefail

echo "Installing Confluence MCP dependencies..."

if ! command -v uv >/dev/null 2>&1; then
  curl -LsSf https://astral.sh/uv/install.sh | sh
  export PATH="${HOME}/.local/bin:${PATH}"
fi

uv tool install mcp-atlassian

if [[ -n "${MINIAPP_BFF_REPO_PATH:-}" && -d "${MINIAPP_BFF_REPO_PATH}" ]]; then
  echo "Found miniapp-bff at ${MINIAPP_BFF_REPO_PATH}"
  if [[ -f "${MINIAPP_BFF_REPO_PATH}/package.json" ]]; then
  echo "miniapp-bff package.json detected (no extra install step configured yet)."
  fi
fi

echo "Confluence MCP install complete."
