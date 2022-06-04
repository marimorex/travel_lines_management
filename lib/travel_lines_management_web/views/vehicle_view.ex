defmodule TravelLinesManagementWeb.VehicleView do
  use TravelLinesManagementWeb, :view
  alias TravelLinesManagementWeb.VehicleView

  def render("index.json", %{vehicles: vehicles}) do
    %{data: render_many(vehicles, VehicleView, "vehicle.json")}
  end

  def render("show.json", %{vehicle: vehicle}) do
    %{data: render_one(vehicle, VehicleView, "vehicle.json")}
  end

  def render("vehicle.json", %{vehicle: vehicle}) do
    %{
      id: vehicle.vehicle_id,
      plate: vehicle.plate,
      status: vehicle.status
    }
  end
end
