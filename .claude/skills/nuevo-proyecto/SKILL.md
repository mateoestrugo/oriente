---
name: nuevo-proyecto
description: Crea un proyecto nuevo de ORIENTE. Carpeta en Drive con subcarpetas, copia de plantillas (presupuesto, carta de venta y opcionales) y registro en Notion. Usar con "nuevo_proyecto {NOMBRE} [+tratamiento] [+callsheet] [+plan_rodaje] [+contrato]".
argument-hint: "{NOMBRE} [+tratamiento] [+callsheet] [+plan_rodaje] [+contrato]"
---

# nuevo_proyecto

Argumentos: `$ARGUMENTS`

Leé antes `contexto/google.md` (estructura de carpetas) y `contexto/config.md` (IDs de carpeta raíz, plantillas y base Proyectos).

## Pasos

1. **Parsear**: el NOMBRE es todo lo que no empieza con `+`. Flags posibles: `+tratamiento`, `+callsheet`, `+plan_rodaje`, `+contrato`. Si no hay nombre, pedilo.
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
     - `+contrato` → `02 Carta de venta/Contrato - {NOMBRE}`
   - Si la plantilla tiene un campo de nombre de proyecto/cliente/fecha visible, completalo. No toques montos.
6. **Notion → Proyectos**: crear el registro con Nombre, Cliente, Agencia, Estado = `Presupuestando`, Carpeta Drive, Presupuesto (link al Sheet), Estado de cobro = `Sin facturar`, Notas = `[AAAA-MM-DD · Mr. Oriente] Proyecto creado con nuevo_proyecto`.
7. **Lead asociado** (si hay): si estaba antes de `Brief recibido`, pasarlo a `Brief recibido` y dejar registro en Notas.
8. **Responder**:

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
