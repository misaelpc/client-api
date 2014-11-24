defmodule Router.Router do
  use Phoenix.Router

  scope "/" do
    # Use the default browser stack.
    pipe_through :browser

    get "/", Router.PageController, :index, as: :pages
  end



  #Other scopes may use custom stacks.
  scope "api/v1/clients/:rfc" do
    get "/", Router.ClientController, :datos_fiscales
  end

    #Other scopes may use custom stacks.
  scope "api/v1/permisos/:rfc" do
    get "/", Router.ClientController, :get_permisos
  end
end
