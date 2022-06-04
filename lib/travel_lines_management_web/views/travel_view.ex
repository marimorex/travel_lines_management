defmodule TravelLinesManagementWeb.TravelView do
  use TravelLinesManagementWeb, :view
  alias TravelLinesManagementWeb.TravelView

  def render("index.json", %{travels: travels}) do
    %{data: render_many(travels, TravelView, "travel.json")}
  end

  def render("show.json", %{travel: travel}) do
    %{data: render_one(travel, TravelView, "travel.json")}
  end

  def render("travel.json", %{travel: travel}) do
    %{
      id: travel.travel_id,
      departure: travel.departure,
      arrival: travel.arrival,
      status: travel.status
    }
  end
end
