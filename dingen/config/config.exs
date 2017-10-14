# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :dingen,
  ecto_repos: [Dingen.Repo]

# Configures the endpoint
config :dingen, DingenWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "42IZ3PDM9nFlsoP5jzenEi7PK7czbtUrkkZZdxPZXOnwOb8WkJdfyMTwy0ZzmYZ/",
  render_errors: [view: DingenWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Dingen.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
