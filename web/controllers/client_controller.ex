defmodule Router.ClientController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    render conn, "index"
  end

  def client(conn, _params) do
    client = %Client{}
    rfc = to_char_list(_params["rfc"])
    result = Client.client_location(rfc,client)
    json conn, JSON.encode!(result)
  end

  def permissions(conn, _params) do
    permission = %Permission{}
    rfc = to_char_list(_params["rfc"])
    result = Permission.permissions(rfc,permission)
    json conn, JSON.encode!(result)
  end

end




