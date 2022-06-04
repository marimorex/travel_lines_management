defmodule TravelLinesManagementWeb.LineView do
  use TravelLinesManagementWeb, :view
  alias TravelLinesManagementWeb.LineView

  def render("index.json", %{lines: lines}) do
    %{data: render_many(lines, LineView, "line.json")}
  end

  def render("show.json", %{line: line}) do
    %{data: render_one(line, LineView, "line.json")}
  end

  def render("line.json", %{line: line}) do
    %{
      id: line.line_id,
      name: line.name,
      description: line.description,
      status: line.status
    }
  end
end
