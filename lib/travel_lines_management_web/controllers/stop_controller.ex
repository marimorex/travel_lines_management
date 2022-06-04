defmodule TravelLinesManagementWeb.StopController do
  use TravelLinesManagementWeb, :controller

  alias TravelLinesManagement.Trip
  alias TravelLinesManagement.Trip.Stop

  action_fallback TravelLinesManagementWeb.FallbackController

  def index(conn, _params) do
    stops = Trip.list_stops()
    render(conn, "index.json", stops: stops)
  end

  def create(conn, %{"stop" => stop_params}) do
    with {:ok, %Stop{} = stop} <- Trip.create_stop(stop_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.stop_path(conn, :show, stop))
      |> render("show.json", stop: stop)
    end
  end

  def show(conn, %{"id" => id}) do
    stop = Trip.get_stop!(id)
    render(conn, "show.json", stop: stop)
  end

  def update(conn, %{"id" => id, "stop" => stop_params}) do
    stop = Trip.get_stop!(id)

    with {:ok, %Stop{} = stop} <- Trip.update_stop(stop, stop_params) do
      render(conn, "show.json", stop: stop)
    end
  end

  def delete(conn, %{"id" => id}) do
    stop = Trip.get_stop!(id)

    with {:ok, %Stop{}} <- Trip.delete_stop(stop) do
      send_resp(conn, :no_content, "")
    end
  end
end
