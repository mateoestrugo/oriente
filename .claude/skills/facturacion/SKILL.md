---
name: facturacion
description: Números de facturación de ORIENTE para un mes o un año (facturación, ganancia, margen, proyectos) comparados con el mismo período del año anterior. Usar con "facturacion {MES|AÑO}", ej. "facturacion octubre", "facturacion 2026", "facturacion 10/2026".
argument-hint: "{MES | MES/AÑO | AÑO}"
---

# facturacion

Período: `$ARGUMENTS`

1. **Interpretar el período**: un año (`2026`) → anual (si es el año en curso, YTD hasta hoy). Un mes (`octubre`, `10`, `10/2026`) → ese mes; si no dice año, el año actual. Sin argumento → mes actual.
2. **Leer** la pestaña `Registro` de Ganancias ORIENTE (ID en `contexto/config.md`). Filtrar por fecha de cierre en el período y en el **mismo período del año anterior**.
3. **Mostrar**:

```
💰 Facturación {período}

|               | {período} | {período año ant.} | Var. |
| Facturación   | $…        | $…                 | +x%  |
| Ganancia      | $…        | $…                 | +x%  |
| Margen prom.  | x%        | x%                 | ±pp  |
| Proyectos     | n         | n                  |      |

Por cliente: (tabla cliente | facturación | ganancia | margen)
Cobros: cobrado $… · pendiente $… (⚠️ vencidos > 30 días: …)
```

   - Si es anual, agregar el desglose mes a mes (tabla corta).
   - Separar ARS y USD si hay ambas monedas; no sumar monedas distintas.
   - Margen promedio ponderado = ganancia total / facturación total (aclarar si se muestra también el simple).
4. Si el año anterior no tiene datos, decirlo (no poner 0% de variación).

Solo lectura.
