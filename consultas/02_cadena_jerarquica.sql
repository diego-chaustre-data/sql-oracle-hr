-- 02 · Cadena jerárquica de tres niveles: empleado → jefe → jefe del jefe
-- Requerimiento: ver a quién reporta cada empleado del departamento de TI (60) y a quién reporta su jefe.
-- Técnica: dos self joins sobre EMPLOYEES.

SELECT e.FIRST_NAME || ' ' || e.LAST_NAME AS EMPLOYEE_NAME,
       m.FIRST_NAME || ' ' || m.LAST_NAME AS MANAGER_NAME,
       g.FIRST_NAME || ' ' || g.LAST_NAME AS MANAGER_OF_MANAGER
FROM HR.EMPLOYEES e
JOIN HR.EMPLOYEES m ON e.MANAGER_ID = m.EMPLOYEE_ID
JOIN HR.EMPLOYEES g ON m.MANAGER_ID = g.EMPLOYEE_ID
WHERE e.DEPARTMENT_ID = 60
ORDER BY e.LAST_NAME;
