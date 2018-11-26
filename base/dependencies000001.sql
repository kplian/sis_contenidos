/*********************************I-DEP-FFP-MER-0-17/11/2015***********************************/

select pxp.f_insert_testructura_gui ('CMS', 'SISTEMA');
select pxp.f_insert_testructura_gui ('Contenido', 'CMS');



/*********************************F-DEP-FFP-MER-0-17/11/2015***********************************/


/*********************************I-DEP-FFP-MER-0-06/11/2018***********************************/


select pxp.f_insert_testructura_gui ('CMS', 'SISTEMA');
select pxp.f_insert_testructura_gui ('Contenido', 'CMS');
select pxp.f_insert_testructura_gui ('menu_web', 'CMS');
select pxp.f_insert_testructura_gui ('inicio', 'menu_web');
select pxp.f_insert_testructura_gui ('inversiones', 'menu_web');
select pxp.f_insert_testructura_gui ('plan estrategico', 'inversiones');
select pxp.f_delete_testructura_gui ('prueba', 'inversiones');
select pxp.f_insert_testructura_gui ('Contenido.1', 'Contenido');
select pxp.f_insert_testructura_gui ('Contenido.1.1', 'Contenido.1');
select pxp.f_insert_testructura_gui ('Contenido.1.2', 'Contenido.1');
select pxp.f_insert_testructura_gui ('Contenido.1.3', 'Contenido.1');
select pxp.f_insert_testructura_gui ('Contenido.1.4', 'Contenido.1');
select pxp.f_insert_testructura_gui ('Contenido.1.4.1', 'Contenido.1.4');
select pxp.f_insert_testructura_gui ('CATE', 'CMS');
select pxp.f_insert_testructura_gui ('ejca', 'menu_web');
select pxp.f_insert_testructura_gui ('EJEINV', 'inversiones');
select pxp.f_insert_testructura_gui ('CONTRATACIONES', 'menu_web');
select pxp.f_insert_testructura_gui ('CONTRETR', 'CONTRATACIONES');
select pxp.f_insert_testructura_gui ('ENDESISMO', 'CONTRATACIONES');
select pxp.f_insert_testructura_gui ('NOSOTROS', 'menu_web');
select pxp.f_insert_testructura_gui ('SECTORELECTR', 'NOSOTROS');
select pxp.f_insert_testructura_gui ('QUIENES', 'NOSOTROS');
select pxp.f_insert_testructura_gui ('HACEMOS', 'NOSOTROS');
select pxp.f_insert_testructura_gui ('SERVICIOS', 'menu_web');
select pxp.f_insert_testructura_gui ('INFRA', 'SERVICIOS');
select pxp.f_insert_testructura_gui ('INSTRU', 'SERVICIOS');
select pxp.f_insert_testructura_gui ('PRODS', 'SERVICIOS');
select pxp.f_insert_testructura_gui ('MODS', 'SERVICIOS');
select pxp.f_insert_testructura_gui ('NUEST', 'SERVICIOS');
select pxp.f_insert_testructura_gui ('PUB', 'menu_web');
select pxp.f_insert_testructura_gui ('MEDIOAM', 'PUB');
select pxp.f_insert_testructura_gui ('MEMOA', 'PUB');
select pxp.f_insert_tprocedimiento_gui ('CMS_CON_INS', 'Contenido', 'no');
select pxp.f_insert_tprocedimiento_gui ('CMS_CON_MOD', 'Contenido', 'no');
select pxp.f_insert_tprocedimiento_gui ('CMS_CON_ELI', 'Contenido', 'no');
select pxp.f_insert_tprocedimiento_gui ('CMS_CON_SEL', 'Contenido', 'no');
select pxp.f_insert_tprocedimiento_gui ('CMS_WEB_SEL', 'Contenido', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CATCMB_SEL', 'Contenido.1.4', 'no');
select pxp.f_insert_tprocedimiento_gui ('SEG_SUBSIS_SEL', 'Contenido.1.4.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_PACATI_SEL', 'Contenido.1.4.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CAT_INS', 'Contenido.1.4.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CAT_MOD', 'Contenido.1.4.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CAT_ELI', 'Contenido.1.4.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CAT_SEL', 'Contenido.1.4.1', 'no');
select pxp.f_insert_tprocedimiento_gui ('PM_CATCMB_SEL', 'Contenido.1.4.1', 'no');


/*********************************F-DEP-FFP-MER-0-06/11/2018***********************************/


/*********************************I-DEP-FFP-CMS-0-26/11/2018***********************************/


ALTER TABLE ONLY cms.tcontenido
  ADD CONSTRAINT fk_tcontenido__id_categoria
FOREIGN KEY (id_categoria) REFERENCES cms.tcategoria(id_categoria);


/*********************************F-DEP-FFP-CMS-0-26/11/2018***********************************/

