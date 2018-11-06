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


/***********************************I-SCP-FFP-CMS-1-21/10/2018****************************************/

ALTER TABLE cms.tcontenido ADD tipo VARCHAR(100) NULL;
ALTER TABLE cms.tcontenido ADD contenido TEXT NULL;

/***********************************F-SCP-FFP-CMS-1-21/10/2018****************************************/

/***********************************I-SCP-FFP-CMS-1-28/10/2018****************************************/

CREATE TABLE cms.tcategoria (
  id_categoria SERIAL,
  nombre varchar(255),
  CONSTRAINT pk_tcontenido__id_categoria PRIMARY KEY(id_categoria)
) INHERITS (pxp.tbase)
WITHOUT OIDS;


ALTER TABLE cms.tcontenido ADD id_categoria INTEGER NULL;

ALTER TABLE cms.tcategoria ALTER COLUMN nombre SET NOT NULL;
CREATE UNIQUE INDEX tcategoria_nombre_uindex ON cms.tcategoria (nombre);



/***********************************F-SCP-FFP-CMS-1-28/10/2018****************************************/
