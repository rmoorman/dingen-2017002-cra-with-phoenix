defmodule DingenWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :dingen

  socket "/api/socket", DingenWeb.UserSocket

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phoenix.digest
  # when deploying your static files in production.
  #plug Plug.Static,
  #  at: "/", from: :dingen, gzip: false,
  #  only: ~w(css fonts images js favicon.ico robots.txt)
  plug Plug.Static.IndexHtml,
    at: "/frontend/"

  plug Plug.Static,
    at: "/frontend/",
    from: {:dingen, "priv/static/frontend/"},
    only: ~w(static asset-manifest.json favicon.ico index.html manifest.json)

  plug Plug.Static.IndexHtml,
    at: "/admin/"

  plug Plug.Static,
    at: "/admin/",
    from: {:dingen, "priv/static/admin/"},
    only: ~w(static asset-manifest.json favicon.ico index.html manifest.json)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session,
    store: :cookie,
    key: "_dingen_key",
    signing_salt: "HNG17rvm"

  plug DingenWeb.Router

  @doc """
  Callback invoked for dynamically configuring the endpoint.

  It receives the endpoint configuration and checks if
  configuration should be loaded from the system environment.
  """
  def init(_key, config) do
    if config[:load_from_system_env] do
      port = System.get_env("PORT") || raise "expected the PORT environment variable to be set"
      {:ok, Keyword.put(config, :http, [:inet6, port: port])}
    else
      {:ok, config}
    end
  end
end
