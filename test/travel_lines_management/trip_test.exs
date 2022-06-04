defmodule TravelLinesManagement.TripTest do
  use TravelLinesManagement.DataCase

  alias TravelLinesManagement.Trip

  describe "lines" do
    alias TravelLinesManagement.Trip.Line

    import TravelLinesManagement.TripFixtures

    @invalid_attrs %{description: nil, name: nil, status: nil}

    test "list_lines/0 returns all lines" do
      line = line_fixture()
      assert Trip.list_lines() == [line]
    end

    test "get_line!/1 returns the line with given id" do
      line = line_fixture()
      assert Trip.get_line!(line.id) == line
    end

    test "create_line/1 with valid data creates a line" do
      valid_attrs = %{description: "some description", name: "some name", status: 42}

      assert {:ok, %Line{} = line} = Trip.create_line(valid_attrs)
      assert line.description == "some description"
      assert line.name == "some name"
      assert line.status == 42
    end

    test "create_line/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Trip.create_line(@invalid_attrs)
    end

    test "update_line/2 with valid data updates the line" do
      line = line_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name", status: 43}

      assert {:ok, %Line{} = line} = Trip.update_line(line, update_attrs)
      assert line.description == "some updated description"
      assert line.name == "some updated name"
      assert line.status == 43
    end

    test "update_line/2 with invalid data returns error changeset" do
      line = line_fixture()
      assert {:error, %Ecto.Changeset{}} = Trip.update_line(line, @invalid_attrs)
      assert line == Trip.get_line!(line.id)
    end

    test "delete_line/1 deletes the line" do
      line = line_fixture()
      assert {:ok, %Line{}} = Trip.delete_line(line)
      assert_raise Ecto.NoResultsError, fn -> Trip.get_line!(line.id) end
    end

    test "change_line/1 returns a line changeset" do
      line = line_fixture()
      assert %Ecto.Changeset{} = Trip.change_line(line)
    end
  end

  describe "stops" do
    alias TravelLinesManagement.Trip.Stop

    import TravelLinesManagement.TripFixtures

    @invalid_attrs %{city_name: nil, gps_latitude: nil, gps_longitude: nil, name: nil, order: nil, status: nil, time: nil}

    test "list_stops/0 returns all stops" do
      stop = stop_fixture()
      assert Trip.list_stops() == [stop]
    end

    test "get_stop!/1 returns the stop with given id" do
      stop = stop_fixture()
      assert Trip.get_stop!(stop.id) == stop
    end

    test "create_stop/1 with valid data creates a stop" do
      valid_attrs = %{city_name: "some city_name", gps_latitude: 120.5, gps_longitude: 120.5, name: "some name", order: 42, status: 42, time: ~T[14:00:00]}

      assert {:ok, %Stop{} = stop} = Trip.create_stop(valid_attrs)
      assert stop.city_name == "some city_name"
      assert stop.gps_latitude == 120.5
      assert stop.gps_longitude == 120.5
      assert stop.name == "some name"
      assert stop.order == 42
      assert stop.status == 42
      assert stop.time == ~T[14:00:00]
    end

    test "create_stop/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Trip.create_stop(@invalid_attrs)
    end

    test "update_stop/2 with valid data updates the stop" do
      stop = stop_fixture()
      update_attrs = %{city_name: "some updated city_name", gps_latitude: 456.7, gps_longitude: 456.7, name: "some updated name", order: 43, status: 43, time: ~T[15:01:01]}

      assert {:ok, %Stop{} = stop} = Trip.update_stop(stop, update_attrs)
      assert stop.city_name == "some updated city_name"
      assert stop.gps_latitude == 456.7
      assert stop.gps_longitude == 456.7
      assert stop.name == "some updated name"
      assert stop.order == 43
      assert stop.status == 43
      assert stop.time == ~T[15:01:01]
    end

    test "update_stop/2 with invalid data returns error changeset" do
      stop = stop_fixture()
      assert {:error, %Ecto.Changeset{}} = Trip.update_stop(stop, @invalid_attrs)
      assert stop == Trip.get_stop!(stop.id)
    end

    test "delete_stop/1 deletes the stop" do
      stop = stop_fixture()
      assert {:ok, %Stop{}} = Trip.delete_stop(stop)
      assert_raise Ecto.NoResultsError, fn -> Trip.get_stop!(stop.id) end
    end

    test "change_stop/1 returns a stop changeset" do
      stop = stop_fixture()
      assert %Ecto.Changeset{} = Trip.change_stop(stop)
    end
  end

  describe "vehicles" do
    alias TravelLinesManagement.Trip.Vehicle

    import TravelLinesManagement.TripFixtures

    @invalid_attrs %{plate: nil, status: nil}

    test "list_vehicles/0 returns all vehicles" do
      vehicle = vehicle_fixture()
      assert Trip.list_vehicles() == [vehicle]
    end

    test "get_vehicle!/1 returns the vehicle with given id" do
      vehicle = vehicle_fixture()
      assert Trip.get_vehicle!(vehicle.id) == vehicle
    end

    test "create_vehicle/1 with valid data creates a vehicle" do
      valid_attrs = %{plate: "some plate", status: 42}

      assert {:ok, %Vehicle{} = vehicle} = Trip.create_vehicle(valid_attrs)
      assert vehicle.plate == "some plate"
      assert vehicle.status == 42
    end

    test "create_vehicle/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Trip.create_vehicle(@invalid_attrs)
    end

    test "update_vehicle/2 with valid data updates the vehicle" do
      vehicle = vehicle_fixture()
      update_attrs = %{plate: "some updated plate", status: 43}

      assert {:ok, %Vehicle{} = vehicle} = Trip.update_vehicle(vehicle, update_attrs)
      assert vehicle.plate == "some updated plate"
      assert vehicle.status == 43
    end

    test "update_vehicle/2 with invalid data returns error changeset" do
      vehicle = vehicle_fixture()
      assert {:error, %Ecto.Changeset{}} = Trip.update_vehicle(vehicle, @invalid_attrs)
      assert vehicle == Trip.get_vehicle!(vehicle.id)
    end

    test "delete_vehicle/1 deletes the vehicle" do
      vehicle = vehicle_fixture()
      assert {:ok, %Vehicle{}} = Trip.delete_vehicle(vehicle)
      assert_raise Ecto.NoResultsError, fn -> Trip.get_vehicle!(vehicle.id) end
    end

    test "change_vehicle/1 returns a vehicle changeset" do
      vehicle = vehicle_fixture()
      assert %Ecto.Changeset{} = Trip.change_vehicle(vehicle)
    end
  end
end
