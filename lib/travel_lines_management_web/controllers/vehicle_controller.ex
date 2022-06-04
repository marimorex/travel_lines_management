defmodule TravelLinesManagementWeb.VehicleController do
  use TravelLinesManagementWeb, :controller

  alias TravelLinesManagement.Trip
  alias TravelLinesManagement.Trip.Vehicle

  action_fallback TravelLinesManagementWeb.FallbackController

  def index(conn, _params) do
    vehicles = Trip.list_vehicles()
    render(conn, "index.json", vehicles: vehicles)
  end

  def create(conn, %{"vehicle" => vehicle_params}) do
    with {:ok, %Vehicle{} = vehicle} <- Trip.create_vehicle(vehicle_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.vehicle_path(conn, :show, vehicle))
      |> render("show.json", vehicle: vehicle)
    end
  end

  def show(conn, %{"id" => id}) do
    vehicle = Trip.get_vehicle!(id)
    render(conn, "show.json", vehicle: vehicle)
  end

  def update(conn, %{"id" => id, "vehicle" => vehicle_params}) do
    vehicle = Trip.get_vehicle!(id)

    with {:ok, %Vehicle{} = vehicle} <- Trip.update_vehicle(vehicle, vehicle_params) do
      render(conn, "show.json", vehicle: vehicle)
    end
  end

  def delete(conn, %{"id" => id}) do
    vehicle = Trip.get_vehicle!(id)

    with {:ok, %Vehicle{}} <- Trip.delete_vehicle(vehicle) do
      send_resp(conn, :no_content, "")
    end
  end
end
