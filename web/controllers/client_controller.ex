defmodule Router.ClientController do
  use Phoenix.Controller

  plug :action

  def client(conn, _params) do
    authenticate(conn)
    client = %Client{}
    result = _params["rfc"]
            |> to_char_list
            |> Client.fetch_data(client)
    json conn, JSON.encode!(result)
  end

  def permissions(conn, _params) do
    authenticate(conn)
    permission = %Permission{}
    result = _params["rfc"]
            |> to_char_list
            |> Permission.permissions(permission)

    json conn, JSON.encode!(result)
  end

  def branch_office(conn, _params) do
    authenticate(conn)
    branchOffice = %BranchOffice{}
    result = _params["rfc"]
            |> to_char_list
            |> BranchOffice.fetch_branch_office(branchOffice)
    json conn, JSON.encode!(result)
  end

  defp authenticate(conn) do
    auth = conn |> get_req_header("authorization")
    user = %User{}
    if !User.authenticate(auth) do
      conn
      |> put_resp_content_type("text/plain")
      |> put_resp_header("WWW-Authenticate","Basic")
      |> send_resp(401, "Authentication Failed")
      |> halt
    end
  end

end




