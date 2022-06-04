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
end
