defmodule TravelLinesManagementWeb.LineController do
  use TravelLinesManagementWeb, :controller

  alias TravelLinesManagement.Trip
  alias TravelLinesManagement.Trip.Line

  action_fallback TravelLinesManagementWeb.FallbackController

  def index(conn, _params) do
    lines = Trip.list_lines()
    render(conn, "index.json", lines: lines)
  end

  def create(conn, %{"line" => line_params}) do
    with {:ok, %Line{} = line} <- Trip.create_line(line_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.line_path(conn, :show, line))
      |> render("show.json", line: line)
    end
  end

  def show(conn, %{"id" => id}) do
    line = Trip.get_line!(id)
    render(conn, "show.json", line: line)
  end

  def update(conn, %{"id" => id, "line" => line_params}) do
    line = Trip.get_line!(id)

    with {:ok, %Line{} = line} <- Trip.update_line(line, line_params) do
      render(conn, "show.json", line: line)
    end
  end

  def delete(conn, %{"id" => id}) do
    line = Trip.get_line!(id)

    with {:ok, %Line{}} <- Trip.delete_line(line) do
      send_resp(conn, :no_content, "")
    end
  end
end
