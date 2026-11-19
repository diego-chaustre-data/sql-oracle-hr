-- 04 · Departamentos "administrativos" con 2 o más empleados de sueldo alto y promedio controlado
-- Requerimiento: sin contar Envíos (50) ni Ventas (80), departamentos con al menos 2 empleados
-- que ganan 6.000 o más, y cuyo promedio de esos sueldos sea menor a 15.000.
-- Técnica: WHERE filtra filas antes de agrupar; HAVING filtra los grupos (dos condiciones).
-- Cuidado: el HAVING compara con AVG(SALARY) real, no con el valor redondeado que se muestra.

SELECT DEPARTMENT_ID, COUNT(EMPLOYEE_ID) AS TOTAL_EMPLOYEES, ROUND(AVG(SALARY), 2) AS AVG_PAYMENT
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID <> 50 AND DEPARTMENT_ID <> 80 AND SALARY >= 6000
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) < 15000 AND COUNT(*) >= 2
ORDER BY TOTAL_EMPLOYEES DESC, AVG_PAYMENT DESC;
