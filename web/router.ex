defmodule Router.Router do
  use Phoenix.Router


  pipeline :api do
    
  end

  scope "/v1" do
    pipe_through :api
    get "/clientes/:rfc", Router.ClientController, :client
    get "/clientes/:rfc/permisos", Router.ClientController, :permissions
    get "/clientes/:rfc/sucursales", Router.ClientController, :branch_office
  end

end
