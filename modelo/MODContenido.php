<?php
/**
*@package pXP
*@file gen-MODContenido.php
*@author  (admin)
*@date 23-09-2018 18:04:19
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODContenido extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarContenido(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='cms.ft_contenido_sel';
		$this->transaccion='CMS_CON_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_contenido','int4');
		$this->captura('nombre','varchar');
		$this->captura('estado_reg','varchar');
		$this->captura('orden','int4');
		$this->captura('estado','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarContenido(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='cms.ft_contenido_ime';
		$this->transaccion='CMS_CON_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('nombre','nombre','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('orden','orden','int4');
		$this->setParametro('estado','estado','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarContenido(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='cms.ft_contenido_ime';
		$this->transaccion='CMS_CON_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_contenido','id_contenido','int4');
		$this->setParametro('nombre','nombre','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('orden','orden','int4');
		$this->setParametro('estado','estado','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarContenido(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='cms.ft_contenido_ime';
		$this->transaccion='CMS_CON_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_contenido','id_contenido','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}


    function listarContenidoParaWeb(){
        //Definicion de variables para ejecucion del procedimientp
        $this->procedimiento='cms.ft_contenido_sel';
        $this->transaccion='CMS_WEB_SEL';
        $this->tipo_procedimiento='SEL';//tipo de transaccion
        $this->count=false;

        //Definicion de la lista del resultado del query
        $this->captura('json','text');

        //Ejecuta la instruccion
        $this->armarConsulta();
        $this->ejecutarConsulta();

        //Devuelve la respuesta
        return $this->respuesta;
    }
			
}
?>