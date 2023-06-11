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
    ubicacion geography(Point, 4326),
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
    ubicacion geography(Point, 4326),
    latitud double precision,
    longitud double precision
);

CREATE TABLE usuario (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    rol VARCHAR(255)
);




CREATE TABLE logtarea(
    idlogtarea SERIAL NOT NULL PRIMARY KEY,
    accion CHARACTER(1),
    fecha DATE,
    tiempo TIME,
    id_usuario INT NOT NULL,
    id INTEGER,
    nombre VARCHAR(100),
    descripcion VARCHAR(300),
    cantidad_requeridos INTEGER,
    cantidad_inscritos INTEGER,
    id_emergencia INTEGER,
    id_estado INTEGER
);

CREATE OR REPLACE FUNCTION logtarea() RETURNS TRIGGER AS $$ DECLARE

Id_usuario INTEGER;

Fecha DATE := CURRENT_DATE;

Tiempo TIME := CURRENT_TIME;

BEGIN 

    SELECT userid 
    into Id_usuario
    FROM current_app_user;

    IF (TG_OP = 'INSERT') THEN
        INSERT INTO logtarea
        SELECT nextval('logtarea_idlogtarea_seq'),'I', Fecha, Tiempo, Id_usuario, NEW.*;
    RETURN NEW;

    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO logtarea
        SELECT nextval('logtarea_idlogtarea_seq'), 'U', Fecha, Tiempo, Id_usuario, NEW.*;
    RETURN NEW;

    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO logtarea
        SELECT nextval('logtarea_idlogtarea_seq'), 'D', Fecha, Tiempo, Id_usuario, OLD.*;
    RETURN OLD;

    END IF;
    RETURN NULL;
END;

$$ LANGUAGE plpgsql;

CREATE TRIGGER logtarea_tg AFTER
    INSERT OR UPDATE OR DELETE ON tarea 
    FOR EACH ROW EXECUTE PROCEDURE logtarea();



create or replace procedure reporte()
language plpgsql
as $$
declare
-- declaracion de variables
	idusuario int;
	nombreusuario varchar(100);
	cant int;
	op char;
	
begin
-- cuerpo
	-- se crea tabla de reporte
	drop table if exists reporte;
	create table reporte(
	id_usuario int,
	nombre_usuario varchar(100),
	operacion varchar(20),
	tabla varchar(20),
	n_veces int);

	-- logtarea
	-- se obtienen los usuarios que han modificado logtarea, con la cantidad de queries creadas
	WITH maxmod_usuario as (SELECT l.accion, l.id_usuario AS usuario, COUNT(l.id_usuario) AS veces
	FROM logtarea l
	GROUP BY l.accion, usuario)
	-- se almacenan en las variables los datos del usuario con mas queries de insert
	SELECT into op, idusuario, cant i.accion, i.usuario, i.veces
	FROM maxmod_usuario i
	WHERE i.veces = (SELECT MAX(veces) FROM maxmod_usuario i WHERE i.accion = 'I')
	AND i.accion = 'I';
	-- se obtiene el nombre del usuario en la variable nombreusuario
	SELECT u.username into nombreusuario
	FROM usuario u
	WHERE u.id = idusuario;
	-- se insertan los datos en la tabla de reporte
	IF idusuario IS NOT NULL and op IS NOT NULL and cant IS NOT NULL THEN
		insert into reporte(id_usuario,nombre_usuario, operacion, tabla, n_veces)
		values(idusuario,nombreusuario,op,'logtarea',cant);
	END IF;
	
	-- se obtienen los usuarios que han modificado logtarea, con la cantidad de queries creadas
	WITH maxmod_usuario as (SELECT l.accion, l.id_usuario AS usuario, COUNT(l.id_usuario) AS veces
	FROM logtarea l
	GROUP BY l.accion, usuario)
	-- se almacenan en las variables los datos del usuario con mas queries de update
	SELECT into op, idusuario, cant i.accion, i.usuario, i.veces
	FROM maxmod_usuario i
	WHERE i.veces = (SELECT MAX(veces) FROM maxmod_usuario i WHERE i.accion = 'U')
	AND i.accion = 'U';
	-- se obtiene el nombre del usuario en la variable nombreusuario
	SELECT u.username into nombreusuario
	FROM usuario u
	WHERE u.id = idusuario;
	-- se insertan los datos en la tabla de reporte
	IF idusuario IS NOT NULL and op IS NOT NULL and cant IS NOT NULL THEN
		insert into reporte(id_usuario,nombre_usuario, operacion, tabla, n_veces)
		values(idusuario,nombreusuario,op,'logtarea',cant);
	END IF;
	-- se obtienen los usuarios que han modificado logtarea, con la cantidad de queries creadas
	WITH maxmod_usuario as (SELECT l.accion, l.id_usuario AS usuario, COUNT(l.id_usuario) AS veces
	FROM logtarea l
	GROUP BY l.accion, usuario)
	-- se almacenan en las variables los datos del usuario con mas queries de delete
	SELECT into op, idusuario, cant i.accion, i.usuario, i.veces
	FROM maxmod_usuario i
	WHERE i.veces = (SELECT MAX(veces) FROM maxmod_usuario i WHERE i.accion = 'D')
	AND i.accion = 'D';
	-- se obtiene el nombre del usuario en la variable nombreusuario
	SELECT u.username into nombreusuario
	FROM usuario u
	WHERE u.id = idusuario;
	-- se insertan los datos en la tabla de reporte
	IF idusuario IS NOT NULL and op IS NOT NULL and cant IS NOT NULL THEN
		insert into reporte(id_usuario,nombre_usuario, operacion, tabla, n_veces)
		values(idusuario,nombreusuario,op,'logtarea',cant);
	END IF;

end 
$$;
