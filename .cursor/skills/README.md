# BA skills (iStock)

Установленные Agent Skills для работы бизнес-аналитика.

| Skill | Источник | Назначение |
|-------|----------|------------|
| `acceptance-criteria-writer` | [45ck/business-analysis-skills](https://github.com/45ck/business-analysis-skills) | Критерии приёмки |
| `ambiguity-hunter` | 45ck | Неоднозначности в требованиях |
| `requirements-quality-check` | 45ck | Проверка готовности требований |
| `edge-case-elicitor` | 45ck | Граничные и негативные сценарии |
| `impact-assessment` | [qa-aman/claude-skills](https://github.com/qa-aman/claude-skills) | Влияние изменений |
| `gap-analysis` | qa-aman | As-is / to-be, пробелы |
| `user-story-templates` | [slgoodrich/agents](https://github.com/slgoodrich/agents) | User story, INVEST, split |

## Как вызывать

В чате Agent:

- `/acceptance-criteria-writer` или «напиши критерии приёмки»
- `/ambiguity-hunter` или «найди неоднозначности»
- `/requirements-quality-check` или «проверь готовность критериев»
- `/edge-case-elicitor` или «добавь edge cases»
- `/impact-assessment` или «что затронет изменение»
- `/gap-analysis` или «as-is to-be»
- `/user-story-templates` или «оформи user story»

## Формат iStock (контекст для агента)

При написании AC для iStock.Link по умолчанию:

- стиль: «Если …, то …» (таблицы критериев с номерами AC-XX-YY);
- RU + EN для пользовательских текстов/нотификаций при необходимости;
- ссылки на макеты отдельным блоком, без дублирования одной ссылки в каждой строке;
- не выдумывать требования — опираться на Story / Confluence / уточнения BA.
