-- 03 · Todos los departamentos con su cantidad de empleados, incluidos los vacíos en 0
-- Técnica: LEFT JOIN + GROUP BY.
-- Cuidado: COUNT(*) contaría 1 en los departamentos vacíos (la fila que pone el LEFT JOIN);
-- COUNT(e.EMPLOYEE_ID) ignora el NULL y devuelve 0, que es lo correcto.

SELECT d.DEPARTMENT_NAME, COUNT(e.EMPLOYEE_ID) AS TOTAL_EMPLOYEES
FROM HR.DEPARTMENTS d
LEFT JOIN HR.EMPLOYEES e ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_ID, d.DEPARTMENT_NAME
ORDER BY TOTAL_EMPLOYEES DESC, d.DEPARTMENT_NAME;
