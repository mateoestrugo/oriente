# Notion — bases de datos

Notion es la fuente central de verdad. IDs de cada base en `config.md`.

> Los estados de abajo son una **propuesta inicial**. Si en Notion existen otros, mandan los de Notion: adaptate y avisá la diferencia.

## 1. Leads / CRM
| Campo | Tipo | Notas |
|---|---|---|
| Empresa | Título | |
| Contacto | Texto | Nombre y apellido |
| Cargo | Texto | |
| Mail | Email | Clave para cruzar con Gmail |
| Tipo | Select | Marca / Agencia |
| Industria | Select | Automotriz, Bebidas, Indumentaria, Alimentos/Lácteos, Telecomunicaciones, Bancos/Fintech, Retail, Cuidado personal, Seguros/Energía, Agencia, Otra |
| Origen | Select | Lusha, Apollo, Skrap, Hunter.io, Referido, Evento, LinkedIn, Inbound, Otro |
| Estado | Select | ver abajo |
| Último contacto | Fecha | Último mail/llamada/reunión, de cualquiera de las dos partes |
| Fecha de última acción | Fecha | Última acción de ORIENTE |
| Próxima acción | Texto | Ej: "Seguimiento 1", "Mandar reel", "Call" |
| Fecha de próxima acción | Fecha | |
| Notas | Texto | Log con formato `[AAAA-MM-DD · autor] ...` (lo más nuevo arriba) |

### Estados de Lead
| Estado | Cuándo |
|---|---|
| Nuevo | Cargado, sin contactar |
| En secuencia | Le escribimos, sin respuesta todavía |
| Respondió | Contestó (sin acción concreta aún) |
| Reunión agendada | Hay call/reunión confirmada |
| Brief recibido | Mandó brief para presupuestar |
| Presupuesto enviado | Hay presupuesto en revisión |
| Ganado | Aprobó un proyecto (cliente activo) |
| No interesado | Rechazó explícitamente |
| Pausado | Sin respuesta tras la secuencia; recontactar más adelante |

**Alertas**: próxima acción vencida; sin contacto > 15 días en estados activos (En secuencia, Respondió, Reunión agendada, Brief recibido, Presupuesto enviado).

## 2. Proyectos
| Campo | Tipo | Notas |
|---|---|---|
| Nombre | Título | |
| Cliente | Texto / Relación a Leads | Marca final |
| Agencia | Texto / Relación a Leads | Si aplica |
| Estado | Select | ver abajo |
| Fechas de rodaje | Fecha (rango) | |
| Fecha de entrega | Fecha | |
| Monto presupuestado | Número | Última versión enviada |
| Monto final | Número | Precio de venta aprobado/facturado |
| Ganancia | Número | Se completa en `cerrar_proyecto` |
| Moneda | Select | ARS / USD |
| Carpeta Drive | URL | |
| Presupuesto | URL | Link al Sheet |
| Estado de cobro | Select | Sin facturar / Facturado / Cobrado parcial / Cobrado |
| Fecha de factura | Fecha | |
| Vencimiento de cobro | Fecha | Fecha de factura + plazo de pago |
| Monto cobrado | Número | |
| Crew | Relación a Crew | |
| Notas | Texto | |

### Estados de Proyecto
Presupuestando → Presupuesto enviado → Aprobado → Pre-producción → Rodaje → Post-producción → Entregado → **Finalizado**
(o **Rechazado** / **Cancelado**)

## 3. Historial de presupuestos
| Campo | Tipo |
|---|---|
| Proyecto | Relación a Proyectos (título: "{Proyecto} – V{n}") |
| Versión | Número (1, 2, 3...) |
| Fecha de envío | Fecha |
| Monto | Número |
| Moneda | Select |
| Estado | Select: Enviado / En revisión / Aprobado / Rechazado |
| Motivo de rechazo | Select + texto: Precio, Timing, Eligieron otra productora, Se cayó el proyecto, Sin respuesta, Otro |
| Link | URL al Sheet |

## 4. Crew y proveedores
| Campo | Tipo |
|---|---|
| Nombre | Título |
| Rol | Multi-select: Director, DF, Foquista, Gaffer, Eléctrico, Grip, Arte, Vestuario, Maquillaje, Sonido, Foto fija, Food stylist, Productor, Asistente, Editor, Colorista, Post/VFX, Música, Locación, Rental, Catering, Transporte, Otro |
| Contacto | Teléfono / Mail |
| Tarifa de referencia | Número + unidad (jornada / proyecto) |
| Fecha de la tarifa | Fecha (para saber si está desactualizada) |
| Proyectos | Relación a Proyectos |
| Calificación | Select 1–5 (opcional) |
| Notas | Texto |

**Uso**: al armar un presupuesto, sugerir crew por rol a partir de proyectos anteriores similares (mismo cliente, tipo de pieza o industria), con su última tarifa y la fecha de esa tarifa.
