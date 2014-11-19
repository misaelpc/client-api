defmodule Router.ClientController do
  use Phoenix.Controller

  plug :action

  def client(conn, _params) do
    :odbc.start
    database = :odbc.connect('DSN=Hetzner;UID=sa;PWD=RakuRaku1', [])

    json conn, JSON.encode!(database)
  end

end