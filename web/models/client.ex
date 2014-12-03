defmodule Client do

  defstruct client_id: "", rfc: "", name: "", addres_id: "", street: "", zip_code: "", neighborhood: "", state: "", locality: "", county: "", external_number: "", internal_number: "", country: "", reference: ""
  
  def fetch_data(rfc, client) do

    :odbc.start()
    {:ok, _ref} = :odbc.connect('DSN=Hetzner;UID=sa;PWD=RakuRaku1',[])

    query = 'SELECT e.idInternal AS empresaId, e.rfc, e.razonSocial, 
            u.idinternal AS domicilioId, u.calle, u.codigoPostal, u.colonia, u.estado, u.localidad, u.municipio, u.noExterior, u.noInterior, u.pais, u.referencia 
            FROM empresa e 
            INNER JOIN ubicacion u ON u.idinternal = e.ubicacion 
            WHERE e.rfc = ?'

    query_parameter = [{{:sql_varchar, 13}, [rfc]}]
    tax_data = :odbc.param_query(_ref, query, query_parameter)
    results_list = elem(tax_data, 2)
    results = hd(results_list)

    client = %{client | client_id: to_string(elem(results, 0)), rfc: to_string(elem(results, 1)), name: to_string(elem(results, 2)), 
            addres_id: to_string(elem(results, 3)), street: to_string(elem(results, 4)), zip_code: to_string(elem(results, 5)), 
            neighborhood: to_string(elem(results, 6)), state: to_string(elem(results, 7)), locality: to_string(elem(results, 8)),
            county: to_string(elem(results, 9)), external_number: to_string(elem(results, 10)), internal_number: to_string(elem(results, 11)),
            country: to_string(elem(results, 12)), reference: to_string(elem(results, 13))}

    :odbc.stop()

    [empresaId: client.client_id, rfc: client.rfc, razonSocial: client.name, domicilioId: client.addres_id, calle: client.street, codigoPostal: client.zip_code, colonia: client.neighborhood, estado: client.state, localidad: client.locality, municipio: client.county, noExterior: client.external_number, noInterior: client.internal_number, pais: client.country, referencia: client.reference]
  end
end