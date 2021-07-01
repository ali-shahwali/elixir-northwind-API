defmodule NorthwindApi.Repo do
  use Ecto.Repo,
    otp_app: :northwind_api,
    adapter: Ecto.Adapters.Postgres
end
