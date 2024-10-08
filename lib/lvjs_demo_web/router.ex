defmodule LvjsDemoWeb.Router do
  use LvjsDemoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {LvjsDemoWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LvjsDemoWeb do
    pipe_through :browser

    live "/", CounterLive
    live "/click-command", CounterJSLive
    live "/css-commands", CSSCommandsLive
    live "/css-transition", CSSTransitionLive
    live "/optimistic-ui", OptimisticCartLive
    live "/show-hide", ShowAndHideLive
    live "/focus-form", FormFocusLive
    live "/focus-push-pop", PushPopFocusLive
    live "/dispatch", DispatchLive

    live "/animals", AnimalLive.Index, :index
    live "/animals/new", AnimalLive.Index, :new
    live "/animals/:id/edit", AnimalLive.Index, :edit

    live "/animals/:id", AnimalLive.Show, :show
    live "/animals/:id/show/edit", AnimalLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", LvjsDemoWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:lvjs_demo, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: LvjsDemoWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
