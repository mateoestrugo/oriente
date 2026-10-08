---
name: reporte-mensual
description: Reporte mensual de ORIENTE. Facturación, ganancia, margen promedio, proyectos cerrados, presupuestos pendientes de respuesta y cobros pendientes, comparado con el mismo mes del año anterior. Usar con "reporte_mensual".
argument-hint: "[MES/AÑO]"
---

# reporte_mensual

Mes: `$ARGUMENTS` (por defecto, el mes anterior).

Fuentes: Ganancias ORIENTE (Registro), Notion (Proyectos, Historial de presupuestos, Leads).

```
📈 Reporte {Mes AAAA}

Números (vs. {Mes AAAA−1})
| Facturación | Ganancia | Margen prom. | Proyectos cerrados |

Proyectos cerrados
| Proyecto | Cliente | Venta | Ganancia | Margen | Cobro |

Presupuestos pendientes de respuesta
| Proyecto | Versión | Enviado | Monto | Días sin respuesta |

Cobros pendientes
| Proyecto | Facturado | Cobrado | Pendiente | Vence | ⚠️ |

Comercial del mes
Leads nuevos · contactados · respuestas · briefs · aprobados · conversión

Acumulado del año (YTD) vs. año anterior
Facturación · Ganancia · Margen

Lectura rápida: (3 líneas máx.: qué anduvo bien, qué preocupa, qué hacer)
```

Separar monedas si hay ARS y USD. Solo lectura.
