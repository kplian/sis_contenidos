<?php
/**
*@package pXP
*@file gen-ACTContenido.php
*@author  (admin)
*@date 23-09-2018 18:04:19
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTContenido extends ACTbase{    
			
	function listarContenido(){
		$this->objParam->defecto('ordenacion','id_contenido');

		$this->objParam->defecto('dir_ordenacion','asc');

        if($this->objParam->getParametro('id_contenido')!=''){
            $this->objParam->addFiltro("con.id_contenido = ".$this->objParam->getParametro('id_contenido'));
        }
        if($this->objParam->getParametro('id_categoria')!=''){
            $this->objParam->addFiltro("cate.id_categoria = ".$this->objParam->getParametro('id_categoria'));
            $this->objParam->addFiltro("con.estado = ''ACTIVO'' ");
        }

		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODContenido','listarContenido');
		} else{
			$this->objFunc=$this->create('MODContenido');
			
			$this->res=$this->objFunc->listarContenido($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarContenido(){
		$this->objFunc=$this->create('MODContenido');	
		if($this->objParam->insertar('id_contenido')){
			$this->res=$this->objFunc->insertarContenido($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarContenido($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarContenido(){
			$this->objFunc=$this->create('MODContenido');	
		$this->res=$this->objFunc->eliminarContenido($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}

	function listarContenidoParaWeb(){
			$this->objFunc=$this->create('MODContenido');
		$this->res=$this->objFunc->listarContenidoParaWeb($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
	function listarMenuWeb(){
			$this->objFunc=$this->create('MODContenido');
		$this->res=$this->objFunc->listarMenuWeb($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}


			
}

?>