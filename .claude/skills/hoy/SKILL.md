---
name: hoy
description: Resumen diario de ORIENTE. Agenda del día, próximas acciones del CRM vencidas o de hoy, leads sin contacto hace más de 15 días, presupuestos sin respuesta, cobros vencidos y hitos de proyectos. Usar con "hoy".
---

# hoy

Fecha de hoy: usá la fecha actual del sistema.

Armá el resumen consultando Calendar y Notion (solo lectura). Orden:

```
☀️ Hoy {DD/MM}

📅 Agenda
- {hora} {evento}
(rodajes, entregas y reuniones de hoy y mañana)

🔥 Para hacer hoy
- {Empresa} — {Próxima acción} (vencía {DD/MM}) ⚠️
- {Empresa} — {Próxima acción} (hoy)

🧊 Sin contacto > 15 días
- {Empresa} · {Contacto} — último contacto {DD/MM} · estado {…}

📨 Presupuestos sin respuesta > 7 días
- {Proyecto} V{n} — enviado {DD/MM} · ${monto}

💸 Cobros
- Vencidos > 30 días: {Proyecto} · ${pendiente} · venció {DD/MM}
- Vencen esta semana: …

🎬 Proyectos esta semana
- {Proyecto} — {hito} {DD/MM}
```

- Omití las secciones vacías (no pongas "nada por acá").
- Ordená cada sección por urgencia (lo más vencido primero).
- Al final, una línea con la sugerencia más importante del día.
- Si el último `sync_mails` fue hace más de 1 día (mirá las Notas del CRM), sugerí correrlo.
