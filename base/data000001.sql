/********************************************I-DAT-FFP-CMS-0-23/10/2018********************************************/

INSERT INTO segu.tsubsistema ( codigo, nombre, fecha_reg, prefijo, estado_reg, nombre_carpeta, id_subsis_orig)
VALUES ('CMS', 'Contenido', '2018-10-16', 'CMS', 'activo', 'contenido', NULL);



select pxp.f_insert_tgui ('CONTENIDOS', '', 'CMS', 'si', 1, '', 1, '', '', 'CMS');
select pxp.f_insert_tgui ('Contenido', 'Contenido', 'Contenido', 'si', 1, 'sis_contenidos/vista/contenido/Contenido.php', 2, '', 'Contenido', 'CMS');

/********************************************F-DAT-FFP-MER-0-23/10/2018********************************************/
