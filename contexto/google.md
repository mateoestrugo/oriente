# Google Workspace

IDs y links concretos en `config.md`.

## Gmail — SOLO LECTURA
Permitido: buscar, listar y leer mails e hilos.
Prohibido: enviar, responder, reenviar, crear o editar borradores, mover a papelera, archivar, cambiar etiquetas. (Hay además un hook en `.claude/settings.json` que bloquea esas herramientas.)

## Drive — estructura de proyecto
Carpeta raíz de proyectos: ver `config.md`.

```
{NOMBRE DEL PROYECTO}/
├── 01 Presupuesto/        → Presupuesto - {NOMBRE} (Sheet)
├── 02 Carta de venta/     → Carta de venta - {NOMBRE} (Doc)
├── 03 Tratamiento/        → Tratamiento - {NOMBRE} (Slides)    [solo con +tratamiento]
├── 04 Call sheet/         → Call sheet - {NOMBRE}              [solo con +callsheet]
├── 05 Entregables/
└── 06 Facturas/
```

> [CONFIRMAR] Numeración final de subcarpetas y dónde van Plan de rodaje y Contrato (propuesta: Plan de rodaje en `04 Call sheet`, Contrato en `02 Carta de venta`).

## Planilla "Ganancias ORIENTE" (Sheets)

### Pestaña `Registro` (una fila por proyecto cerrado)
| Col | Campo | Ejemplo |
|---|---|---|
| A | Fecha de cierre | 2026-10-08 |
| B | Mes | `=MONTH(A2)` |
| C | Año | `=YEAR(A2)` |
| D | Cliente | Nespresso |
| E | Agencia | (vacío si es directo) |
| F | Proyecto | Nespresso Navidad |
| G | Moneda | ARS |
| H | Precio de venta | |
| I | Costo real | |
| J | Ganancia | `=H2-I2` (o restando IIBB si aplica; ver presupuesto.md) |
| K | Margen % | `=IF(H2=0;"";J2/H2)` |
| L | Estado de cobro | Facturado / Cobrado parcial / Cobrado |
| M | Link Notion | |

### Pestaña `Resumen`
Tabla mes × año para comparar contra el mismo período del año anterior:

| | Facturación {año} | Facturación {año−1} | Var % | Ganancia {año} | Ganancia {año−1} | Var % | Margen prom. |
|---|---|---|---|---|---|---|---|
| Enero … Diciembre | `=SUMIFS(Registro!H:H;Registro!B:B;mes;Registro!C:C;año)` | idem año−1 | | `=SUMIFS(Registro!J:J;...)` | | | |
| **Total anual / YTD** | | | | | | | |

El año se elige en una celda (ej: `Resumen!B1`) para poder cambiar el período. Si conviven ARS y USD, sumar por separado (agregar condición de Moneda al SUMIFS).

Mr. Oriente **solo agrega filas** en `Registro` (vía `cerrar_proyecto`) y actualiza Estado de cobro. Nunca borra ni reescribe filas existentes sin confirmación.

## Calendar
Calendario a usar: ver `config.md`.

| Evento | Título | Cuándo se crea |
|---|---|---|
| Rodaje | `🎬 Rodaje · {Proyecto}` | Al aprobarse el proyecto con fechas confirmadas |
| Entrega | `📦 Entrega · {Proyecto}` | Al confirmarse fecha de entrega |
| Reunión | `🤝 {Empresa} · {motivo}` | Al confirmarse una reunión (por mail o a pedido) |
| Próxima acción CRM | `⏰ {Próxima acción} · {Empresa}` | Al cargar/actualizar Fecha de próxima acción (evento de día completo con recordatorio) |

- Antes de crear, buscar si ya existe un evento igual (evitar duplicados); si cambió la fecha, **mover** el evento en vez de crear otro.
- Nunca invitar a externos (clientes, agencias, crew) sin confirmación: crear el evento solo en el calendario de ORIENTE.
