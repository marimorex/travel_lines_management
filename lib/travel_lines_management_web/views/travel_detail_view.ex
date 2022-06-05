defmodule TravelLinesManagementWeb.TravelDetailView do
  use TravelLinesManagementWeb, :view
  alias TravelLinesManagementWeb.TravelDetailView
  alias TravelLinesManagementWeb.StopView


  def render("index.json", %{travel_details: travel_details}) do
    %{travel_details: render_many(travel_details, TravelDetailView, "travel_detail.json")}
  end

  def render("show.json", %{travel_detail: travel_detail}) do
    %{travel_details: render_one(travel_detail, TravelDetailView, "travel_detail.json")}
  end

  def render("travel_detail.json", %{travel_detail: travel_detail}) do
    %{
      travel_id: travel_detail.travel_id,
      stop:  (if Ecto.assoc_loaded?(travel_detail.stop), do: render_one(travel_detail.stop, StopView, "stop.json"), else: nil),
      departure: travel_detail.departure,
      arrival: travel_detail.arrival,
      status: travel_detail.status,
      passangers_get_on_stop: travel_detail.passangers_get_on_stop,
      passangers_get_down_stop: travel_detail.passangers_get_down_stop,
      passangers_on_board: travel_detail.passangers_on_board
    }
  end
end
