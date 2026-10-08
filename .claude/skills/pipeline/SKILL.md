---
name: pipeline
description: Muestra los leads del CRM de ORIENTE agrupados por estado, con alertas de próximas acciones vencidas y leads sin contacto hace más de 15 días. Usar con "pipeline".
argument-hint: "[filtro opcional: industria, tipo marca/agencia, origen]"
---

# pipeline

Filtro opcional: `$ARGUMENTS`

1. Leer la base Leads/CRM de Notion (aplicar el filtro si hay).
2. Agrupar por estado, en el orden del embudo: Nuevo → En secuencia → Respondió → Call agendada → Call hecha → Cotizando → Cliente. Al final, contados pero sin detalle: Dormido, Descartado y **sin Estado** (alertar estos últimos). En `En secuencia`, mostrar también `Último mail`.
3. Por cada grupo: título con cantidad y una tabla `Empresa | Nombre del Lead | Tipo | Fecha último contacto | Próxima acción | Fecha próxima acción`.
   - ⚠️ en la fila si la próxima acción está vencida.
   - 🧊 si lleva > 15 días sin contacto (en estados activos).
   - ❗ si es activo y `Fecha próxima acción` está vacía (rompe la regla de oro).
   - Si un grupo tiene más de 15 leads, mostrar los 15 más urgentes y "+N más".
4. Cerrar con:
   - Totales: activos, marcas vs. agencias.
   - Conversión simple: % de contactados que respondieron, % de respondidos que llegaron a call, % de calls que pasaron a Cotizando, % de Cotizando que pasaron a Cliente.
   - Top 3 acciones sugeridas.

Solo lectura.
