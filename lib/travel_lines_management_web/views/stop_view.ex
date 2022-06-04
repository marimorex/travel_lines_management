defmodule TravelLinesManagementWeb.StopView do
  use TravelLinesManagementWeb, :view
  alias TravelLinesManagementWeb.StopView

  def render("index.json", %{stops: stops}) do
    %{data: render_many(stops, StopView, "stop.json")}
  end

  def render("show.json", %{stop: stop}) do
    %{data: render_one(stop, StopView, "stop.json")}
  end

  def render("stop.json", %{stop: stop}) do
    %{
      id: stop.stop_id,
      name: stop.name,
      order: stop.order,
      city_name: stop.city_name,
      time: stop.time,
      gps_latitude: stop.gps_latitude,
      gps_longitude: stop.gps_longitude,
      status: stop.status
    }
  end
end
