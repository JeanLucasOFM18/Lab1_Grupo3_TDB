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