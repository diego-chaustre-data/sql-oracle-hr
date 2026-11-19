-- 05 · Cargos de jefe a los que podría ascender cada programador sin cambiar su sueldo
-- Técnica: non-equi join. La unión no es por igualdad sino por rango:
-- el sueldo del empleado cae entre el mínimo y el máximo del cargo.

SELECT e.LAST_NAME, e.SALARY, j.JOB_TITLE
FROM HR.EMPLOYEES e
JOIN HR.JOBS j ON e.SALARY BETWEEN j.MIN_SALARY AND j.MAX_SALARY
WHERE e.DEPARTMENT_ID = 60 AND j.JOB_TITLE LIKE '%Manager'
ORDER BY e.LAST_NAME, j.JOB_TITLE;
