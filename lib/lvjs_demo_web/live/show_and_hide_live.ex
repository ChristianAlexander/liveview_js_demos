defmodule LvjsDemoWeb.ShowAndHideLive do
  use LvjsDemoWeb, :live_view
  alias Phoenix.LiveView.JS

  @impl true
  def mount(_params, _session, socket) do
    products = [
      %{
        id: 1,
        name: "Wireless Earbuds",
        price: 79.99,
        description: "High-quality sound with noise cancellation and long battery life."
      },
      %{
        id: 2,
        name: "Smart Watch",
        price: 199.99,
        description: "Track your fitness, receive notifications, and monitor your health 24/7."
      },
      %{
        id: 3,
        name: "Portable Charger",
        price: 49.99,
        description: "Fast-charging power bank with multiple ports for all your devices."
      },
      %{
        id: 4,
        name: "Bluetooth Speaker",
        price: 89.99,
        description: "Waterproof speaker with 360° sound and 20-hour playtime."
      }
    ]

    {:ok, assign(socket, products: products)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="min-h-screen p-8 max-w-xl mx-auto">
      <div class="flex justify-between items-center mb-8">
        <h2 class="text-3xl font-bold text-center">Featured Products</h2>
        <button
          phx-click={hide_all_descriptions()}
          class="bg-white hover:bg-red-50 hover:border-red-200 text-gray-700 font-semibold py-2 px-4 rounded transition-colors duration-300 flex items-center text-sm border"
        >
          <.icon name="hero-eye-slash" class="mr-2" /> Hide All Info
        </button>
      </div>
      <div class="grid grid-cols-1 gap-6">
        <div
          :for={product <- @products}
          class="bg-white rounded-lg shadow-md overflow-hidden transition-all duration-300 ease-in-out"
        >
          <div class="p-4">
            <h3 class="text-lg font-semibold mb-2"><%= product.name %></h3>
            <p class="text-gray-600 mb-2"><%= product.price %></p>
            <button
              id={"toggle-#{product.id}"}
              aria-expanded="false"
              aria-controls={"description-#{product.id}"}
              phx-click={toggle_description(product.id)}
            >
              <span id={"chevron-#{product.id}"} class="inline-block transition duration-200">
                <.icon name="hero-chevron-down" />
              </span>
              <span id={"more-info-#{product.id}"}> More Info</span>
              <span id={"less-info-#{product.id}"} class="hidden"> Less Info</span>
            </button>
            <p id={"description-#{product.id}"} class="hidden text-gray-700">
              <%= product.description %>
            </p>
          </div>
          <div class="p-4 bg-gray-50 border-t">
            <button class="w-full bg-gray-500 hover:bg-gray-600 text-white font-bold py-2 px-4 rounded transition-colors duration-300 flex items-center justify-center">
              <.icon name="hero-shopping-cart" class="mr-2" /> Add to Cart
            </button>
          </div>
        </div>
      </div>
    </div>
    """
  end

  defp toggle_description(js \\ %JS{}, product_id) do
    js
    |> JS.toggle(
      to: "#description-#{product_id}",
      in: {"transition ease-in-out duration-200", "opacity-0", "opacity-100"},
      out: {"transition ease-in-out duration-200", "opacity-100", "opacity-0"}
    )
    |> JS.toggle_class("rotate-180", to: "#chevron-#{product_id}")
    |> JS.toggle(display: "inline", to: "#more-info-#{product_id}")
    |> JS.toggle(display: "inline", to: "#less-info-#{product_id}")
    |> JS.toggle_attribute({"aria-expanded", "true", "false"})
  end

  defp hide_all_descriptions(js \\ %JS{}) do
    js
    |> JS.hide(
      to: "[id^='description-']",
      transition: {"transition ease-in-out duration-200", "opacity-100", "opacity-0"}
    )
    |> JS.remove_class("rotate-180", to: "[id^='chevron-']")
    |> JS.show(display: "inline", to: "[id^='more-info-']")
    |> JS.hide(to: "[id^='less-info-']")
    |> JS.set_attribute({"aria-expanded", "false"}, to: "[id^='toggle-']")
  end
end
