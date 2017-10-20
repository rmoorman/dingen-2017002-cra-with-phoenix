defmodule DingenWeb.DingenChannel do
  use DingenWeb, :channel

  def join("dingen", _params, socket) do
    {:ok, socket}
  end

  def terminate(_reason, socket) do
    {:ok, socket}
  end
end
