CREATE TABLE IF NOT EXISTS public.institucion (
    id SERIAL NOT NULL PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(100),
    contacto VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS public.habilidad (
    id SERIAL NOT NULL PRIMARY KEY,
    habilidad VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS public.estado_tarea (
    id SERIAL NOT NULL PRIMARY KEY,
    estado VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS public.tarea (
    id SERIAL NOT NULL PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(300),
    cantidad_requeridos INT,
    cantidad_inscritos INT,
    id_emergencia INT,
    id_estado INT
);

CREATE TABLE IF NOT EXISTS public.usuario (
    id SERIAL NOT NULL PRIMARY KEY,
    correo VARCHAR(100),
    password VARCHAR(100),
    rol VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS public.voluntario (
    id SERIAL NOT NULL PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_nacimiento DATE,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS public.emergencia (
    id SERIAL NOT NULL PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(400),
    fecha_inicio DATE,
    fecha_termino DATE,
    id_institucion INT,
    FOREIGN KEY (id_institucion) REFERENCES institucion(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS public.eme_habilidad (
    id SERIAL NOT NULL PRIMARY KEY,
    id_emergencia INT,
    id_habilidad INT,
    FOREIGN KEY (id_emergencia) REFERENCES emergencia(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_habilidad) REFERENCES habilidad(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS public.ranking (
    id SERIAL NOT NULL PRIMARY KEY,
    id_voluntario INT,
    id_tarea INT,
    puntaje INT,
    FOREIGN KEY (id_voluntario) REFERENCES voluntario(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_tarea) REFERENCES tarea(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS public.tarea_habilidad (
    id SERIAL NOT NULL PRIMARY KEY,
    id_tarea INT,
    id_eme_habilidad INT,
    FOREIGN KEY (id_tarea) REFERENCES tarea(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_eme_habilidad) REFERENCES eme_habilidad(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS public.vol_habilidad (
    id SERIAL NOT NULL PRIMARY KEY,
    id_voluntario INT,
    id_habilidad INT,
    FOREIGN KEY (id_voluntario) REFERENCES voluntario(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_habilidad) REFERENCES habilidad(id) ON DELETE CASCADE ON UPDATE CASCADE
);