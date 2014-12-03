defmodule Router.Router do
  use Phoenix.Router

  scope "/" do
    # Use the default browser stack.
    pipe_through :browser

    get "/", Router.ClientController, :index, as: :pages
  end

  #obtiene los datos fiscales de un cliente para un cliente
  scope "api/v1/clientes/:rfc" do
    get "/", Router.ClientController, :client
  end

  #obtiene el estatus de un rfc
  # scope "api/v1/clients/:rfc/branches" do
  #   get "/", Router.ClientController, :status
  # end

  #obtiene los permisos para un cliente con el rfc especifico
  scope "api/v1/clients/:rfc/permissions" do
    get "/", Router.ClientController, :permissions
  end
end
