defmodule Router.PageController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    render conn, "index"
  end

  def show_root(conn, _params) do
    :odbc.start
    database = :odbc.connect('DSN=Hetzner;UID=sa;PWD=RakuRaku1', [])

    json conn, JSON.encode!(database)
  end

  def not_found(conn, _params) do
    render conn, "not_found"
  end

  def error(conn, _params) do
    render conn, "error"
  end
end
