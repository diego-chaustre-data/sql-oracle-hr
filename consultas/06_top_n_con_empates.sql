-- 06 · Premiar a los 2 vendedores con mayor comisión sin dejar por fuera a nadie empatado
-- Técnica: Top-N con FETCH FIRST ... WITH TIES (Oracle 12c en adelante).
-- Cuidado: en orden DESC, Oracle pone los NULL primero; NULLS LAST evita que
-- los empleados sin comisión "ganen" el premio.

SELECT FIRST_NAME, LAST_NAME, COMMISSION_PCT
FROM HR.EMPLOYEES
ORDER BY COMMISSION_PCT DESC NULLS LAST
FETCH FIRST 2 ROWS WITH TIES;
