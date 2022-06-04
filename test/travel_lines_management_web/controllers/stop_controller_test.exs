defmodule TravelLinesManagementWeb.StopControllerTest do
  use TravelLinesManagementWeb.ConnCase

  import TravelLinesManagement.TripFixtures

  alias TravelLinesManagement.Trip.Stop

  @create_attrs %{
    city_name: "some city_name",
    gps_latitude: 120.5,
    gps_longitude: 120.5,
    name: "some name",
    order: 42,
    status: 42,
    time: ~T[14:00:00]
  }
  @update_attrs %{
    city_name: "some updated city_name",
    gps_latitude: 456.7,
    gps_longitude: 456.7,
    name: "some updated name",
    order: 43,
    status: 43,
    time: ~T[15:01:01]
  }
  @invalid_attrs %{city_name: nil, gps_latitude: nil, gps_longitude: nil, name: nil, order: nil, status: nil, time: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all stops", %{conn: conn} do
      conn = get(conn, Routes.stop_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create stop" do
    test "renders stop when data is valid", %{conn: conn} do
      conn = post(conn, Routes.stop_path(conn, :create), stop: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.stop_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "city_name" => "some city_name",
               "gps_latitude" => 120.5,
               "gps_longitude" => 120.5,
               "name" => "some name",
               "order" => 42,
               "status" => 42,
               "time" => "14:00:00"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.stop_path(conn, :create), stop: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update stop" do
    setup [:create_stop]

    test "renders stop when data is valid", %{conn: conn, stop: %Stop{id: id} = stop} do
      conn = put(conn, Routes.stop_path(conn, :update, stop), stop: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.stop_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "city_name" => "some updated city_name",
               "gps_latitude" => 456.7,
               "gps_longitude" => 456.7,
               "name" => "some updated name",
               "order" => 43,
               "status" => 43,
               "time" => "15:01:01"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, stop: stop} do
      conn = put(conn, Routes.stop_path(conn, :update, stop), stop: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete stop" do
    setup [:create_stop]

    test "deletes chosen stop", %{conn: conn, stop: stop} do
      conn = delete(conn, Routes.stop_path(conn, :delete, stop))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.stop_path(conn, :show, stop))
      end
    end
  end

  defp create_stop(_) do
    stop = stop_fixture()
    %{stop: stop}
  end
end
