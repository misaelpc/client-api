defmodule Router.Router do
  use Phoenix.Router

  scope "/" do
    # Use the default browser stack.
    pipe_through :browser

    get "/", Router.PageController, :index, as: :pages
  end



  #Other scopes may use custom stacks.
  scope "/client/:rfc" do
    get "/", Router.ClientController, :client
  end
end
