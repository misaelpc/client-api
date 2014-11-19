use Mix.Config

# ## SSL Support
#
# To get SSL working, you will need to set:
#
#     https: [port: 443,
#             keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#             certfile: System.get_env("SOME_APP_SSL_CERT_PATH")]
#
# Where those two env variables point to a file on
# disk for the key and cert.

config :phoenix, Router.Router,
  url: [host: "example.com"],
  http: [port: System.get_env("PORT")],
  secret_key_base: "NsJhKrMqVHV4oAzf/2oQw3r4p3RK3hf0xjfMa48ZwCNEsVv6UU+VRSGe9YZ/j0ES3Z/jZyzNvUvyRlYuDDLysg=="

config :logger, :console,
  level: :info
