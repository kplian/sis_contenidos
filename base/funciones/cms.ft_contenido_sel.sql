CREATE OR REPLACE FUNCTION "cms"."ft_contenido_sel"(	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$
/**************************************************************************
 SISTEMA:		Contenidos
 FUNCION: 		cms.ft_contenido_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'cms.tcontenido'
 AUTOR: 		 (admin)
 FECHA:	        23-09-2018 18:04:19
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				23-09-2018 18:04:19								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'cms.tcontenido'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'cms.ft_contenido_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'CMS_CON_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		23-09-2018 18:04:19
	***********************************/

	if(p_transaccion='CMS_CON_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						con.id_contenido,
						con.nombre,
						con.estado_reg,
						con.orden,
						con.estado,
						con.id_usuario_reg,
						con.fecha_reg,
						con.usuario_ai,
						con.id_usuario_ai,
						con.fecha_mod,
						con.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod	
						from cms.tcontenido con
						inner join segu.tusuario usu1 on usu1.id_usuario = con.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = con.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'CMS_CON_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		23-09-2018 18:04:19
	***********************************/

	elsif(p_transaccion='CMS_CON_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_contenido)
					    from cms.tcontenido con
					    inner join segu.tusuario usu1 on usu1.id_usuario = con.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = con.id_usuario_mod
					    where ';
			
			--Definicion de la respuesta		    
			v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;

		end;

	/*********************************
 	#TRANSACCION:  'CMS_WEB_SEL'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin
 	#FECHA:		23-09-2018 18:04:19
	***********************************/

	elsif(p_transaccion='CMS_WEB_SEL')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='


										select to_json(array_to_json(array_agg(contenido)) :: text) #>> ''{}'' as json
										from
										(
											select c.nombre,c.estado,c.orden,
														(
															select array_to_json(array_agg(tp))
															from (
																		 select ta.nombre,
																						 (
																							 select row_to_json(a)
																							 from
																							 (
																											SELECT a.id_tabla,a.folder,a.extension,a.nombre_archivo,
																														(
																															select array_to_json(array_agg(fields))
																															from
																																(
																																	SELECT fta.nombre,fva.valor
																																	FROM param.tfield_tipo_archivo fta
																																		INNER JOIN param.tfield_valor_archivo fva ON fva.id_field_tipo_archivo = fta.id_field_tipo_archivo
																																	WHERE fta.id_tipo_archivo = ta.id_tipo_archivo AND fva.id_archivo = a.id_archivo
																																) fields


																														) AS valores
																											FROM param.tarchivo a
																											WHERE a.id_tipo_archivo = ta.id_tipo_archivo and a.id_tabla = c.id_contenido
																											LIMIT 1
																							 ) a


																						 ) AS archivo

																		 FROM param.ttipo_archivo ta
																		 where ta.tabla = ''tcontenido''
																	 ) tp
														) as tipo_archivo
											from cms.tcontenido c
										) contenido

			';


			--Devuelve la respuesta
			return v_consulta;

		end;

	else
					     
		raise exception 'Transaccion inexistente';
					         
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
ALTER FUNCTION "cms"."ft_contenido_sel"(integer, integer, character varying, character varying) OWNER TO postgres;
