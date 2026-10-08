# Notion — bases de datos (estructura REAL)

Todo vive en la página **ORIENTE | Dashboard**. IDs en `config.md`.
Usá **exactamente** estos nombres de propiedad y opciones. Si encontrás un campo nuevo en Notion, mandá Notion: adaptate y avisá.

> 🆕 = campo aprobado que todavía no existe en Notion. ⏳ = campo existente que hay que renombrar o cambiarle el tipo. Antes de escribir, re-fetch del esquema: si el campo todavía no está, dejá el dato en el cuerpo de la página o en Notas.

---

## 1. 👅 CRM Outreach — Nuevo  (Leads)
`collection://7492fc7d-8249-40e2-950b-a32146e85b7b`

| Propiedad | Tipo | Uso |
|---|---|---|
| Nombre del Lead | título | Nombre y apellido del contacto |
| Email | email | **Clave para cruzar con Gmail** |
| Empresa | texto | |
| Cargo | texto | ⏳ falta crearlo en Notion |
| Estado | select | ver abajo |
| Último mail | select | `Mail 1`…`Mail 5` → paso de la secuencia en el que está |
| Fecha último contacto | fecha | Último contacto de cualquiera de las dos partes |
| Próxima acción | texto | |
| Fecha próxima acción | fecha | **Regla de oro: nunca vacía (salvo Descartado)** |
| Notas | texto | Log `[AAAA-MM-DD · autor] ...` (lo más nuevo arriba) |
| Fecha de Call | fecha | |
| Rubro | select | Indumentaria, Eventos, Automotriz, Bebidas y Alimentacion, Electro, Beauty, Otros |
| Tipo | select | `Agencia` / `Marca` |

(LinkedIn existe en Notion pero no se usa.)

### Estados (en orden de embudo)
| Estado | Cuándo |
|---|---|
| Nuevo | Cargado, sin contactar |
| En secuencia | Le escribimos, sin respuesta (ver `Último mail` para saber en qué paso) |
| Respondió | Contestó, sin acción concreta todavía |
| Call agendada | Hay call confirmada (completar `Fecha de Call`) |
| Call hecha | Ya tuvimos la call |
| Cotizando | Nos pasó brief / estamos presupuestando |
| Cliente | Aprobó al menos un proyecto |
| Dormido | Sin respuesta tras la secuencia; recontactar más adelante |
| Descartado | No interesado / dato inválido |

**Activos** (para alertas de 15 días): En secuencia, Respondió, Call agendada, Call hecha, Cotizando.
**Alertas extra**: leads sin Estado; leads activos con `Fecha próxima acción` vacía (rompe la regla de oro).

### Transiciones desde Gmail (`sync_mails`)
| Detectado | Estado | Otros campos |
|---|---|---|
| Mandamos mail | Nuevo → En secuencia | `Último mail` +1, `Fecha último contacto`, próxima acción = siguiente mail a +7 días |
| Respondió | → Respondió | resumen en Notas |
| Se agenda call | → Call agendada | `Fecha de Call` |
| Pide presupuesto / brief | → Cotizando | sugerir `nuevo_proyecto` |
| Aprobó | → Cliente | |
| Rechaza | → Descartado | motivo en Notas |
| Mail 5 sin respuesta | → Dormido | próxima acción = recontacto a 90 días |

Nunca retroceder un estado salvo a Descartado/Dormido.

---

## 2. 🌶️ PROYECTOS
`collection://299e758f-7136-8017-8d7d-000b918e81e0`  · plantilla de página por defecto: "CLIENT - "

| Propiedad | Tipo | Uso |
|---|---|---|
| Nombre del proyecto | título | En MAYÚSCULAS, como los existentes (ej: `CHOCOLINAS`) |
| Estado | status | `Sin empezar`, `Presupuestando`, `GANADO`, `PERDIDO`, `CERRADO` |
| Prioridad | select | Alta / Media / Baja |
| Responsable | persona | |
| Fecha de presupuesto | fecha | ⏳ hoy se llama `Deadline` en Notion → renombrar |
| Fecha  | fecha | (el nombre tiene un espacio al final: `"Fecha "`) — fecha de rodaje |
| PAGO | select | `PAGADO` / `NO PAGO` |
| Entregas | archivos | |
| Archivos y multimedia | archivos | |
| Producción | relación → PRODUCCIÓN | |
| 🆕 Cliente (marca) | texto | |
| 🆕 Agencia | texto | |
| 🆕 Carpeta Drive | url | Ahí vive el presupuesto (`01 Presupuesto/`) |
| 🆕 Monto presupuestado | número | |
| 🆕 Ganancia | número | |
| 🆕 Fecha de factura | fecha | |
| 🆕 Vencimiento de cobro | fecha | |

(La propiedad `Presupuesto` (archivos) existe pero no se usa: el presupuesto se encuentra por la Carpeta Drive.)

**Ciclo**: Sin empezar → Presupuestando → GANADO (se crea/actualiza registro en PRODUCCIÓN) → CERRADO (con `cerrar_proyecto`). O → PERDIDO.

## 3. 🚀 PRODUCCIÓN
`collection://329e758f-7136-8017-b05b-000bf5270cec`

| Propiedad | Tipo | Uso |
|---|---|---|
| Nombre | título | |
| Estado | status | `Pre Producción`, `Producción`, `Post Producción`, `Finalizado` |
| Proyecto | relación → PROYECTOS | |

Seguimiento de producción de proyectos ganados. Al `cerrar_proyecto`: Estado = Finalizado.

---

## 4. 📝 Historial de Presupuestos - 2026
`collection://32ae758f-7136-8134-96da-000b0d475f9c`

| Propiedad | Tipo real | Uso |
|---|---|---|
| Proyecto | título | Nombre de la pieza/proyecto |
| Marca | texto | ⏳ hoy es tipo email en Notion → cambiar a texto |
| Agencia / Productora | texto | Quién nos pidió el presupuesto |
| PM | texto | Contacto/PM del lado del cliente |
| Monto | número | ⏳ hoy es tipo teléfono (texto `95.000.000`) → pasar a número. Mientras tanto: quitar puntos y convertir |
| Master | url (carpeta de Drive) | ⏳ hoy es tipo número → pasar a url |
| Observación | ⚠️ número | |
| Seleccionar | select | Estado: `A realizar`, `A confirmar`, `Realizado`, `Perdido`, `No se ejecuto`, `No habia presupuesto` |
| Fecha | fecha | Fecha de envío |
| 🆕 Proyecto (relación) | relación → PROYECTOS | |

Equivalencias con el flujo: Enviado/En revisión = `A confirmar` · Aprobado = `A realizar` → `Realizado` · Rechazado = `Perdido` / `No se ejecuto`.

---

## 5. 🥷🏼 CREW
`collection://29ce758f-7136-8037-890d-000bf09945cb`

| Propiedad | Tipo | Uso |
|---|---|---|
| Nombre | título | |
| Role | select | DoP, Filmmaker, Fotografo, Dir. Arte, Foodstyler, Utilero, Productor, Jefe de Locaciones, Droner, Droner FPV, Director, Editor, Colorista, Maquilladora, Vestuarista, Realizador, Russian Arm, VFX, Pelo, Sonidista, Key Grip, Foquista |
| Teléfono | teléfono | |
| Trabajamos | select | Si / No |
| Observación | texto | Tarifas o comentarios, si los hay |

**Uso**: al armar un presupuesto, sugerir crew por rol priorizando `Trabajamos = Si`.

## 6. Otras bases (solo lectura / referencia)
| Base | Para qué |
|---|---|
| ⚕️ SEGUROS | Datos de crew para seguros de rodaje (DNI, nacimiento). **Datos personales: no exponer salvo pedido explícito.** |
| 📒 PLANTILLAS | Links a plantillas de Google (ver `config.md`) |
| TAREAS | Objetivos generales del equipo |
| DIRECTORES | Inspo de directores |
| INSPO, DISCOS, Manual de Ventas, PORTFOLIO Y DECKS, Finanzas | Referencia |
| CRM Agencias OLD / CRM Marcas OLD | **Históricos. No escribir.** Solo consultar si un lead no está en el CRM nuevo |
