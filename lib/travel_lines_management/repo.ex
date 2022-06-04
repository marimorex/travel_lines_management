defmodule TravelLinesManagement.Repo do
  use Ecto.Repo,
    otp_app: :travel_lines_management,
    adapter: Ecto.Adapters.Postgres
end
