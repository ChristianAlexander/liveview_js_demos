defmodule LvjsDemoWeb.FormFocusLive do
  use LvjsDemoWeb, :live_view
  alias Phoenix.LiveView.JS

  def render(assigns) do
    ~H"""
    <div class="overflow-hidden rounded-lg bg-white px-4 py-5 shadow sm:p-6 flex flex-col">
      <div class="flex items-center space-x-3">
        <div class="grow">
          <h2 class="text-base font-semibold leading-7 text-gray-900">Profile</h2>
          <p class="mt-1 max-w-2xl text-sm leading-6 text-gray-600">
            This information will be used to personalize your experience.
          </p>
        </div>
        <button
          type="button"
          class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-normal text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
          phx-click={JS.focus(to: "#name")}
        >
          Name
        </button>
        <button
          type="button"
          class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-normal text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
          phx-click={JS.focus_first(to: "#the-form")}
        >
          Form
        </button>
      </div>

      <div class="mt-10 pb-12 sm:space-y-0 sm:divide-y sm:divide-gray-900/10 sm:border-t sm:pb-0">
        <form id="the-form" action="#" class="py-6 space-y-2">
          <label for="name" class="block text-sm font-medium leading-6 text-gray-900 sm:pt-1.5">
            Name
          </label>
          <div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
            <input
              type="text"
              id="name"
              class="block flex-1 border-0 bg-transparent py-1.5 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
              placeholder="Your Name"
            />
          </div>
          <label
            for="dietary-restrictions"
            class="block text-sm font-medium leading-6 text-gray-900 sm:pt-1.5"
          >
            Dietary Restrictions
          </label>
          <div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
            <input
              type="text"
              id="dietary-restrictions"
              class="block flex-1 border-0 bg-transparent py-1.5 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
              placeholder="No Dairy"
            />
          </div>
        </form>
      </div>
    </div>
    """
  end
end
