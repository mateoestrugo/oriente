---
name: cerrar-proyecto
description: Cierra un proyecto de ORIENTE. Toma precio de venta, costos reales y ganancia del presupuesto final, agrega la fila a la planilla Ganancias ORIENTE y marca el proyecto como Finalizado en Notion. Usar con "cerrar_proyecto {NOMBRE}".
argument-hint: "{NOMBRE}"
---

# cerrar_proyecto

Proyecto: `$ARGUMENTS`

Leé antes `contexto/presupuesto.md` (cálculo de ganancia) y `contexto/google.md` (columnas de Ganancias ORIENTE).

## Pasos

1. **Encontrar el proyecto** en 🌶️ PROYECTOS (y su registro en 🚀 PRODUCCIÓN). Si hay más de uno parecido, mostralos y preguntá cuál.
2. **Leer el presupuesto final** (link en el proyecto). Identificar:
   - Precio de venta (total final).
   - Costos reales (si la planilla tiene columna/pestaña de "real" o "rendición"; si solo hay costos presupuestados, **preguntá** si usar esos o si hay rendición).
   - IIBB si aplica.
   - Calcular Ganancia y Margen % según `presupuesto.md`.
3. **Verificar**: correr el checklist de cuentas de `presupuesto.md`. Si algo no cierra o el monto no coincide con "Monto final" de Notion, frená y mostrá la diferencia.
4. **Confirmar con el usuario** en un solo mensaje:

```
Cierre de {PROYECTO}
Cliente: … · Agencia: …
Precio de venta: $… · Costo real: $… · Ganancia: $… · Margen: …%
Estado de cobro: … (¿es correcto?)
¿Lo cargo?
```

5. Con el OK:
   - **Ganancias ORIENTE → Registro**: agregar una fila al final (fecha de cierre = hoy salvo que digan otra, mes, año, cliente, agencia, proyecto, moneda, precio de venta, costo, ganancia, margen %, estado de cobro, link Notion). Nunca sobrescribir filas existentes. Si ya hay una fila de ese proyecto, avisá y no dupliques.
   - **🌶️ PROYECTOS**: Estado = `CERRADO`. Monto final / Costo real / Ganancia si los campos existen; si no, dejarlos en el cuerpo de la página con el registro del cierre.
   - **🚀 PRODUCCIÓN**: Estado = `Finalizado`.
   - **📝 Historial**: la fila del presupuesto aprobado → `Realizado`.
6. **Responder** con "Cambios aplicados" y links (fila de la planilla y registro de Notion). Si el cobro no está completo, recordá la fecha de vencimiento.
