defmodule Router.Router do
  use Phoenix.Router

  scope "/" do
    # Use the default browser stack.
    pipe_through :browser

    get "/", Router.PageController, :index, as: :pages
  end

  #Other scopes may use custom stacks.
  scope "api/v1/clients/:rfc" do
    pipe_through :browser
    get "/", Router.ClientController, :client
  end

  #obtiene los datos fiscales de un rfc
  scope "api/v1/clients/datosFiscales/:rfc" do
    get "/", Router.ClientController, :datos_fiscales
  end

  #obtiene el estatus de un rfc
  scope "api/v1/clients/status/:rfc" do
    get "/", Router.ClientController, :status
  end
end
