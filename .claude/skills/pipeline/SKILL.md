---
name: pipeline
description: Muestra los leads del CRM de ORIENTE agrupados por estado, con alertas de próximas acciones vencidas y leads sin contacto hace más de 15 días. Usar con "pipeline".
argument-hint: "[filtro opcional: industria, tipo marca/agencia, origen]"
---

# pipeline

Filtro opcional: `$ARGUMENTS`

1. Leer la base Leads/CRM de Notion (aplicar el filtro si hay).
2. Agrupar por estado, en el orden del embudo: Nuevo → En secuencia → Respondió → Reunión agendada → Brief recibido → Presupuesto enviado → Ganado. Al final, contados pero sin detalle: No interesado, Pausado.
3. Por cada grupo: título con cantidad y una tabla `Empresa | Contacto | Tipo | Último contacto | Próxima acción | Fecha`.
   - ⚠️ en la fila si la próxima acción está vencida.
   - 🧊 si lleva > 15 días sin contacto (en estados activos).
   - Si un grupo tiene más de 15 leads, mostrar los 15 más urgentes y "+N más".
4. Cerrar con:
   - Totales: activos, marcas vs. agencias.
   - Conversión simple: % de contactados que respondieron, % de respondidos que llegaron a brief, % de briefs ganados.
   - Top 3 acciones sugeridas.

Solo lectura.
