CREATE TABLE public.eme_habilidad (
    id serial NOT NULL PRIMARY KEY,
    id_emergencia int,
    id_habilidad int,
	foreign key (id_emergencia) references emergencia(id) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (id_habilidad) references habilidad(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE public.emergencia (
    id serial NOT NULL PRIMARY KEY,
    nombre varchar(100),
    descripcion varchar(400),
    fecha_inicio date,
    fecha_termino date,
    id_institucion int,
	foreign key (id_institucion) references institucion(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE public.estado_tarea (
    id serial NOT NULL PRIMARY KEY,
    estado varchar(50)
);

CREATE TABLE public.habilidad (
    id serial NOT NULL PRIMARY KEY,
    habilidad varchar(100)
);	

CREATE TABLE public.institucion (
    id serial NOT NULL PRIMARY KEY,
    nombre varchar(100),
    direccion varchar(100),
    contacto varchar(100)
);

CREATE TABLE public.ranking (
    id serial NOT NULL PRIMARY KEY,
    id_voluntario int,
    id_tarea int,
    puntaje int,
	foreign key (id_voluntario) references voluntario(id) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (id_tarea) references tarea(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE public.tarea (
    id serial NOT NULL PRIMARY KEY,
    nombre varchar(100),
    descripcion varchar(300),
    cantidad_requeridos int,
    cantidad_inscritos int,
    id_emergencia int,
    id_estado int
);

CREATE TABLE public.tarea_habilidad (
    id serial NOT NULL PRIMARY KEY,
    id_tarea int,
    id_eme_habilidad int,
	foreign key (id_tarea) references tarea(id) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (id_eme_habilidad) references eme_habilidad(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE public.vol_habilidad (
    id serial NOT NULL PRIMARY KEY,
    id_voluntario int,
    id_habilidad int,
	foreign key (id_voluntario) references voluntario(id) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (id_habilidad) references habilidad(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE public.voluntario (
    id serial NOT NULL PRIMARY KEY,
    nombre varchar(100),
    fecha_nacimiento date,
    ubicacion geography(Point, 4326)
);

