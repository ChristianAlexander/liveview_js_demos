defmodule LvjsDemoWeb.PushPopFocusLive do
  use LvjsDemoWeb, :live_view
  alias Phoenix.LiveView.JS

  def render(assigns) do
    ~H"""
    <div class="mb-12">
      <button
        type="button"
        phx-click={JS.pop_focus()}
        class="rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
      >
        Pop Focus
      </button>
    </div>

    <div class="space-x-6">
      <button
        class="rounded-md bg-indigo-600 px-8 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus:outline focus:outline-2 focus:outline-offset-2 focus:outline-indigo-600"
        id="button-1"
        phx-click={JS.push_focus() |> JS.focus(to: "#button-2")}
      >
        1
      </button>
      <button
        class="rounded-md bg-indigo-600 px-8 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus:outline focus:outline-2 focus:outline-offset-2 focus:outline-indigo-600"
        id="button-2"
        phx-click={JS.push_focus() |> JS.focus(to: "#button-3")}
      >
        2
      </button>
      <button
        class="rounded-md bg-indigo-600 px-8 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus:outline focus:outline-2 focus:outline-offset-2 focus:outline-indigo-600"
        id="button-3"
        phx-click={JS.push_focus() |> JS.focus(to: "#button-4")}
      >
        3
      </button>
      <button
        class="rounded-md bg-indigo-600 px-8 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus:outline focus:outline-2 focus:outline-offset-2 focus:outline-indigo-600"
        id="button-4"
        phx-click={JS.push_focus() |> JS.focus(to: "#button-1")}
      >
        4
      </button>
    </div>
    """
  end
end
