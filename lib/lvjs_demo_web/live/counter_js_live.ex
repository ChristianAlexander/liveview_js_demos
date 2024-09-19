defmodule LvjsDemoWeb.CounterJSLive do
  use LvjsDemoWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0)}
  end

  defp example_text do
    """
    <button phx-click={JS.push("increment")}>Click me!</button>
    """
  end

  def render(assigns) do
    ~H"""
    <div class="mb-16 px-4 py-5 rounded-lg shadow">
      <h2 class="text-base font-semibold leading-7 text-gray-900">Sample Code</h2>
      <p class="mt-1 text-sm leading-6 text-gray-500">
        Setting the phx-click attribute to a push command <i>also</i>
        causes an event to be sent over the socket.
      </p>
      <div class="mt-4 space-y-6 divide-y divide-gray-100 border-t border-gray-200 text-sm leading-6 pt-4">
        <code>
          <%= example_text() %>
        </code>
      </div>
    </div>
    <div class="max-w-md overflow-hidden rounded-lg bg-white px-4 py-5 shadow sm:p-6 flex items-center">
      <div class="grow border-r border-gray-200 mr-4">
        <dt class="truncate text-sm font-medium text-gray-500">Total Clicks</dt>
        <dd class="mt-1 text-3xl font-semibold tracking-tight text-gray-900 tabular-nums">
          <%= @count %>
        </dd>
      </div>
      <button
        type="button"
        class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
        phx-click={JS.push("increment")}
      >
        Click me!
      </button>
    </div>
    """
  end

  def handle_event("increment", _params, socket) do
    {:noreply, assign(socket, count: socket.assigns.count + 1)}
  end
end
