# Trampas de lógica que aprendí a detectar

Son errores que **no producen ningún mensaje de error**: la consulta corre y devuelve un resultado que parece correcto. Los encontré validando cada resultado contra conteos y totales esperados.

| Trampa | Qué pasa | Cómo la evito |
|---|---|---|
| `NULL` con `<>` o `NOT IN` | `WHERE DEPARTMENT_ID <> 50` deja por fuera a los empleados sin departamento, porque comparar con `NULL` no da verdadero ni falso. | Si deben incluirse, agrego `OR DEPARTMENT_ID IS NULL`. |
| `NOT IN` con un `NULL` en la lista | `NOT IN (10, 20, NULL)` devuelve **0 filas**. | Me aseguro de que la lista o la subconsulta no traiga `NULL`. |
| `NULL` en un cálculo | `SALARY * COMMISSION_PCT` da `NULL` para quien no tiene comisión, y la nómina total queda "desconocida". | Reviso qué columnas admiten `NULL` antes de calcular (y uso `NVL` cuando corresponde). |
| `LEFT JOIN` que se vuelve `INNER JOIN` | Un `WHERE` sobre la tabla de la derecha elimina las filas que el `LEFT JOIN` había conservado. | Pongo esa condición en el `ON`, o permito el `NULL`. |
| `COUNT(*)` con `LEFT JOIN` | Un departamento vacío aparece con 1 empleado en vez de 0. | Uso `COUNT(columna_de_la_derecha)`. |
| `AND` / `OR` sin paréntesis | `AND` se evalúa antes que `OR`; a veces el resultado "da bien por suerte" con los datos de prueba. | Siempre pongo paréntesis cuando mezclo los dos. |
| Redondeo en `HAVING` | Filtrar con el valor redondeado que muestro no es lo mismo que filtrar con el real. | En `HAVING` comparo con `AVG(SALARY)`, no con `ROUND(AVG(SALARY), 2)`. |
| Empates en un Top-N | `FETCH FIRST 2 ROWS ONLY` puede dejar por fuera a alguien empatado con el segundo. | Uso `WITH TIES` cuando el empate importa. |
| Texto ordenado como número | `'100'` queda antes que `'9'` si la columna es texto. | Reviso el tipo de dato con `DESCRIBE`. |
| `ON` invertido en un self join | Los papeles de empleado y jefe se intercambian sin ningún error. | Compruebo con un caso conocido (por ejemplo, el presidente no tiene jefe). |

**Bandera roja que uso:** si filtro sueldos de 6.000 o más y el promedio me da menos de 6.000, algo está mal en la consulta.
