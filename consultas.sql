/* Esta consulta nos devolverá una lista de todos los empleados y los proyectos en los que participan. 
Cada fila representará un empleado con su información y el proyecto en el que está involucrado. 
Sí un empleado participa en múltiples proyectos, aparecerá una fila para cada proyecto en el que 
participa, con la información del empleado repetida en cada fila. */

SELECT
    e.id_empleado, 
    e.nombre AS nombre_empleado, 
    e.departamento, 
    p.id_proyecto, 
    p.n_proyecto AS nombre_proyecto, 
    p.estado_proyecto
FROM proyecto AS p
INNER JOIN empleados_proyecto AS ep ON p.id_proyecto = ep.id_proyecto
INNER JOIN empleado AS e ON e.id_empleado = ep.id_empleado;

/* consulta nos devolverá una lista de empleados junto con los nombres de los proyectos 
en los que participan, todo en una sola fila por empleado. 
Si un empleado participa en varios proyectos, los nombres de los proyectos se concatenarán 
en la columna participantes_proyectos. Esto evita que se repita la información del empleado en 
filas separadas. */

SELECT 
    e.id_empleado, 
    e.nombre AS nombre_empleado, 
    e.f_nac, 
    e.departamento,
    string_agg(p.n_proyecto, ', ') AS emp_participantes_proyecto
FROM empleado AS e
JOIN empleados_proyecto AS ep ON e.id_empleado = ep.id_empleado
JOIN proyecto AS p ON ep.id_proyecto = p.id_proyecto
GROUP BY e.id_empleado, e.nombre, e.f_nac, e.departamento
ORDER BY e.id_empleado;