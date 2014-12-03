defmodule Permission do

	defstruct permissionId: false, generaCfdPortal: false, generaCfdPost: false, generaCfdWS: false, cancelaCfdPortal: false, cancelaCfdPost: false, cancelaCfdWS: false, transformaCfdPost: false, reporteMensualSatPortal: false, reporteMensualSatWS: false, envioLigaDescarga: false, trackingEmail: false, envioCfdSftp: false, envioCfdCorreo: false, sftp: false, email: false, ws: false, fileUpload: false, wsBase64: false, generaTimbreWS: false, generaCfdiWS: false, codigoQrWS: false, envioXMLPdf: false, nominaEmisionWS: false, nominaTimbreWS: false

  def permissions(rfc, permission) do
	
  	:odbc.start()
    {:ok,_ref} = :odbc.connect('DSN=Hetzner;UID=sa;PWD=RakuRaku1',[])
    
    query = 'SELECT cp.idInternal AS configuracionPermisosId, cp.generaCfdPortal, cp.generaCfdPost, cp.generaCfdWS, cp.cancelaCfdPortal, cp.cancelaCfdPost, cp.cancelaCfdWS, cp.transformaCfdPost, cp.reporteMensualSatPortal, cp.reporteMensualSatWS, cp.envioLigaDescarga, cp.trackingEmail, cp.envioCfdSftp, cp.envioCfdCorreo, cp.sftp, cp.email, cp.ws, cp.fileUpload, cp.wsBase64, cp.generaTimbreWS, cp.generaCfdiWS, cp.codigoQrWS, cp.envioXMLPdf, cp.nominaEmisionWS, cp.nominaTimbreWS 
      FROM CONFIGURACION_PERMISOS cp 
      INNER JOIN EMPRESA e on cp.idInternal = e.configuracionPermisos 
      WHERE e.rfc = ?'

    query_parameter = [{{:sql_varchar, 13}, [rfc]}]
    status = :odbc.param_query(_ref, query, query_parameter)

    results_list = elem(status, 2)
    results = hd(results_list)

    permission = %{permission | permissionId: parse_permission(elem(results, 0)), generaCfdPortal: parse_permission(elem(results, 1)), generaCfdPost: parse_permission(elem(results, 2)), 
      generaCfdWS: parse_permission(elem(results, 3)), cancelaCfdPortal: parse_permission(elem(results, 4)), cancelaCfdPost: parse_permission(elem(results, 5)), 
      cancelaCfdWS: parse_permission(elem(results, 6)), transformaCfdPost: parse_permission(elem(results, 7)), reporteMensualSatPortal: parse_permission(elem(results, 8)), 
      reporteMensualSatWS: parse_permission(elem(results, 9)), envioLigaDescarga: parse_permission(elem(results, 10)), trackingEmail: parse_permission(elem(results, 11)), 
      envioCfdSftp: parse_permission(elem(results, 12)), envioCfdCorreo: parse_permission(elem(results, 13)), sftp: parse_permission(elem(results, 14)), email: parse_permission(elem(results, 15)), 
      ws: parse_permission(elem(results, 16)), fileUpload: parse_permission(elem(results, 17)), wsBase64: parse_permission(elem(results, 18)), generaTimbreWS: parse_permission(elem(results, 19)), 
      generaCfdiWS: parse_permission(elem(results, 20)), codigoQrWS: parse_permission(elem(results, 21)), envioXMLPdf: parse_permission(elem(results, 22)), nominaEmisionWS: parse_permission(elem(results, 23)), nominaTimbreWS: parse_permission(elem(results, 24))}

    :odbc.stop()
    [permisoId: permission.permissionId, generaCfdPortal: permission.generaCfdPortal, generaCfdPost: permission.generaCfdPost, generaCfdWS: permission.generaCfdWS, cancelaCfdPortal: permission.cancelaCfdPortal, cancelaCfdPost: permission.cancelaCfdPost, cancelaCfdWS: permission.cancelaCfdWS, transformaCfdPost: permission.transformaCfdPost, reporteMensualSatPortal: permission.reporteMensualSatPortal, reporteMensualSatWS: permission.reporteMensualSatWS, envioLigaDescarga: permission.envioLigaDescarga, trackingEmail: permission.trackingEmail, envioCfdSftp: permission.envioCfdSftp, envioCfdCorreo: permission.envioCfdCorreo, sftp: permission.sftp, email: permission.email, ws: permission.ws, fileUpload: permission.fileUpload, wsBase64: permission.wsBase64, generaTimbreWS: permission.generaTimbreWS, generaCfdiWS: permission.generaCfdiWS, codigoQrWS: permission.codigoQrWS, envioXMLPdf: permission.envioXMLPdf, nominaEmisionWS: permission.nominaEmisionWS, nominaTimbreWS: permission.nominaTimbreWS]

	end

	def parse_permission(permission) do
		if permission == 1 do
  		true
  	else 
  		false
		end
	end	
end