defmodule BranchOffice do

  defstruct branchId: "", name: "", alias: ""
    
  def fetch_branch_office(rfc, branchOffice) do
    execute_query(rfc, branchOffice) |> response
  end

  def execute_query(rfc, branchOffice) do
    :odbc.start()
    {:ok, _ref} = :odbc.connect('DSN=Hetzner;UID=sa;PWD=RakuRaku1',[])

    branch_office_query = 'SELECT s.alias, s.nombre,
                    u.idinternal AS domicilioId, u.calle, u.codigoPostal, u.colonia, u.estado, u.localidad, u.municipio, u.noExterior, u.noInterior, u.pais, u.referencia 
                    FROM sucursal s 
                    INNER JOIN empresa e ON e.idinternal = s.empresa_id
                    INNER JOIN ubicacion u ON u.idinternal = s.ubicacion 
                    WHERE e.rfc = ?'

    query_parameter = [{{:sql_varchar, 13}, [rfc]}]
    branch_offices = :odbc.param_query(_ref, branch_office_query, query_parameter)

    results_list = elem(branch_offices, 2)

    :odbc.stop()

    {results_list, branchOffice}
  end

  def response({results_list, branchOffice}) when length(results_list) == 0 do
    branchOffice = %{branchOffice | branchId: "branchIdCero", name: "nameCero", alias: "aliasCero"}

    [sucursalId: branchOffice.branchId, nombre: branchOffice.name, alias: branchOffice.alias]
  end

  def response({results_list, branchOffice}) when length(results_list) > 0 do

    branchOffice = %{branchOffice | branchId: "branchIdOne", name: "nameOne", alias: "aliasOne"}

    [sucursalId: branchOffice.branchId, nombre: branchOffice.name, alias: branchOffice.alias]
  end
end