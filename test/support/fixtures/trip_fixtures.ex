defmodule TravelLinesManagement.TripFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TravelLinesManagement.Trip` context.
  """

  @doc """
  Generate a line.
  """
  def line_fixture(attrs \\ %{}) do
    {:ok, line} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        status: 42
      })
      |> TravelLinesManagement.Trip.create_line()

    line
  end

  @doc """
  Generate a stop.
  """
  def stop_fixture(attrs \\ %{}) do
    {:ok, stop} =
      attrs
      |> Enum.into(%{
        city_name: "some city_name",
        gps_latitude: 120.5,
        gps_longitude: 120.5,
        name: "some name",
        order: 42,
        status: 42,
        time: ~T[14:00:00]
      })
      |> TravelLinesManagement.Trip.create_stop()

    stop
  end

  @doc """
  Generate a vehicle.
  """
  def vehicle_fixture(attrs \\ %{}) do
    {:ok, vehicle} =
      attrs
      |> Enum.into(%{
        plate: "some plate",
        status: 42
      })
      |> TravelLinesManagement.Trip.create_vehicle()

    vehicle
  end

  @doc """
  Generate a travel.
  """
  def travel_fixture(attrs \\ %{}) do
    {:ok, travel} =
      attrs
      |> Enum.into(%{
        arrival: ~N[2022-06-03 16:48:00],
        departure: ~N[2022-06-03 16:48:00],
        status: 42
      })
      |> TravelLinesManagement.Trip.create_travel()

    travel
  end
end
