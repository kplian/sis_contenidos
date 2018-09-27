CREATE OR REPLACE FUNCTION "cms"."ft_contenido_ime" (	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$

/**************************************************************************
 SISTEMA:		Contenidos
 FUNCION: 		cms.ft_contenido_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'cms.tcontenido'
 AUTOR: 		 (admin)
 FECHA:	        23-09-2018 18:04:19
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				23-09-2018 18:04:19								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'cms.tcontenido'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_contenido	integer;
			    
BEGIN

    v_nombre_funcion = 'cms.ft_contenido_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'CMS_CON_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-09-2018 18:04:19
	***********************************/

	if(p_transaccion='CMS_CON_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into cms.tcontenido(
			nombre,
			estado_reg,
			orden,
			estado,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			id_usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.nombre,
			'activo',
			v_parametros.orden,
			v_parametros.estado,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_contenido into v_id_contenido;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Contenido almacenado(a) con exito (id_contenido'||v_id_contenido||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_contenido',v_id_contenido::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'CMS_CON_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-09-2018 18:04:19
	***********************************/

	elsif(p_transaccion='CMS_CON_MOD')then

		begin
			--Sentencia de la modificacion
			update cms.tcontenido set
			nombre = v_parametros.nombre,
			orden = v_parametros.orden,
			estado = v_parametros.estado,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_contenido=v_parametros.id_contenido;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Contenido modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_contenido',v_parametros.id_contenido::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'CMS_CON_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		23-09-2018 18:04:19
	***********************************/

	elsif(p_transaccion='CMS_CON_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from cms.tcontenido
            where id_contenido=v_parametros.id_contenido;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Contenido eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_contenido',v_parametros.id_contenido::varchar);
              
            --Devuelve la respuesta
            return v_resp;

		end;
         
	else
     
    	raise exception 'Transaccion inexistente: %',p_transaccion;

	end if;

EXCEPTION
				
	WHEN OTHERS THEN
		v_resp='';
		v_resp = pxp.f_agrega_clave(v_resp,'mensaje',SQLERRM);
		v_resp = pxp.f_agrega_clave(v_resp,'codigo_error',SQLSTATE);
		v_resp = pxp.f_agrega_clave(v_resp,'procedimientos',v_nombre_funcion);
		raise exception '%',v_resp;
				        
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE
COST 100;
ALTER FUNCTION "cms"."ft_contenido_ime"(integer, integer, character varying, character varying) OWNER TO postgres;
