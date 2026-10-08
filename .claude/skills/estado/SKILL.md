---
name: estado
description: Resumen rápido de un proyecto o lead de ORIENTE (estado, fechas, montos, cobro, últimas novedades, próximos pasos). Usar con "estado {NOMBRE}".
argument-hint: "{NOMBRE de proyecto, empresa o contacto}"
---

# estado

Buscar: `$ARGUMENTS`

1. Buscar en Notion en **Proyectos** y en **Leads/CRM** (por nombre de proyecto, empresa o contacto). Si hay varios matches, listalos y preguntá.
2. Si es **proyecto**, mostrar:
   - Cliente / Agencia · Estado · Fechas de rodaje y entrega
   - Presupuesto: última versión (Historial de presupuestos), monto y estado; monto final si hay
   - Cobro: estado, facturado, cobrado, vencimiento (⚠️ si vencido > 30 días)
   - Links: carpeta Drive, presupuesto, Notion
   - Últimas 3 notas y próximo hito
3. Si es **lead**, mostrar:
   - Contacto, cargo, mail · Tipo/Rubro · Estado · Último mail
   - Último contacto y próxima acción (⚠️ si vencida o > 15 días sin contacto)
   - Proyectos/presupuestos asociados
   - Últimas 3 notas
   - Sugerencia concreta de próximo paso
4. Opcional: si el último dato de Notion es viejo (> 7 días), ofrecé correr `sync_mails` para ese contacto.

Formato corto, sin relleno. Solo lectura: este comando no modifica nada.
