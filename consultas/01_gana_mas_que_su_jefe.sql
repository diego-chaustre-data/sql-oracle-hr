-- 01 · Empleados que ganan más que su propio jefe
-- Requerimiento: RR. HH. quiere revisar los casos en que un empleado gana más que la persona a la que reporta.
-- Técnica: self join (la tabla EMPLOYEES unida consigo misma: "e" = empleado, "m" = jefe).
-- Cuidado: si se invierte el ON (m.MANAGER_ID = e.EMPLOYEE_ID) la consulta corre sin error,
-- pero los papeles de empleado y jefe quedan trocados.

SELECT e.FIRST_NAME || ' ' || e.LAST_NAME AS EMPLOYEE_NAME, e.SALARY,
       m.FIRST_NAME || ' ' || m.LAST_NAME AS MANAGER_NAME, m.SALARY AS MANAGER_SALARY
FROM HR.EMPLOYEES e
JOIN HR.EMPLOYEES m ON e.MANAGER_ID = m.EMPLOYEE_ID
WHERE e.SALARY > m.SALARY;
