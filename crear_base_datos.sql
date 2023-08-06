DROP TABLE IF EXISTS persona CASCADE;

DROP TABLE IF EXISTS empleado CASCADE;

DROP TABLE IF EXISTS proyecto CASCADE;

DROP TABLE IF EXISTS empleados_proyecto CASCADE;

/* Se crea la tabla persona con los atributos, nombre y fecha de nacimiento (f_nac) */

CREATE TABLE persona(
    nombre VARCHAR(50) NOT NULL,
    f_nac DATE NOT NULL
);

/* Se crea la tabla empleado, heredando los atributos de la tabla persona, pero adicionando
los atributo número de identificación del empleado (id_empleado) y el departamento.

La tabla empleado, es la tabla hija y hereda los atributos de la tabla padre 'persona' */

CREATE TABLE empleado(
    id_empleado NUMERIC(5) NOT NULL,
    departamento VARCHAR(30) NOT NULL,
    PRIMARY KEY(id_empleado)
)INHERITS (persona);

/* Se crea la tabla proyecto con los atributos, nombre del proyecto (n_proyecto), 
la fecha de inicio (f_inicio_proy)y el estado (estado_proyecto) */

CREATE TABLE proyecto(
    id_proyecto NUMERIC(4) NOT NULL,
    n_proyecto VARCHAR(30) NOT NULL,
    f_inicio_proy DATE NOT NULL,
    estado_proyecto VARCHAR(20),
    PRIMARY KEY(id_proyecto)
);

/* Se crea una tabla intermedia, para la relación muchos a muchos */

CREATE TABLE empleados_proyecto(
    id_empleado NUMERIC,
    id_proyecto NUMERIC,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto),
    PRIMARY KEY (id_empleado, id_proyecto)
);

/* Se insertan los registros en la tabla empleado */
INSERT INTO empleado VALUES ('Pepito Perez', '1990-01-01', 10001, 'Ventas');
INSERT INTO empleado VALUES ('Juanita Monsalve', '1997-08-15', 10002, 'Recursos Humanos');
INSERT INTO empleado VALUES ('Pablo Perez', '1980-01-01', 10003, 'Ventas');
INSERT INTO empleado VALUES ('Ana Ávila', '1992-11-22', 10004, 'Ventas');
INSERT INTO empleado VALUES ('Julio Gonzales', '1994-07-11', 10005, 'TI');
INSERT INTO empleado VALUES ('María Nieto', '1985-09-30', 10006, 'TI');
INSERT INTO empleado VALUES ('Marcela Prieto', '1990-01-01', 10007, 'Dirección');

/* Se insertan los registros de la tabla proyecto */
INSERT INTO proyecto (id_proyecto, n_proyecto, f_inicio_proy, estado_proyecto)
VALUES
    (9001, 'Desarrollo A', '2023-01-10', 'En curso'),
    (9002, 'Marketing B', '2023-03-20', 'Completado'),
    (9003, 'Investigación C', '2023-02-05', 'Pendiente');

/* Se insertan los registros de la tabla empleados_proyecto, con la cual se relacionan
 los empleados que participan en los proyectos */

 INSERT INTO empleados_proyecto (id_empleado, id_proyecto)
 VALUES
    (10001, 9001),
    (10001, 9003),
    (10002, 9001),
    (10003, 9002),
    (10003, 9001),
    (10004, 9003),
    (10005, 9003),
    (10006, 9001),
    (10007, 9001),
    (10007, 9002),
    (10007, 9003);
