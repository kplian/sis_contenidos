/********************************************I-DAT-FFP-CMS-0-23/10/2018********************************************/

INSERT INTO segu.tsubsistema ( codigo, nombre, fecha_reg, prefijo, estado_reg, nombre_carpeta, id_subsis_orig)
VALUES ('CMS', 'Contenido', '2018-10-16', 'CMS', 'activo', 'contenido', NULL);



select pxp.f_insert_tgui ('CONTENIDOS', '', 'CMS', 'si', 1, '', 1, '', '', 'CMS');
select pxp.f_insert_tgui ('Contenido', 'Contenido', 'Contenido', 'si', 1, 'sis_contenidos/vista/contenido/Contenido.php', 2, '', 'Contenido', 'CMS');

/********************************************F-DAT-FFP-MER-0-23/10/2018********************************************/

/********************************************I-DAT-FFP-CMS-0-24/10/2018********************************************/

INSERT INTO param.ttipo_archivo (id_usuario_reg, id_usuario_mod, fecha_reg, fecha_mod, estado_reg, id_usuario_ai, usuario_ai, nombre_id, tipo_archivo, tabla, codigo, nombre, multiple, extensiones_permitidas, ruta_guardar, tamano, orden, obligatorio) VALUES (1, 1, '2018-09-23 15:14:44.275311', '2018-09-23 15:17:38.118666', 'activo', null, 'NULL',  'id_contenido', 'imagen', 'tcontenido', 'SLIDER', 'SLIDER', 'no', 'jpeg,jpg,png', '', 1, 1, 'si');
INSERT INTO param.ttipo_archivo (id_usuario_reg, id_usuario_mod, fecha_reg, fecha_mod, estado_reg, id_usuario_ai, usuario_ai, nombre_id, tipo_archivo, tabla, codigo, nombre, multiple, extensiones_permitidas, ruta_guardar, tamano, orden, obligatorio) VALUES (1, 1, '2018-09-23 15:17:28.243237', '2018-09-23 19:11:25.057077', 'activo', null, 'NULL',  'id_contenido', 'documento', 'tcontenido', 'ARCHIVO', 'ARCHIVO', 'no', 'jpeg,jpg,pdf,docx,doc,gif,png,PDF,DOC,DOCX,xls,xlsx,XLS,XLSX,rar,mp4,MP4,bmp', '', 2, 2, 'no');

--PLANTILLA NO DESCOMENTAR
--ejecutar esto luego que tengas lo anterior registrado cambiando los id_tipo_archivo (EDITAR EN EL SQLCONSOLE )
/*
INSERT INTO param.tfield_tipo_archivo (id_usuario_reg, id_usuario_mod, fecha_reg, fecha_mod, estado_reg, id_usuario_ai, usuario_ai, id_field_tipo_archivo, id_tipo_archivo, nombre, tipo, descripcion) VALUES (1, null, '2018-09-23 15:21:38.038268', null, 'activo', null, 'NULL', 3, CAMBIAR_ESTO_POR_ID_TIPO_ARCHIVO, 'TITULO', 'TextField', 'titulo');
INSERT INTO param.tfield_tipo_archivo (id_usuario_reg, id_usuario_mod, fecha_reg, fecha_mod, estado_reg, id_usuario_ai, usuario_ai, id_field_tipo_archivo, id_tipo_archivo, nombre, tipo, descripcion) VALUES (1, null, '2018-09-23 15:22:27.664984', null, 'activo', null, 'NULL', 4, CAMBIAR_ESTO_POR_ID_TIPO_ARCHIVO, 'Resumen', 'TextArea', 'Resumen');
*/

/********************************************F-DAT-FFP-MER-0-24/10/2018********************************************/
