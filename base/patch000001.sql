/***********************************I-SCP-FFP-CMS-1-23/10/2018****************************************/

CREATE TABLE cms.tcontenido (
  id_contenido SERIAL,
  nombre varchar(255),
  estado VARCHAR(1),
  orden INTEGER,
  CONSTRAINT pk_tcontenido__id_contenido PRIMARY KEY(id_contenido)
) INHERITS (pxp.tbase)
WITHOUT OIDS;

/***********************************F-SCP-FFP-CMS-1-23/10/2018****************************************/

/***********************************I-SCP-FFP-CMS-1-24/10/2018****************************************/

ALTER TABLE cms.tcontenido ALTER COLUMN estado TYPE VARCHAR(20) USING estado::VARCHAR(20);

/***********************************F-SCP-FFP-CMS-1-24/10/2018****************************************/
