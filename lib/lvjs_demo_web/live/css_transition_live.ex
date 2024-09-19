defmodule LvjsDemoWeb.CSSTransitionLive do
  use LvjsDemoWeb, :live_view

  defp example_one do
    """
    <div phx-mounted={JS.transition("animate-bounce")}>Some Text</div>
    """
  end

  defp example_two do
    """
    <div id="target-text">Some Text</div>
    <button phx-click={
      JS.transition({
        "ease-out duration-1000", "opacity-0", "opacity-100"},
        time: 1000,
        to: "#target-text")})>
      Click me!
    </button>
    """
  end

  def render(assigns) do
    ~H"""
    <div class="mb-4 px-4 py-5 rounded-lg shadow">
      <h2 class="text-base font-semibold leading-7 text-gray-900">Sample Code</h2>
      <p class="mt-1 text-sm leading-6 text-gray-500">
        <code>transition</code> orchestrates animations of elements
      </p>
      <div class="mt-4 space-y-6 divide-y divide-gray-100 border-t border-gray-200 text-sm leading-6 pt-4">
        <code class="whitespace-pre-line"><%= example_one() %></code>
      </div>
    </div>
    <div class="justify-center overflow-hidden rounded-lg bg-white px-4 py-5 shadow sm:p-6 flex items-center">
      <p phx-mounted={JS.transition("animate-bounce", time: 500)} class="grow mr-4">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
        Aenean non odio molestie, tristique lectus suscipit, luctus urna.
        Sed pharetra sodales tortor, non luctus magna vestibulum ut.
      </p>
    </div>

    <div class="mt-20 mb-4 px-4 py-5 rounded-lg shadow">
      <h2 class="text-base font-semibold leading-7 text-gray-900">Sample Code</h2>
      <p class="mt-1 text-sm leading-6 text-gray-500">
        <code>transition</code> accepts a 3-tuple, as well.
      </p>
      <div class="mt-4 space-y-6 divide-y divide-gray-100 border-t border-gray-200 text-sm leading-6 pt-4">
        <code class="whitespace-pre"><%= example_two() %></code>
      </div>
    </div>
    <div class="justify-center overflow-hidden rounded-lg bg-white px-4 py-5 shadow sm:p-6 flex items-center">
      <p id="target-text" class="grow mr-4 opacity-0">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
        Aenean non odio molestie, tristique lectus suscipit, luctus urna.
        Sed pharetra sodales tortor, non luctus magna vestibulum ut.
      </p>
      <div class="border-l border-gray-200 pl-8 space-y-4 whitespace-nowrap flex flex-col">
        <button
          type="button"
          class="rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
          phx-click={
            JS.transition({"ease-out duration-1000", "opacity-0", "opacity-100"},
              time: 1000,
              to: "#target-text"
            )
          }
        >
          Click me!
        </button>
      </div>
    </div>
    """
  end
end
