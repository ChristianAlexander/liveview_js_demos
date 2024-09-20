defmodule LvjsDemoWeb.OptimisticCartLive do
  use LvjsDemoWeb, :live_view
  alias Phoenix.LiveView.JS

  @impl true
  def mount(_params, _session, socket) do
    cart_items = [
      %{id: "1", name: "Vintage Leather Jacket", price: 199.99, quantity: 1},
      %{id: "2", name: "Noise-Cancelling Headphones", price: 299.99, quantity: 1},
      %{id: "3", name: "Smart Home Hub", price: 129.99, quantity: 2},
      %{id: "4", name: "Organic Loose Leaf Tea Set", price: 49.99, quantity: 1}
    ]

    {:ok, assign(socket, cart_items: cart_items)}
  end

  @impl true
  def handle_event("remove_item", %{"id" => id}, socket) do
    # Simulate a delay to show optimistic UI
    Process.sleep(1000)

    updated_items = Enum.reject(socket.assigns.cart_items, &(&1.id == id))
    {:noreply, assign(socket, cart_items: updated_items)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="container mx-auto px-4 py-8">
      <h1 class="text-3xl font-bold mb-8">Your Shopping Cart</h1>
      <div class="bg-white shadow-md rounded-lg overflow-hidden">
        <ul id="cart-items" class="divide-y divide-gray-200">
          <%= for item <- @cart_items do %>
            <li id={"cart-item-#{item.id}"} phx-update="replace" class="flex items-center py-4 px-6">
              <div class="flex-1">
                <h3 class="text-lg font-semibold"><%= item.name %></h3>
                <p class="text-gray-600">Quantity: <%= item.quantity %></p>
              </div>
              <div class="text-right">
                <p class="text-lg font-bold">
                  $<%= :erlang.float_to_binary(item.price * item.quantity, decimals: 2) %>
                </p>
                <button
                  phx-click={
                    JS.push("remove_item", loading: "#total", value: %{id: item.id})
                    |> JS.transition({"ease-in-out duration-300", "opacity-100", "opacity-50"},
                      time: 300,
                      to: "#cart-item-#{item.id}"
                    )
                  }
                  phx-disable-with="Removing"
                  class="mt-2 px-4 py-2 bg-red-500 text-white rounded hover:bg-red-600 transition duration-300"
                >
                  Remove
                </button>
              </div>
            </li>
          <% end %>
        </ul>
      </div>
      <div class="mt-8 text-right">
        <p class="text-2xl font-bold phx-click-loading:line-through" id="total">
          Total: $<%= Enum.reduce(@cart_items, 0.0, fn item, acc ->
            acc + item.price * item.quantity
          end)
          |> :erlang.float_to_binary(decimals: 2) %>
        </p>
      </div>
    </div>
    """
  end
end
