defmodule TravelLinesManagementWeb.TravelController do
  use TravelLinesManagementWeb, :controller

  alias TravelLinesManagement.Trip
  alias TravelLinesManagement.Trip.Travel

  action_fallback TravelLinesManagementWeb.FallbackController

  def index(conn, _params) do
    travels = Trip.list_travels()
    render(conn, "index.json", travels: travels)
  end

  def create(conn, %{"travel" => travel_params}) do
    with {:ok, %Travel{} = travel} <- Trip.create_travel(travel_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.travel_path(conn, :show, travel))
      |> render("show.json", travel: travel)
    end
  end

  def show(conn, %{"id" => id}) do
    travel = Trip.get_travel!(id)
    render(conn, "show.json", travel: travel)
  end

  def update(conn, %{"id" => id, "travel" => travel_params}) do
    travel = Trip.get_travel!(id)

    with {:ok, %Travel{} = travel} <- Trip.update_travel(travel, travel_params) do
      render(conn, "show.json", travel: travel)
    end
  end

  def delete(conn, %{"id" => id}) do
    travel = Trip.get_travel!(id)

    with {:ok, %Travel{}} <- Trip.delete_travel(travel) do
      send_resp(conn, :no_content, "")
    end
  end
end
