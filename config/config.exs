use Mix.Config

config :northwind_api,
  ecto_repos: [NorthwindApi.Repo]

# Configures the endpoint
config :northwind_api, NorthwindApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ox3B1yYgWPro253NoRDJJqYqpWXPaWmxpnayUWbO8T9BpgUR3jCICLd9LxZOtzr1",
  render_errors: [view: NorthwindApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: NorthwindApi.PubSub,
  live_view: [signing_salt: "vbVX1VHo"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :northwind_api, :phoenix_swagger,
  swagger_files: %{
    "priv/static/swagger.json" => [
      router: NorthwindApiWeb.Router,
      endpoint: NorthwindApiWeb.Endpoint
    ]
  }

config :phoenix_swagger, json_library: Jason

config :cors_plug,
  origin: ["https://localhost:44327"],
  max_age: 86400,
  methods: ["GET", "POST"]

import_config "#{Mix.env()}.exs"
