# Mr. Oriente

Asistente interno de **ORIENTE** (productora audiovisual, Buenos Aires). Corre sobre Claude Code: la identidad y las reglas viven en `CLAUDE.md`, cada comando es una skill en `.claude/skills/`.

## Cómo usarlo
1. Abrí Claude Code en esta carpeta (terminal, app de escritorio o claude.ai/code con este repo).
2. Conectá los conectores: **Notion, Gmail, Google Drive (Sheets/Docs/Slides), Google Calendar, Lusha**.
3. Completá los `[COMPLETAR]` de `contexto/config.md` (IDs de bases de Notion, carpeta raíz de Drive, plantillas, planilla de Ganancias, calendarios).
4. Hablale normalmente o usá los comandos:

```
hoy
pipeline
estado Nespresso
nuevo_proyecto Nespresso Navidad +tratamiento
cerrar_proyecto Nespresso Navidad
facturacion octubre
facturacion 2026
sync_mails
reporte_semanal
reporte_mensual
```

(También funcionan como slash commands: `/nuevo-proyecto`, `/sync-mails`, etc.)

## Estructura
```
CLAUDE.md                 ← quién es Mr. Oriente, reglas y comandos
contexto/
  oriente.md              ← la productora y los socios
  flujo-comercial.md      ← prospección, outreach, brief, cierre
  presupuesto.md          ← rubros, cálculo y verificación
  notion.md               ← campos y estados de las 4 bases
  google.md               ← Drive, planilla Ganancias, Calendar, Gmail
  config.md               ← IDs y links (a completar)
.claude/
  skills/                 ← un comando por carpeta
  hooks/guardrails.sh     ← bloqueo duro: Gmail solo lectura, nada se borra
  settings.json           ← activa el hook
```

## Reglas de seguridad
- **Gmail es solo lectura.** Además de la instrucción en `CLAUDE.md`, el hook `guardrails.sh` bloquea cualquier herramienta de Gmail que envíe, responda, cree borradores, archive, etiquete o borre.
- **Nada se borra** en Notion, Drive, Sheets ni Calendar (también bloqueado por el hook).
- Leads nuevos, cambios de montos y cargas a Ganancias requieren confirmación.

## Pendientes (para definir)
- [ ] Links de plantillas y cuáles se usan (`contexto/config.md`)
- [ ] Numeración final de subcarpetas de proyecto (`contexto/google.md`)
- [ ] Confirmar base del Mark Up (sobre costos o costos + imprevistos) (`contexto/presupuesto.md`)
- [ ] Ajustar estados de Leads y Proyectos a los reales de Notion (`contexto/notion.md`)
- [ ] Cadencia de seguimientos (`contexto/flujo-comercial.md`)
- [ ] Detalle de cada sección marcada "DESPUÉS ENTRAMOS EN MÁS DETALLE"
