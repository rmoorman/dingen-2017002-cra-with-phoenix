defmodule DingenWeb.Router do
  use DingenWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DingenWeb do
    pipe_through :api
  end
end
