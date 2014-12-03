defmodule Router.ClientController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    #results = hd(conn.req_headers)
    auth = conn |> get_req_header("authorization")
    #conn = conn.put_resp_header(conn,"WWW-Authenticate","Basic")
    user = %User{}
    User.authenticate(auth)
    
    conn
    |> put_resp_content_type("text/plain")
    |> put_resp_header("WWW-Authenticate","Basic")
    |> send_resp(200, auth)
  end

  def client(conn, _params) do
    client = %Client{}
    result = Client.fetch_data(to_char_list(_params["rfc"]), client)
    json conn, JSON.encode!(result)
  end

  def permissions(conn, _params) do
    permission = %Permission{}
    rfc = to_char_list(_params["rfc"])
    result = Permission.permissions(rfc,permission)
    json conn, JSON.encode!(result)
  end

  def authenticate(conn, _params) do
    auth = conn |> get_req_header("authorization")
    user = %User{}
    User.authenticate(auth)
  end

end




