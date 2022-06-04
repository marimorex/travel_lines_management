defmodule TravelLinesManagementWeb.TravelControllerTest do
  use TravelLinesManagementWeb.ConnCase

  import TravelLinesManagement.TripFixtures

  alias TravelLinesManagement.Trip.Travel

  @create_attrs %{
    arrival: ~N[2022-06-03 16:48:00],
    departure: ~N[2022-06-03 16:48:00],
    status: 42
  }
  @update_attrs %{
    arrival: ~N[2022-06-04 16:48:00],
    departure: ~N[2022-06-04 16:48:00],
    status: 43
  }
  @invalid_attrs %{arrival: nil, departure: nil, status: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all travels", %{conn: conn} do
      conn = get(conn, Routes.travel_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create travel" do
    test "renders travel when data is valid", %{conn: conn} do
      conn = post(conn, Routes.travel_path(conn, :create), travel: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.travel_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "arrival" => "2022-06-03T16:48:00",
               "departure" => "2022-06-03T16:48:00",
               "status" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.travel_path(conn, :create), travel: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update travel" do
    setup [:create_travel]

    test "renders travel when data is valid", %{conn: conn, travel: %Travel{id: id} = travel} do
      conn = put(conn, Routes.travel_path(conn, :update, travel), travel: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.travel_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "arrival" => "2022-06-04T16:48:00",
               "departure" => "2022-06-04T16:48:00",
               "status" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, travel: travel} do
      conn = put(conn, Routes.travel_path(conn, :update, travel), travel: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete travel" do
    setup [:create_travel]

    test "deletes chosen travel", %{conn: conn, travel: travel} do
      conn = delete(conn, Routes.travel_path(conn, :delete, travel))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.travel_path(conn, :show, travel))
      end
    end
  end

  defp create_travel(_) do
    travel = travel_fixture()
    %{travel: travel}
  end
end
