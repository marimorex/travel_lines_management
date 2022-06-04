defmodule TravelLinesManagementWeb.TravelDetailController do
  use TravelLinesManagementWeb, :controller

  alias TravelLinesManagement.Trip
  alias TravelLinesManagement.Trip.TravelDetail

  action_fallback TravelLinesManagementWeb.FallbackController

  def index(conn, _params) do
    travel_details = Trip.list_travel_details()
    render(conn, "index.json", travel_details: travel_details)
  end

  def create(conn, %{"travel_detail" => travel_detail_params}) do
    with {:ok, %TravelDetail{} = travel_detail} <- Trip.create_travel_detail(travel_detail_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.travel_detail_path(conn, :show, travel_detail))
      |> render("show.json", travel_detail: travel_detail)
    end
  end

  def show(conn, %{"id" => id}) do
    travel_detail = Trip.get_travel_detail!(id)
    render(conn, "show.json", travel_detail: travel_detail)
  end

  def update(conn, %{"id" => id, "travel_detail" => travel_detail_params}) do
    travel_detail = Trip.get_travel_detail!(id)

    with {:ok, %TravelDetail{} = travel_detail} <- Trip.update_travel_detail(travel_detail, travel_detail_params) do
      render(conn, "show.json", travel_detail: travel_detail)
    end
  end

  def delete(conn, %{"id" => id}) do
    travel_detail = Trip.get_travel_detail!(id)

    with {:ok, %TravelDetail{}} <- Trip.delete_travel_detail(travel_detail) do
      send_resp(conn, :no_content, "")
    end
  end
end
