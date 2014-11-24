defmodule Router.ClientController do
  use Phoenix.Controller

  plug :action

  def client(conn, _params) do
    :odbc.start
    database = :odbc.connect('DSN=Hetzner;UID=sa;PWD=RakuRaku1', [])
    json conn, 200 , JSON.encode!(headers)
  end

  def datos_fiscales(conn, _params) do
    
    :odbc.start()
    {:ok,_ref} = :odbc.connect('DSN=Hetzner;UID=sa;PWD=RakuRaku1',[])
    query = 'SELECT u.idinternal AS domicilioId, u.calle, u.codigoPostal, u.colonia, u.estado, u.localidad, u.municipio, u.noExterior, u.noInterior, u.pais, u.referencia, e.idInternal AS empresaId, s.nombre, s.alias, s.idinternal AS sucursalId FROM empresa e INNER JOIN ubicacion u ON u.idinternal = e.ubicacion INNER JOIN sucursal s ON s.empresa_id = e.idinternal WHERE e.rfc = ?'
    
    query_parameter = [{{:sql_varchar, 13}, [to_char_list(_params["rfc"])]}]
    datos_fiscales = :odbc.param_query(_ref, query, query_parameter)

    :odbc.stop()
    
    json conn, JSON.encode!(datos_fiscales)
  end

  def status(conn, _params) do
    :odbc.start
    database = :odbc.connect('DSN=Hetzner;UID=sa;PWD=RakuRaku1', [])

    json conn, JSON.encode!(database)
  end

end