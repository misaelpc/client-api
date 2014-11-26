defmodule Permission do

	defstruct generaCfdPortal: true, generaCfdPost: true

	def permissions(rfc,permission) do
		:odbc.start()
    {:ok,_ref} = :odbc.connect('DSN=Hetzner;UID=sa;PWD=RakuRaku1',[])
    query = 'SELECT cp.idInternal AS configuracionPermisosId, cp.generaCfdPortal, cp.generaCfdPost, cp.generaCfdWS, cp.cancelaCfdPortal, cp.cancelaCfdPost, cp.cancelaCfdWS, cp.transformaCfdPost, cp.reporteMensualSatPortal, cp.reporteMensualSatWS, cp.envioLigaDescarga, cp.trackingEmail, cp.envioCfdSftp, cp.envioCfdCorreo, cp.sftp, cp.email, cp.ws, cp.fileUpload, cp.wsBase64, cp.generaTimbreWS, cp.generaCfdiWS, cp.codigoQrWS, cp.envioXMLPdf, cp.nominaEmisionWS, cp.nominaTimbreWS FROM CONFIGURACION_PERMISOS cp INNER JOIN EMPRESA e on cp.idInternal = e.configuracionPermisos WHERE e.rfc = ?'

    query_parameter = [{{:sql_varchar, 13}, [rfc]}]
    status = :odbc.param_query(_ref, query, query_parameter)

    results_list = elem(status,2)
    results = hd(results_list)

    permission = %{permission | generaCfdPortal: parse_permission(elem(results,1)), 
                      						generaCfdPost: parse_permission(elem(results,2))}

    :odbc.stop()
    [generaCfdPortal: permission.generaCfdPortal, generaCfdPost: permission.generaCfdPost]

	end

	def parse_permission(permission) do
		if permission == 1 do
  		true
  	else 
  		false
		end
	end	
end