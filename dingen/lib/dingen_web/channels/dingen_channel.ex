defmodule DingenWeb.DingenChannel do
  use DingenWeb, :channel

  def join("dingen", _params, socket) do
    {:ok, socket}
  end

  def handle_in("woof", _, socket) do
    broadcast! socket, "woof", %{}
    {:noreply, socket}
  end

  def terminate(_reason, socket) do
    {:ok, socket}
  end
end
