# MCP: Confluence через miniapp-bff

Репозиторий с конфигурацией MCP-сервера для работы с Confluence через прокси [miniapp-bff](https://gitlab.istock.info/istock-link/miniapp-bff).

## Что настроено

- `.cursor/mcp.json` — MCP-сервер `confluence` на базе [`mcp-atlassian`](https://github.com/sooperset/mcp-atlassian)
- `.cursor/environment.json` — зависимость от `miniapp-bff` и установка `uv` + `mcp-atlassian` для Cloud Agents
- `scripts/install-confluence-mcp.sh` — скрипт установки зависимостей

Confluence доступен через внутренний прокси `miniapp-bff`, поэтому в MCP указывается **URL прокси**, а не прямой адрес `confluence.istock.info`.

## Быстрый старт (Cursor Desktop)

1. Скопируйте `.env.example` в `.env` и заполните значения:

```bash
cp .env.example .env
```

2. Укажите переменные:

| Переменная | Описание |
|---|---|
| `CONFLUENCE_BFF_URL` | Базовый URL Confluence API через miniapp-bff |
| `CONFLUENCE_API_TOKEN` | PAT / API token для Confluence |
| `CONFLUENCE_SSL_VERIFY` | `true` (по умолчанию) или `false` для self-signed |
| `CONFLUENCE_SPACES_FILTER` | Опционально: список space keys через запятую |

3. Перезапустите Cursor или перезагрузите MCP в **Customize → MCP**.

## Cloud Agents

1. Добавьте секреты в Dashboard → Environment Secrets:
   - `CONFLUENCE_BFF_URL`
   - `CONFLUENCE_API_TOKEN`
2. Зарегистрируйте MCP-сервер в **Dashboard → Integrations & MCP** (те же параметры, что в `.cursor/mcp.json`).
3. Убедитесь, что Cloud Agent имеет доступ к GitLab-репозиторию `gitlab.istock.info/istock-link/miniapp-bff`.

## Где взять `CONFLUENCE_BFF_URL`

Точный путь зависит от реализации в `miniapp-bff`. Обычно это один из вариантов:

- `https://<bff-host>/api/confluence`
- `https://<bff-host>/proxy/confluence`
- `https://<bff-host>/confluence`

Проверьте README или OpenAPI/Swagger в репозитории miniapp-bff.

## Доступные инструменты MCP

После подключения доступны, в частности:

- `confluence_search` — поиск по CQL
- `confluence_get_page` — чтение страницы
- `confluence_get_page_children` — дочерние страницы
- `confluence_create_page` / `confluence_update_page` — создание и обновление (если токен с правами записи)

## Troubleshooting

- **403 / Empty reply от GitLab** — нужен GitLab PAT с доступом к `istock-link/miniapp-bff`.
- **MCP не видит Confluence** — проверьте `CONFLUENCE_BFF_URL` (должен указывать на API прокси, не на UI).
- **SSL errors** — временно `CONFLUENCE_SSL_VERIFY=false` только для внутренних сертификатов.
