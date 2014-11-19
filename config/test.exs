use Mix.Config

config :phoenix, Router.Router,
  http: [port: System.get_env("PORT") || 4001],
  catch_errors: false
