---
name: sync-mails
description: Revisa Gmail (solo lectura) buscando actividad con contactos del CRM de ORIENTE y actualiza Notion (último contacto, estado, notas, próxima acción). Usar con "sync_mails".
argument-hint: "[desde AAAA-MM-DD | contacto]"
---

# sync_mails

Alcance: `$ARGUMENTS` (por defecto: desde el último sync registrado; si no hay, últimos 7 días).

## ⛔ Gmail es SOLO LECTURA
Solo buscar y leer. Nunca enviar, responder, reenviar, crear borradores, archivar, etiquetar ni borrar.

## Pasos

1. **Traer contactos** del CRM (mails) con estado activo, más los `Nuevo`.
2. **Buscar en Gmail** mails enviados a / recibidos de esos mails en el período (en las cuentas de `config.md`). Agrupar por hilo.
3. **Clasificar** cada hilo y aplicar (regla 4 de CLAUDE.md: estos cambios se aplican directo):

| Detectado | Cambios en Notion |
|---|---|
| Le escribimos (sin respuesta) | Último contacto y Fecha de última acción = fecha del mail. Si estaba `Nuevo` → `En secuencia`. Próxima acción = "Seguimiento N", fecha = +7 días |
| Respondió | Estado → `Respondió`. Último contacto = fecha. Resumen de 1–2 líneas en Notas. Próxima acción según el contenido |
| Se agenda reunión | Estado → `Reunión agendada`. Próxima acción = "Reunión", fecha = día de la reunión. Ofrecer crear el evento en Calendar |
| Pide presupuesto / manda brief | Estado → `Brief recibido`. Próxima acción = "Armar presupuesto". Sugerir `nuevo_proyecto` |
| Responde a un presupuesto | Actualizar el Historial de presupuestos (`En revisión` / `Aprobado` / `Rechazado` + motivo). Si aprobado → lead `Ganado` y proyecto `Aprobado` |
| Rechaza / no le interesa | Estado → `No interesado`. Motivo en Notas. Sin próxima acción (o recontacto en 6 meses si dejó la puerta abierta) |
| Fuera de oficina / rebote | Solo nota. Rebote → avisar que el mail es inválido |

   - Nunca retroceder un estado (ej: no pasar de `Reunión agendada` a `Respondió`) salvo rechazo.
   - Notas: `[AAAA-MM-DD · Mr. Oriente · sync_mails] {qué pasó}. Estado: {antes} → {después}.`
4. **Mails de gente que NO está en el CRM** pero parecen comerciales (agencias/marcas respondiendo, briefs): **no crearlos**. Listarlos al final y preguntar si se cargan como leads.
5. **Responder**:

```
📬 sync_mails ({desde} → hoy)

Cambios aplicados
| Empresa | Contacto | Qué pasó | Estado | Próxima acción |

Para revisar
- Posibles leads nuevos: …
- Hilos ambiguos: …
```

6. Dejar registro del sync (fecha) para que el próximo arranque desde ahí (nota en el CRM o en la conversación según lo que esté configurado).
