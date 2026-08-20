# MCP: Confluence (через VPN)

Репозиторий с конфигурацией MCP-сервера для работы с внутренним Confluence (`confluence.istock.info`).

Связанный проект: [miniapp-bff](https://gitlab.istock.info/istock-link/miniapp-bff) — BFF для miniapp, который тоже находится во внутренней сети.

## Важно: нужен VPN

Confluence, GitLab (`gitlab.istock.info`) и `miniapp-bff` доступны **только из корпоративной VPN**. Без подключения к VPN MCP не сможет достучаться до API.

| Среда | VPN |
|---|---|
| **Cursor Desktop** (локально) | Подключите VPN на своей машине перед использованием MCP |
| **Cloud Agents** | Нужен VPN-доступ из облачной среды (обычно не настроен по умолчанию) |

## Что настроено

- `.cursor/mcp.json` — MCP-сервер `confluence` на базе [`mcp-atlassian`](https://github.com/sooperset/mcp-atlassian)
- `.cursor/environment.json` — зависимость от `miniapp-bff` и установка `uv` + `mcp-atlassian` для Cloud Agents
- `scripts/install-confluence-mcp.sh` — скрипт установки зависимостей

## Быстрый старт (Cursor Desktop)

1. **Подключите VPN.**

2. Скопируйте `.env.example` в `.env` и заполните значения:

```bash
cp .env.example .env
```

3. Укажите переменные:

| Переменная | Описание |
|---|---|
| `CONFLUENCE_URL` | URL Confluence, например `https://confluence.istock.info` |
| `CONFLUENCE_API_TOKEN` | PAT / API token для Confluence |
| `CONFLUENCE_SSL_VERIFY` | `true` (по умолчанию) или `false` для self-signed |
| `CONFLUENCE_SPACES_FILTER` | Опционально: список space keys через запятую |

4. Перезапустите Cursor или перезагрузите MCP в **Customize → MCP**.

## Cloud Agents

Cloud Agents по умолчанию **не имеют доступа** к внутренней VPN-сети. Для работы MCP в облаке нужно:

1. Настроить VPN-доступ для Cloud Agent environment (или использовать только локальный Cursor Desktop).
2. Добавить секреты в Dashboard → Environment Secrets:
   - `CONFLUENCE_URL`
   - `CONFLUENCE_API_TOKEN`
3. Зарегистрировать MCP-сервер в **Dashboard → Integrations & MCP**.

## Доступные инструменты MCP

После подключения доступны, в частности:

- `confluence_search` — поиск по CQL
- `confluence_get_page` — чтение страницы
- `confluence_get_page_children` — дочерние страницы
- `confluence_create_page` / `confluence_update_page` — создание и обновление (если токен с правами записи)

## Troubleshooting

- **Timeout / connection refused** — проверьте, что VPN подключён.
- **403 от Confluence** — проверьте `CONFLUENCE_API_TOKEN` и права доступа.
- **Empty reply от GitLab** — нужен VPN + GitLab PAT с доступом к `istock-link/miniapp-bff`.
- **SSL errors** — временно `CONFLUENCE_SSL_VERIFY=false` только для внутренних сертификатов.
