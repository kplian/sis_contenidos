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

/********************************************I-DAT-FFP-CMS-0-06/11/2018********************************************/


select pxp.f_insert_tgui ('menu_web', 'menu_web', 'menu_web', 'no', 1, '', 2, '', '', 'CMS');
select pxp.f_insert_tgui ('Inicio', 'inicio', 'inicio', 'no', 1, 'index.html', 3, '', 'index', 'CMS');
select pxp.f_insert_tgui ('Inversiones', 'inversiones', 'inversiones', 'no', 2, '', 3, '', '', 'CMS');
select pxp.f_insert_tgui ('Plan Estrategico', 'plan estrategico', 'plan estrategico', 'no', 1, 'quienes_somos', 4, '', 'quienes_somos', 'CMS');
select pxp.f_delete_tgui ('prueba');
select pxp.f_insert_tgui ('Archivo', 'Archivo', 'Contenido.1', 'no', 0, 'sis_parametros/vista/archivo/Archivo.php', 3, '', 'Archivo', 'CMS');
select pxp.f_insert_tgui ('Interfaces', 'Interfaces', 'Contenido.1.1', 'no', 0, 'sis_parametros/vista/archivo/upload.php', 4, '', 'subirArchivo', 'CMS');
select pxp.f_insert_tgui ('ArchivoHistorico', 'ArchivoHistorico', 'Contenido.1.2', 'no', 0, 'sis_parametros/vista/archivo/ArchivoHistorico.php', 4, '', 'ArchivoHistorico', 'CMS');
select pxp.f_insert_tgui ('Valores', 'Valores', 'Contenido.1.3', 'no', 0, 'sis_parametros/vista/field_tipo_archivo/FieldTipoArchivoValor.php', 4, '', '40%', 'CMS');
select pxp.f_insert_tgui ('Valores', 'Valores', 'Contenido.1.4', 'no', 0, 'sis_parametros/vista/field_valor_archivo/frmValor.php', 4, '', 'frmValor', 'CMS');
select pxp.f_insert_tgui ('Catálogo', 'Catálogo', 'Contenido.1.4.1', 'no', 0, 'sis_parametros/vista/catalogo/Catalogo.php', 5, '', 'Catalogo', 'CMS');
select pxp.f_insert_tgui ('Categoria', 'Categoria', 'CATE', 'si', 2, 'sis_contenidos/vista/categoria/Categoria.php', 2, '', 'Categoria', 'CMS');
select pxp.f_insert_tgui ('ejemplo cate', 'ejemplo cate', 'ejca', 'no', 9, 'categoria', 3, '', 'categoria', 'CMS');
select pxp.f_insert_tgui ('Ejecución de inversiones', 'Ejecución de inversiones', 'EJEINV', 'no', 2, 'ejecucion_de_inversiones', 4, '', 'ejecucion_de_inversiones', 'CMS');
select pxp.f_insert_tgui ('Contrataciones', 'CONTRATACIONES', 'CONTRATACIONES', 'no', 3, '', 3, '', '', 'CMS');
select pxp.f_insert_tgui ('Contrataciones ETR', 'Contrataciones ETR', 'CONTRETR', 'no', 1, 'contrataciones_etr', 4, '', 'contrataciones_etr', 'CMS');
select pxp.f_insert_tgui ('ENDE Sismo', 'ENDE Sismo', 'ENDESISMO', 'no', 2, 'ende_sismo', 4, '', 'ende_sismo', 'CMS');
select pxp.f_insert_tgui ('Nosotros', 'Nosotros', 'NOSOTROS', 'no', 4, '', 3, '', '', 'CMS');
select pxp.f_insert_tgui ('Sector eléctrico en Bolivia', 'Sector eléctrico en Bolivia', 'SECTORELECTR', 'no', 1, 'sector_electrico_en_bolivia', 4, '', 'sector_electrico_en_bolivia', 'CMS');
select pxp.f_insert_tgui ('¿Quienes somos?', '¿Quienes somos?', 'QUIENES', 'no', 2, 'quienes_somos', 4, '', 'quienes_somos', 'CMS');
select pxp.f_insert_tgui ('¿Qué hacemos?', '¿Qué hacemos?', 'HACEMOS', 'no', 3, 'que_hacemos', 4, '', 'que_hacemos', 'CMS');
select pxp.f_insert_tgui ('Servicios', 'Servicios', 'SERVICIOS', 'no', 5, '', 3, '', '', 'CMS');
select pxp.f_insert_tgui ('Infraestructura y Medios', 'Infraestructura y Medios', 'INFRA', 'no', 1, 'infraestructura_y_medios', 4, '', 'infraestructura_y_medios', 'CMS');
select pxp.f_insert_tgui ('Instrumentos y equipos', 'Instrumentos y equipos', 'INSTRU', 'no', 2, 'instrumentos_y_equipos', 4, '', 'instrumentos_y_equipos', 'CMS');
select pxp.f_insert_tgui ('Productos/Servicios', 'Productos/Servicios', 'PRODS', 'no', 3, 'productos_servicios', 4, '', 'productos_servicios', 'CMS');
select pxp.f_insert_tgui ('Modalidad del servicio', 'Modalidad del servicio', 'MODS', 'no', 4, 'modalidad_de_servicio', 4, '', 'modalidad_de_servicio', 'CMS');
select pxp.f_insert_tgui ('Nuestros clientes', 'Nuestros clientes', 'NUEST', 'no', 5, 'nuestros_clientes', 4, '', 'nuestros_clientes', 'CMS');
select pxp.f_insert_tgui ('Publicaciones', 'Publicaciones', 'PUB', 'no', 6, '', 3, '', '', 'CMS');
select pxp.f_insert_tgui ('Medio ambiente', 'Medio ambiente', 'MEDIOAM', 'no', 1, 'medio_ambiente', 4, '', 'medio_ambiente', 'CMS');
select pxp.f_insert_tgui ('Memorias Anuales', 'Memorias Anuales', 'MEMOA', 'no', 2, 'memorias_anuales', 4, '', 'memorias_anuales', 'CMS');
select pxp.f_insert_tfuncion ('cms.ft_contenido_ime', 'Funcion para tabla     ', 'CMS');
select pxp.f_insert_tfuncion ('cms.ft_contenido_sel', 'Funcion para tabla     ', 'CMS');
select pxp.f_insert_tprocedimiento ('CMS_CON_INS', 'Insercion de registros', 'si', '', '', 'cms.ft_contenido_ime');
select pxp.f_insert_tprocedimiento ('CMS_CON_MOD', 'Modificacion de registros', 'si', '', '', 'cms.ft_contenido_ime');
select pxp.f_insert_tprocedimiento ('CMS_CON_ELI', 'Eliminacion de registros', 'si', '', '', 'cms.ft_contenido_ime');
select pxp.f_insert_tprocedimiento ('CMS_CON_SEL', 'Consulta de datos', 'si', '', '', 'cms.ft_contenido_sel');
select pxp.f_insert_tprocedimiento ('CMS_CON_CONT', 'Conteo de registros', 'si', '', '', 'cms.ft_contenido_sel');
select pxp.f_insert_tprocedimiento ('CMS_WEB_SEL', 'Conteo de registros', 'si', '', '', 'cms.ft_contenido_sel');
select pxp.f_insert_tprocedimiento ('CMS_MENUWEB_SEL', 'SELECT PARA ARMAR EL MENU EN LA WEB', 'si', '', '', 'cms.ft_contenido_sel');


/********************************************F-DAT-FFP-MER-0-06/11/2018********************************************/
