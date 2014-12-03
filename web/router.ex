defmodule Router.Router do
  use Phoenix.Router

  scope "/" do
    # Use the default browser stack.
    pipe_through :browser

    get "/", Router.PageController, :index, as: :pages
  end

  #obtiene los datos fiscales de un cliente para un cliente
  scope "v1/clientes/:rfc" do
    get "/", Router.ClientController, :client
  end

  #obtiene los permisos para un cliente con el rfc especifico
  scope "v1/clientes/:rfc/permisos" do
    get "/", Router.ClientController, :permissions
  end

  #obtiene las sucursales de un rfc
  scope "v1/clientes/:rfc/sucursales" do
     get "/", Router.ClientController, :branch_office
  end
end
