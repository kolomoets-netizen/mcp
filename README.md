# mcp — BA workspace for Cursor Cloud Agents

Репозиторий для работы бизнес-аналитика в Cursor Cloud Agent:

- Agent Skills в `.cursor/skills/`
- MCP документации / Jira / Qase: `https://mcp-qa.istock.link/mcp` (namespace в сессии: `confluience`)

## BA skills

| Skill | Назначение |
|-------|------------|
| `acceptance-criteria-writer` | Критерии приёмки |
| `ambiguity-hunter` | Неоднозначности |
| `requirements-quality-check` | Готовность требований |
| `edge-case-elicitor` | Граничные сценарии |
| `impact-assessment` | Влияние изменений |
| `gap-analysis` | As-is / to-be |
| `user-story-templates` | User story, INVEST, split |

Вызов: `/acceptance-criteria-writer` или формулировка вроде «напиши критерии приёмки».

Подробнее: [`.cursor/skills/README.md`](.cursor/skills/README.md)

## MCP (документация)

Сервер: `https://mcp-qa.istock.link/mcp`

Для Cloud Agent включите MCP на [cursor.com/agents](https://cursor.com/agents) через **`+` → MCP Servers → Add MCP** (HTTP URL выше).

Полезные tools: `confluence_search`, `jira_get_issue`, `build_requirement_context`, `review_story`.
