defmodule LvjsDemoWeb.AnimalLive.Index do
  use LvjsDemoWeb, :live_view

  alias LvjsDemo.Animals
  alias LvjsDemo.Animals.Animal

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :animals, Animals.list_animals())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Animal")
    |> assign(:animal, Animals.get_animal!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Animal")
    |> assign(:animal, %Animal{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Animals")
    |> assign(:animal, nil)
  end

  @impl true
  def handle_info({LvjsDemoWeb.AnimalLive.FormComponent, {:saved, animal}}, socket) do
    {:noreply, stream_insert(socket, :animals, animal)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    animal = Animals.get_animal!(id)
    {:ok, _} = Animals.delete_animal(animal)

    {:noreply, stream_delete(socket, :animals, animal)}
  end
end
