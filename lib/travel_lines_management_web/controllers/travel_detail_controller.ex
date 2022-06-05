defmodule TravelLinesManagementWeb.TravelDetailController do
  use TravelLinesManagementWeb, :controller

  alias TravelLinesManagement.Trip
  alias TravelLinesManagement.Trip.TravelDetail

  action_fallback TravelLinesManagementWeb.FallbackController

  def index(conn, _params) do
    travel_details = Trip.list_travel_details()
    render(conn, "index.json", travel_details: travel_details)
  end

  def create(conn, %{"travel_id" => travel_id, "travel_detail" => travel_detail_params}) do
    travel_detail_params_2 = Trip.handle_travel_detail_creation(travel_id,Map.merge(%{"travel_id" => travel_id }, travel_detail_params))
    with {:ok, %TravelDetail{} = travel_detail} <- Trip.create_travel_detail(travel_detail_params_2) do
      render(conn, "show.json", travel_detail: travel_detail)
    end
  end

  def show(conn, %{"travel_id" => travel_id,"id" => stop_id}) do
    travel_detail = Trip.get_travel_detail!(travel_id, stop_id)
    render(conn, "show.json", travel_detail: travel_detail)
  end

  def update(conn, %{"travel_id" => travel_id,"id" => stop_id, "travel_detail" => travel_detail_params}) do
    travel_detail = Trip.get_travel_detail!(travel_id, stop_id)

    with {:ok, %TravelDetail{} = travel_detail} <- Trip.update_travel_detail(travel_detail, travel_detail_params) do
      render(conn, "show.json", travel_detail: travel_detail)
    end
  end

  def delete(conn, %{"travel_id" => travel_id,"id" => stop_id}) do
    travel_detail = Trip.get_travel_detail!(travel_id, stop_id)

    with {:ok, %TravelDetail{}} <- Trip.delete_travel_detail(travel_detail) do
      send_resp(conn, :no_content, "")
    end
  end
end
