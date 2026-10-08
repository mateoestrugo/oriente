---
name: configurar-notion
description: Vincula Mr. Oriente con el Notion de ORIENTE. Encuentra las bases existentes (Leads/CRM, Proyectos, Historial de presupuestos, Crew) o las crea con el esquema de contexto/notion.md, y guarda los IDs en contexto/config.md. Usar con "configurar_notion" o cuando falten IDs de Notion.
argument-hint: "[link a la página de Notion donde crear las bases]"
---

# configurar_notion

Página padre (opcional): `$ARGUMENTS`

Leé antes `contexto/notion.md` (esquema) y `contexto/config.md`.

## 0. Chequear conexión
Si no hay herramientas de Notion disponibles, decí: "Notion no está conectado. Conectalo en https://claude.ai/customize/connectors (dale acceso a las páginas de ORIENTE) y abrí una sesión nueva." y frená.

## 1. Buscar lo que ya existe
Buscá en Notion bases con nombres parecidos a: CRM, Leads, Prospectos, Proyectos, Presupuestos, Historial, Crew, Proveedores, Técnicos. Mostrá lo encontrado:

| Base esperada | Encontrada | Link | ¿Usar esta? |

Preguntá en un solo mensaje cuáles usar.

## 2a. Si la base existe → mapear
- Leé sus propiedades y compará con `contexto/notion.md`.
- Mostrá: campos que coinciden (aunque tengan otro nombre), campos que faltan, opciones de Estado reales.
- **No renombres ni borres propiedades existentes.** Proponé agregar solo las que falten y esperá OK.
- Actualizá `contexto/notion.md` para que refleje los nombres y estados **reales** (Notion manda).

## 2b. Si no existe → crear
- Pedí la página padre si no vino en el argumento (ej: "ORIENTE · Operación").
- Mostrá el resumen de lo que vas a crear y esperá OK.
- Crear en este orden (por las relaciones): **Leads / CRM** → **Proyectos** (relación Cliente/Agencia → Leads) → **Historial de presupuestos** (relación → Proyectos) → **Crew y proveedores** (relación → Proyectos).
- Tipos de propiedad y opciones de select según `contexto/notion.md`.
- Vistas útiles si la herramienta lo permite: Leads por Estado (board), "Próxima acción vencida" (filtro fecha < hoy), Proyectos por Estado (board), Cobros pendientes (Estado de cobro ≠ Cobrado).

## 3. Guardar
- Escribí los IDs/URLs en la tabla Notion de `contexto/config.md` (reemplazando `[COMPLETAR]`).
- Hacé commit del cambio si estás en el repo: `Vincular Notion: IDs de bases`.

## 4. Responder
Links de las 4 bases, qué se creó/agregó, y qué quedó pendiente de decidir.
