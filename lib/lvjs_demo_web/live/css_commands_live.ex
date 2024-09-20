defmodule LvjsDemoWeb.CSSCommandsLive do
  use LvjsDemoWeb, :live_view

  defp example_one do
    """
    <button phx-click={JS.toggle_class("bg-green-200")}>Toggle</button>
    """
  end

  defp example_two do
    """
    <p id="target-text">Text</p>
    <button phx-click={JS.add_class("font-bold", to: "#target-text")}>Make it bold!</button>
    <button phx-click={JS.remove_class("font-bold", to: "#target-text")}>Make it normal</button>
    """
  end

  def render(assigns) do
    ~H"""
    <div class="mb-4 px-4 py-5 rounded-lg shadow">
      <h2 class="text-base font-semibold leading-7 text-gray-900">Sample Code</h2>
      <p class="mt-1 text-sm leading-6 text-gray-500">
        <code>toggle_class</code> adds or removes a class based on its presence.
      </p>
      <div class="mt-4 space-y-6 divide-y divide-gray-100 border-t border-gray-200 text-sm leading-6 pt-4">
        <code>
          <%= example_one() %>
        </code>
      </div>
    </div>
    <div class="max-w-xs justify-center overflow-hidden rounded-lg bg-white px-4 py-5 shadow sm:p-6 flex items-center">
      <button
        type="button"
        class="rounded-md border border-gray-400 px-3 py-2 text-sm font-semibold shadow-sm"
        phx-click={JS.toggle_class("bg-green-200")}
      >
        Toggle
      </button>
    </div>

    <div class="mt-20 mb-8 px-4 py-5 rounded-lg shadow">
      <h2 class="text-base font-semibold leading-7 text-gray-900">Sample Code</h2>
      <p class="mt-1 text-sm leading-6 text-gray-500">
        <code>add_class</code> and <code>remove_class</code> do exactly what they say.
        Target an element with the <code>to</code> option.
      </p>
      <div class="mt-4 space-y-6 divide-y divide-gray-100 border-t border-gray-200 text-sm leading-6 pt-4">
        <code class="whitespace-pre-line"><%= example_two() %></code>
      </div>
    </div>
    <div class="overflow-hidden rounded-lg bg-white px-4 py-5 shadow sm:p-6 flex items-center space-x-4">
      <p id="target-text" class="grow mr-4">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
        Aenean non odio molestie, tristique lectus suscipit, luctus urna.
        Sed pharetra sodales tortor, non luctus magna.
      </p>
      <div class="border-l border-gray-200 pl-8 space-y-4 whitespace-nowrap flex flex-col">
        <button
          type="button"
          class="rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
          phx-click={JS.add_class("font-bold", to: "#target-text")}
        >
          Make it <b>bold</b>!
        </button>
        <button
          type="button"
          class="rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
          phx-click={JS.remove_class("font-bold", to: "#target-text")}
        >
          Make it normal
        </button>
      </div>
    </div>
    """
  end
end
