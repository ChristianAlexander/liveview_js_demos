defmodule LvjsDemo.Repo do
  use Ecto.Repo,
    otp_app: :lvjs_demo,
    adapter: Ecto.Adapters.SQLite3
end
