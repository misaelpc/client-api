defmodule Router.Router do
  use Phoenix.Router

  scope "/" do
    # Use the default browser stack.
    pipe_through :browser

    get "/", Router.PageController, :index, as: :pages
  end



  #Other scopes may use custom stacks.
  scope "/api" do
    pipe_through :api

    get "/", Router.PageController, :show_root
  end
end
