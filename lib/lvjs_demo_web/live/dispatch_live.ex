defmodule LvjsDemoWeb.DispatchLive do
  use LvjsDemoWeb, :live_view

  defp example do
    """
    <p id="target-text">Text</p>
    <button phx-click={JS.dispatch("copy-to-clipboard", to: "#target-text")}>Copy to clipboard</button>
    """
  end

  def render(assigns) do
    ~H"""
    <div class="mb-4 px-4 py-5 rounded-lg shadow">
      <h2 class="text-base font-semibold leading-7 text-gray-900">Sample Code</h2>
      <p class="mt-1 text-sm leading-6 text-gray-500">
        <code>dispatch</code> triggers an event on the target element
      </p>
      <div class="mt-4 space-y-6 divide-y divide-gray-100 border-t border-gray-200 text-sm leading-6 pt-4">
        <code class="whitespace-pre-line"><%= example() %></code>
      </div>
    </div>
    <div class="max-w-xl justify-center overflow-hidden rounded-lg bg-white px-4 py-5 shadow sm:p-6 flex items-center">
      <p class="grow pr-4 mr-4 border-r" id="target-text">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
        Aenean non odio molestie, tristique lectus suscipit, luctus urna.
        Sed pharetra sodales tortor, non luctus magna vestibulum ut.
      </p>

      <button
        type="button"
        class="rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50 whitespace-nowrap"
        phx-click={
          JS.dispatch("copy-to-clipboard", to: "#target-text")
          |> JS.remove_class("hover:bg-gray-50")
          |> JS.add_class("bg-green-100")
        }
      >
        Copy to clipboard
      </button>
    </div>
    """
  end
end
