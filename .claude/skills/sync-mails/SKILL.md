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

1. **Traer contactos** del CRM (`Email`) con estado activo (En secuencia, Respondió, Call agendada, Call hecha, Cotizando, Cliente), más los `Nuevo`. Ojo: hay mails con errores heredados del CRM viejo (ej: prefijo 'don'); si un mail rebota o no matchea, avisalo.
2. **Buscar en Gmail** mails enviados a / recibidos de esos mails en el período (en las cuentas de `config.md`). Agrupar por hilo.
3. **Clasificar** cada hilo y aplicar (regla 4 de CLAUDE.md: estos cambios se aplican directo):

| Detectado | Cambios en 👅 CRM Outreach — Nuevo |
|---|---|
| Le escribimos (sin respuesta) | `Fecha último contacto` = fecha del mail. `Último mail` = Mail N (contar mails nuestros en el hilo). Si estaba `Nuevo` → `En secuencia`. Próxima acción = "Mail N+1", fecha = +7 días |
| Respondió | Estado → `Respondió`. `Fecha último contacto`. Resumen de 1–2 líneas en Notas. Próxima acción según el contenido |
| Se agenda call | Estado → `Call agendada`. `Fecha de Call`. Próxima acción = "Call", fecha = día de la call. Ofrecer crear el evento en Calendar |
| Pasó la call (hay mail posterior) | Estado → `Call hecha` |
| Pide presupuesto / manda brief | Estado → `Cotizando`. Próxima acción = "Armar presupuesto". Sugerir `nuevo_proyecto` |
| Responde a un presupuesto | Actualizar 📝 Historial (`Seleccionar`: `A confirmar` / `A realizar` / `Perdido`). Si aprueba → lead `Cliente` y proyecto `GANADO` (confirmar montos antes) |
| Rechaza / no le interesa | Estado → `Descartado`. Motivo en Notas |
| Mail 5 sin respuesta | Estado → `Dormido`. Próxima acción = "Recontactar", fecha = +90 días |
| Fuera de oficina / rebote | Solo nota. Rebote → avisar que el mail es inválido |

   - Nunca retroceder un estado (ej: no pasar de `Call agendada` a `Respondió`) salvo a `Descartado`/`Dormido`.
   - Regla de oro: ningún lead activo queda con `Fecha próxima acción` vacía.
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
