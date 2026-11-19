# SQL en Oracle · práctica sobre el esquema HR

Práctica intensiva de SQL en **Oracle Database 26ai** (plataforma FreeSQL), del 29 de octubre al 11 de noviembre de 2026, en paralelo al curso **"Programación de Bases de Datos con SQL" de Oracle Academy** (programa AvanzaTEC, MinTIC).

Trabajé sobre el esquema de ejemplo **HR**: 107 empleados, 27 departamentos y 7 tablas relacionadas (empleados, departamentos, cargos, sedes, países, regiones e historial de cargos).

## Cómo practiqué

- **Más de 50 consultas** de dificultad creciente, planteadas como requerimientos de negocio ("RR. HH. necesita…", "Finanzas quiere…").
- Nadie me decía qué tabla ni qué columnas usar: yo identificaba las tablas, las relaciones y la lógica.
- Usé la IA como tutor: me planteaba los retos y me corregía, pero las consultas las escribí yo.
- Validé cada resultado con conteos y totales de control. Así encontré errores de lógica que no generan ningún mensaje de error (ver [TRAMPAS.md](TRAMPAS.md)).

## Consultas destacadas

| # | Consulta | Técnica |
|---|---|---|
| 01 | [Empleados que ganan más que su jefe](consultas/01_gana_mas_que_su_jefe.sql) | Self join |
| 02 | [Empleado → jefe → jefe del jefe](consultas/02_cadena_jerarquica.sql) | Dos self joins |
| 03 | [Departamentos con su número de empleados, incluidos los vacíos](consultas/03_departamentos_incluye_vacios.sql) | LEFT JOIN + COUNT(columna) |
| 04 | [Departamentos con sueldos altos y promedio controlado](consultas/04_departamentos_sueldo_alto.sql) | WHERE + GROUP BY + HAVING |
| 05 | [Cargos de jefe a los que podría ascender cada programador](consultas/05_non_equi_join_ascensos.sql) | Non-equi join (BETWEEN) |
| 06 | [Top 2 de comisiones sin dejar empatados por fuera](consultas/06_top_n_con_empates.sql) | FETCH FIRST … WITH TIES |
| 07 | [Sedes internacionales con su número de departamentos](consultas/07_sedes_internacionales.sql) | NOT IN + LEFT JOIN |

## Temas por ronda

| Ronda | Tema | Estado |
|---|---|---|
| 1 | Consultas básicas: SELECT, DISTINCT, ORDER BY con desempates | ✅ |
| 2 | Filtros: comparaciones, AND/OR/NOT con paréntesis, IN, BETWEEN, LIKE, IS NULL | ✅ |
| 3 | Agregación: COUNT, SUM, AVG, MAX, MIN, ROUND, GROUP BY, HAVING | ✅ |
| 4 | Complementos: DESCRIBE, `\|\|`, NULL en cálculos, LIKE con ESCAPE, NULLS FIRST/LAST, FETCH FIRST WITH TIES, COUNT(DISTINCT), MAX(AVG()) | ✅ |
| 5 | JOIN: INNER, LEFT, RIGHT, FULL OUTER, de 3 tablas, self join, non-equi join | 🟡 casi completa (falta USING, NATURAL JOIN, CROSS JOIN y sintaxis `(+)`) |
| 6 | Funciones de una fila: texto, números, fechas, TO_CHAR, NVL, COALESCE, CASE | ⏳ |
| 7 | Subconsultas, UNION/INTERSECT/MINUS, WITH, funciones analíticas | ⏳ |
| 8 | DDL y DML: CREATE TABLE, restricciones, INSERT/UPDATE/DELETE, transacciones | ⏳ |
| 9 | DCL y PL/SQL: procedimientos, funciones, triggers | ⏳ |

## Diferencias entre motores que tengo en cuenta

| Oracle | MySQL |
|---|---|
| `nombre \|\| ' ' \|\| apellido` | `CONCAT(nombre, ' ', apellido)` |
| `FETCH FIRST 5 ROWS ONLY` | `LIMIT 5` |
| `NVL(x, 0)` | `IFNULL(x, 0)` |
| `SELECT SYSDATE FROM DUAL` | `SELECT NOW()` |
| `GENERATED AS IDENTITY` | `AUTO_INCREMENT` |
| `NULLS FIRST / NULLS LAST` | no existe; se simula con `ORDER BY x IS NULL` |

También procuro escribir SQL que funcione en **Oracle 19c**, la versión que más usan las empresas, y no solo en la más reciente.

## Herramientas

Oracle Database 26ai · FreeSQL (SQL Developer Web) · Oracle APEX (SQL Workshop) · Oracle Academy · MySQL Workbench

---

Diego Angel Chaustre Baena · Aprendiz del Tecnólogo en Implementación y Gestión de Bases de Datos, SENA · [Portafolio](https://diego-chaustre-data.github.io)
