CREATE OR REPLACE FUNCTION "cms"."ft_categoria_ime" (	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$

/**************************************************************************
 SISTEMA:		Contenidos
 FUNCION: 		cms.ft_categoria_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'cms.tcategoria'
 AUTOR: 		 (admin)
 FECHA:	        30-10-2018 14:04:46
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				30-10-2018 14:04:46								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'cms.tcategoria'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_categoria	integer;
			    
BEGIN

    v_nombre_funcion = 'cms.ft_categoria_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'CMS_CAT_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		30-10-2018 14:04:46
	***********************************/

	if(p_transaccion='CMS_CAT_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into cms.tcategoria(
			nombre,
			estado_reg,
			id_usuario_ai,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.nombre,
			'activo',
			v_parametros._id_usuario_ai,
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_categoria into v_id_categoria;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Categoria almacenado(a) con exito (id_categoria'||v_id_categoria||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_categoria',v_id_categoria::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'CMS_CAT_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		30-10-2018 14:04:46
	***********************************/

	elsif(p_transaccion='CMS_CAT_MOD')then

		begin
			--Sentencia de la modificacion
			update cms.tcategoria set
			nombre = v_parametros.nombre,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_categoria=v_parametros.id_categoria;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Categoria modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_categoria',v_parametros.id_categoria::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'CMS_CAT_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		30-10-2018 14:04:46
	***********************************/

	elsif(p_transaccion='CMS_CAT_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from cms.tcategoria
            where id_categoria=v_parametros.id_categoria;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Categoria eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_categoria',v_parametros.id_categoria::varchar);
              
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
ALTER FUNCTION "cms"."ft_categoria_ime"(integer, integer, character varying, character varying) OWNER TO postgres;
