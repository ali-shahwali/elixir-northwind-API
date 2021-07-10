use Mix.Config

config :northwind_api, NorthwindApiWeb.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [scheme: "https", host: "warm-bayou-39031.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/cache_manifest.json"

# Do not print debug messages in production
config :logger, level: :info

import_config "prod.secret.exs"
