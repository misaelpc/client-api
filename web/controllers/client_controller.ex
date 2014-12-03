defmodule Router.ClientController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    render conn, "index"
  end

  def client(conn, _params) do
    client = %Client{}
    result = Client.fetch_data(to_char_list(_params["rfc"]), client)
    json conn, JSON.encode!(result)
  end

  def permissions(conn, _params) do
    permission = %Permission{}
    result = Permission.permissions(to_char_list(_params["rfc"]), permission)
    json conn, JSON.encode!(result)
  end

  def branch_office(conn, _params) do
    branchOffice = %BranchOffice{}
    result = BranchOffice.fetch_branch_office(to_char_list(_params["rfc"]), branchOffice)
    json conn, JSON.encode!(result)
  end

end




