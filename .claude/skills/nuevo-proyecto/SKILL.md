---
name: nuevo-proyecto
description: Crea un proyecto nuevo de ORIENTE. Carpeta en Drive con subcarpetas, copia de plantillas (presupuesto, carta de venta y opcionales) y registro en Notion. Usar con "nuevo_proyecto {NOMBRE} [+tratamiento] [+callsheet] [+plan_rodaje] [+contrato]".
argument-hint: "{NOMBRE} [+tratamiento] [+callsheet] [+plan_rodaje] [+contrato]"
---

# nuevo_proyecto

Argumentos: `$ARGUMENTS`

Leé antes `contexto/google.md` (estructura de carpetas) y `contexto/config.md` (IDs de carpeta raíz, plantillas y base Proyectos).

## Pasos

1. **Parsear**: el NOMBRE es todo lo que no empieza con `+`. Flags posibles: `+tratamiento`, `+callsheet`, `+plan_rodaje`, `+timing`, `+contrato`, `+blanco` (carta de venta blanca en vez de negra). Si no hay nombre, pedilo.
2. **Chequear config**: si falta el ID de la carpeta raíz, de la base Proyectos o de alguna plantilla que haya que copiar, pedilo y frená.
3. **Evitar duplicados**: buscá en Drive (carpeta raíz) y en Notion (Proyectos) si ya existe un proyecto con ese nombre. Si existe, mostralo con links y preguntá si seguir con otro nombre.
4. **Preguntar en un solo mensaje** los datos que no tengas (se pueden dejar vacíos): cliente, agencia (si aplica), lead del CRM asociado. No frenes la creación de carpetas por esto.
5. **Drive**:
   - Crear `{NOMBRE}` dentro de la carpeta raíz.
   - Crear subcarpetas: `01 Presupuesto`, `02 Carta de venta`, `03 Tratamiento`, `04 Call sheet`, `05 Entregables`, `06 Facturas`.
   - Copiar plantillas:
     - Presupuesto → `01 Presupuesto/Presupuesto - {NOMBRE}` (siempre)
     - Carta de venta → `02 Carta de venta/Carta de venta - {NOMBRE}` (siempre)
     - `+tratamiento` → `03 Tratamiento/Tratamiento - {NOMBRE}`
     - `+callsheet` → `04 Call sheet/Call sheet - {NOMBRE}`
     - `+plan_rodaje` → `04 Call sheet/Plan de rodaje - {NOMBRE}`
     - `+timing` → `04 Call sheet/Timing - {NOMBRE}`
     - `+contrato` → `02 Carta de venta/Contrato - {NOMBRE}`
   - Si la plantilla tiene un campo de nombre de proyecto/cliente/fecha visible, completalo. No toques montos.
6. **Notion → 🌶️ PROYECTOS**: re-fetch del esquema y crear el registro con la plantilla "CLIENT - " si aplica. `Nombre del proyecto` en MAYÚSCULAS, Estado = `Presupuestando`, `PAGO` = `NO PAGO`. `Fecha de presupuesto` = hoy. Completar `Cliente (marca)`, `Agencia`, `Carpeta Drive` y `Monto presupuestado` si ya se sabe; el link al Sheet del presupuesto va en el cuerpo de la página. Dejar en el cuerpo: `[AAAA-MM-DD · Mr. Oriente] Proyecto creado con nuevo_proyecto`.
7. **Lead asociado** (si hay, en 👅 CRM): si estaba antes de `Cotizando`, pasarlo a `Cotizando` y dejar registro en Notas.
8. **📝 Historial de Presupuestos**: no crear fila todavía; se crea cuando se envía el presupuesto (preguntar monto).
9. **Responder**:

```
✅ Proyecto {NOMBRE} creado

📁 Carpeta: {link}
📊 Presupuesto: {link}
📄 Carta de venta: {link}
[🎨 Tratamiento / 📋 Call sheet / 🗓 Plan de rodaje / ✍️ Contrato: {link}]
🗂 Notion: {link}

Pendiente: {datos que faltaron, si hay}
```

Si algún paso falla, decí exactamente cuál y qué quedó creado. Nunca borres lo creado para "reintentar".
