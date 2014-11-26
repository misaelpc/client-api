defmodule Router.Router do
  use Phoenix.Router

  scope "/" do
    # Use the default browser stack.
    pipe_through :browser

    get "/", Router.PageController, :index, as: :pages
  end

  #obtiene los datos fiscales de un rfc
  scope "api/v1/clients/datosFiscales/:rfc" do
    get "/", Router.ClientController, :datos_fiscales
  end

  #obtiene el estatus de un rfc
  scope "api/v1/clients/statuses/:rfc" do
    get "/", Router.ClientController, :status
  end
end
