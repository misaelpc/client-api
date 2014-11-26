defmodule Client do

	defstruct street: "Reforma 107", zip_code: "09510"

	def client_location(rfc,client) do

		:odbc.start()
    {:ok,_ref} = :odbc.connect('DSN=Hetzner;UID=sa;PWD=RakuRaku1',[])
    query = 'SELECT u.idinternal AS domicilioId, u.calle, u.codigoPostal, u.colonia, u.estado, u.localidad, u.municipio, u.noExterior, u.noInterior, u.pais, u.referencia, e.idInternal AS empresaId, s.nombre, s.alias, s.idinternal AS sucursalId FROM empresa e INNER JOIN ubicacion u ON u.idinternal = e.ubicacion INNER JOIN sucursal s ON s.empresa_id = e.idinternal WHERE e.rfc = ?'
    
    query_parameter = [{{:sql_varchar, 13}, [rfc]}]
    datos_fiscales = :odbc.param_query(_ref, query, query_parameter)
    results_list = elem(datos_fiscales,2)
    results = hd(results_list)
    client = %{client | street: to_string(elem(results,1)), 
                      zip_code: to_string(elem(results,2))}

    :odbc.stop()
    [street: client.street, zip_code: client.zip_code]
	end

end
