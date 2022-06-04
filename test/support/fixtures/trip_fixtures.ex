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
end
