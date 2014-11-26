defmodule Client do

	def client_location(rfc) do 
		:odbc.start()
    {:ok,_ref} = :odbc.connect('DSN=Hetzner;UID=sa;PWD=RakuRaku1',[])
    query = 'SELECT u.idinternal AS domicilioId, u.calle, u.codigoPostal, u.colonia, u.estado, u.localidad, u.municipio, u.noExterior, u.noInterior, u.pais, u.referencia, e.idInternal AS empresaId, s.nombre, s.alias, s.idinternal AS sucursalId FROM empresa e INNER JOIN ubicacion u ON u.idinternal = e.ubicacion INNER JOIN sucursal s ON s.empresa_id = e.idinternal WHERE e.rfc = ?'
    
    query_parameter = [{{:sql_varchar, 13}, [rfc]}]
    datos_fiscales = :odbc.param_query(_ref, query, query_parameter)

    :odbc.stop()
    datos_fiscales
	end

	def client_permissions(rfc) do
		:odbc.start()
    {:ok,_ref} = :odbc.connect('DSN=Hetzner;UID=sa;PWD=RakuRaku1',[])
    query = 'SELECT cp.idInternal AS configuracionPermisosId, cp.generaCfdPortal, cp.generaCfdPost, cp.generaCfdWS, cp.cancelaCfdPortal, cp.cancelaCfdPost, cp.cancelaCfdWS, cp.transformaCfdPost, cp.reporteMensualSatPortal, cp.reporteMensualSatWS, cp.envioLigaDescarga, cp.trackingEmail, cp.envioCfdSftp, cp.envioCfdCorreo, cp.sftp, cp.email, cp.ws, cp.fileUpload, cp.wsBase64, cp.generaTimbreWS, cp.generaCfdiWS, cp.codigoQrWS, cp.envioXMLPdf, cp.nominaEmisionWS, cp.nominaTimbreWS FROM CONFIGURACION_PERMISOS cp INNER JOIN EMPRESA e on cp.idInternal = e.configuracionPermisos WHERE e.rfc = ?'

    query_parameter = [{{:sql_varchar, 13}, [rfc]}]
    status = :odbc.param_query(_ref, query, query_parameter)

    :odbc.stop()
    status
	end

end
