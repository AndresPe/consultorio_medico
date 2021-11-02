CREATE DATABASE dbConsultorios;

USE dbConsultorios;

CREATE TABLE afiliado (
id INT(11) NOT NULL,
username VARCHAR(16) NOT NULL,
password VARCHAR(60) NOT NULL
);

ALTER TABLE afiliado ADD PRIMARY KEY (id);

DESCRIBE afiliado;

CREATE TABLE administrador (
id INT(11) NOT NULL,
username VARCHAR(16) NOT NULL,
password VARCHAR(60) NOT NULL
);

ALTER TABLE administrador ADD PRIMARY KEY (id);

CREATE TABLE especialidad (
id INT(2) NOT NULL,
name VARCHAR(60) NOT NULL
);

ALTER TABLE especialidad ADD PRIMARY KEY (id);

ALTER TABLE especialidad MODIFY id INT(2) NOT NULL AUTO_INCREMENT;

INSERT INTO especialidad (name) VALUES ("Medicina general");
INSERT INTO especialidad (name) VALUES ("Odontología");
INSERT INTO especialidad (name) VALUES ("Optometría");

SELECT * FROM especialidad;

CREATE TABLE consultorio (
id INT(3) NOT NULL,
name VARCHAR(60) NOT NULL,
idEspecialidad INT(2) NOT NULL,
direction VARCHAR(60) NOT NULL,
CONSTRAINT fk_idEspecialidad FOREIGN KEY(idEspecialidad) REFERENCES especialidad(id)
);

ALTER TABLE consultorio ADD PRIMARY KEY (id);

INSERT INTO consultorio (id, name, idEspecialidad, direction) VALUES (123,"Verti Las Americas",1, "Cra. xx #xx-xxx");
INSERT INTO consultorio (id, name, idEspecialidad, direction) VALUES (456,"Verti La Playa",2, "Cll. yy #yy-yyy");
INSERT INTO consultorio (id, name, idEspecialidad, direction) VALUES (789,"Verti Las Vegas",3, "Cra. zz #zz-zzz");

SELECT consultorio.id, consultorio.name, especialidad.name, consultorio.direction FROM consultorio, especialidad WHERE consultorio.idEspecialidad = especialidad.id;

CREATE TABLE citas (
idAfiliado INT(11) NOT NULL,
idConsultorio INT(3) NOT NULL,
FechaHora TIMESTAMP NOT NULL,
fechaCreacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
estado INT(1) NOT NULL DEFAULT 0,
CONSTRAINT fk_idAfiliado FOREIGN KEY(idAfiliado) REFERENCES afiliado(id),
CONSTRAINT fk_idConsultorio FOREIGN KEY(idConsultorio) REFERENCES consultorio(id)
);

-- Los estados se definen así: 0 Pendiente, 1 Completado, 2 Cancelado--

ALTER TABLE citas ADD PRIMARY KEY (idAfiliado, idConsultorio, FechaHora);
