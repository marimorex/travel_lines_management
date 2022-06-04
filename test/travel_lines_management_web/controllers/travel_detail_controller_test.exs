defmodule TravelLinesManagementWeb.TravelDetailControllerTest do
  use TravelLinesManagementWeb.ConnCase

  import TravelLinesManagement.TripFixtures

  alias TravelLinesManagement.Trip.TravelDetail

  @create_attrs %{
    arrival: ~N[2022-06-03 17:06:00],
    departure: ~N[2022-06-03 17:06:00],
    passangers_get_down_stop: 42,
    passangers_get_on_stop: 42,
    passangers_on_board: 42,
    status: 42
  }
  @update_attrs %{
    arrival: ~N[2022-06-04 17:06:00],
    departure: ~N[2022-06-04 17:06:00],
    passangers_get_down_stop: 43,
    passangers_get_on_stop: 43,
    passangers_on_board: 43,
    status: 43
  }
  @invalid_attrs %{arrival: nil, departure: nil, passangers_get_down_stop: nil, passangers_get_on_stop: nil, passangers_on_board: nil, status: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all travel_details", %{conn: conn} do
      conn = get(conn, Routes.travel_detail_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create travel_detail" do
    test "renders travel_detail when data is valid", %{conn: conn} do
      conn = post(conn, Routes.travel_detail_path(conn, :create), travel_detail: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.travel_detail_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "arrival" => "2022-06-03T17:06:00",
               "departure" => "2022-06-03T17:06:00",
               "passangers_get_down_stop" => 42,
               "passangers_get_on_stop" => 42,
               "passangers_on_board" => 42,
               "status" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.travel_detail_path(conn, :create), travel_detail: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update travel_detail" do
    setup [:create_travel_detail]

    test "renders travel_detail when data is valid", %{conn: conn, travel_detail: %TravelDetail{id: id} = travel_detail} do
      conn = put(conn, Routes.travel_detail_path(conn, :update, travel_detail), travel_detail: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.travel_detail_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "arrival" => "2022-06-04T17:06:00",
               "departure" => "2022-06-04T17:06:00",
               "passangers_get_down_stop" => 43,
               "passangers_get_on_stop" => 43,
               "passangers_on_board" => 43,
               "status" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, travel_detail: travel_detail} do
      conn = put(conn, Routes.travel_detail_path(conn, :update, travel_detail), travel_detail: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete travel_detail" do
    setup [:create_travel_detail]

    test "deletes chosen travel_detail", %{conn: conn, travel_detail: travel_detail} do
      conn = delete(conn, Routes.travel_detail_path(conn, :delete, travel_detail))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.travel_detail_path(conn, :show, travel_detail))
      end
    end
  end

  defp create_travel_detail(_) do
    travel_detail = travel_detail_fixture()
    %{travel_detail: travel_detail}
  end
end
