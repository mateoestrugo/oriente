---
name: reporte-semanal
description: Reporte semanal comercial de ORIENTE. Leads nuevos, contactados, respuestas, reuniones, presupuestos enviados y aprobados, tasa de conversión. Usar con "reporte_semanal".
argument-hint: "[semana: AAAA-MM-DD de inicio]"
---

# reporte_semanal

Semana: `$ARGUMENTS` (por defecto, lunes a domingo de la semana pasada; si hoy es viernes o después, la semana en curso).

Fuentes: Notion (Leads, Proyectos, Historial de presupuestos). Si no se corrió `sync_mails` en las últimas 24 h, sugerilo antes de armar el reporte.

```
📊 Semana {DD/MM}–{DD/MM}

| Métrica                    | Esta semana | Semana anterior |
| Leads nuevos               |             |                 |
| Contactados (1er contacto) |             |                 |
| Seguimientos               |             |                 |
| Respuestas                 |             |                 |
| Reuniones agendadas        |             |                 |
| Briefs recibidos           |             |                 |
| Presupuestos enviados      | n · $…      |                 |
| Presupuestos aprobados     | n · $…      |                 |
| Presupuestos rechazados    | n (motivos) |                 |

Conversión
- Tasa de respuesta: respuestas / contactados
- Contacto → brief
- Presupuestos aprobados / enviados (por cantidad y por monto)

Destacados: (máx. 3 líneas)
Para la semana que viene: (máx. 5 acciones concretas)
```

Calculá las métricas por fechas de Notas/Fecha de última acción y por el Historial de presupuestos. Si un dato no se puede reconstruir con certeza, decilo en vez de estimar. Solo lectura.
