defmodule Router.ClientController do
  use Phoenix.Controller
  import Client

  plug :action

  def index(conn, _params) do
    render conn, "index"
  end

  def datos_fiscales(conn, _params) do
    
    rfc = to_char_list(_params["rfc"])
    json conn, JSON.encode!(client_location(rfc))
  end

  def status(conn, _params) do
    rfc = to_char_list(_params["rfc"])
    json conn, JSON.encode!(client_permissions(rfc))
  end

end




