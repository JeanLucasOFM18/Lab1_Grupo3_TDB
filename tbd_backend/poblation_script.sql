insert into public.institucion(nombre, direccion, contacto) values
('Cruz Roja', 'Amazonas 439', '5691234567');

insert into public.emergencia(nombre, descripcion, fecha_inicio, fecha_termino, id_institucion) values
('Aluvión en recoleta','Se requieren voluntarios para socorro', '15-06-2023', '15-07-2023', 1);

insert into public.emergencia(nombre, descripcion, fecha_inicio, fecha_termino, id_institucion) values
('Terremoto en quillota','Se requieren voluntarios para socorro', '20-06-2023', '28-07-2023', 1);

insert into public.habilidad(habilidad) values
('Conocimientos de contabilidad básica');

insert into public.habilidad(habilidad) values
('Conocimiento avanzado de primeros auxilios');

insert into public.habilidad(habilidad) values
('Alta resistencia física');

insert into public.habilidad(habilidad) values
('Alta disponibilidad de tiempo');

insert into public.habilidad(habilidad) values
('Conocimiento básico de construcción');

insert into public.eme_habilidad(id_emergencia, id_habilidad) values
(1, 1);

insert into public.eme_habilidad(id_emergencia, id_habilidad) values
(1, 2);

insert into public.eme_habilidad(id_emergencia, id_habilidad) values
(1, 3);

insert into public.eme_habilidad(id_emergencia, id_habilidad) values
(2, 4);

insert into public.eme_habilidad(id_emergencia, id_habilidad) values
(2, 5);

insert into public.estado_tarea(estado) values
('Pendiente');

insert into public.estado_tarea(estado) values
('En proceso');

insert into public.estado_tarea(estado) values
('Finalizado');

insert into public.tarea(nombre, descripcion, cantidad_requeridos, cantidad_inscritos, id_emergencia, id_estado) values
('Orden de inventario', 'Ordenar inventario de recursos donados', 2, 0, 1, 1);

