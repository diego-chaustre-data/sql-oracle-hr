-- 07 · Sedes fuera de EE. UU. y Reino Unido con su número de departamentos
-- Técnica: NOT IN + LEFT JOIN (para que las sedes sin departamentos salgan con 0) + concatenación.

SELECT l.CITY || ' (' || l.COUNTRY_ID || '): ' || COUNT(d.DEPARTMENT_ID) AS LOCATION_SUMMARY
FROM HR.LOCATIONS l
LEFT JOIN HR.DEPARTMENTS d ON l.LOCATION_ID = d.LOCATION_ID
WHERE l.COUNTRY_ID NOT IN ('US', 'GB')
GROUP BY l.CITY, l.COUNTRY_ID
ORDER BY COUNT(d.DEPARTMENT_ID) DESC, l.CITY ASC;
