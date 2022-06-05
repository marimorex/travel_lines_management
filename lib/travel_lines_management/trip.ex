defmodule TravelLinesManagement.Trip do
  @moduledoc """
  The Trip context.
  """

  import Ecto.Query, warn: false
  alias TravelLinesManagement.Repo

  alias TravelLinesManagement.Trip.Line

  @doc """
  Returns the list of lines.

  ## Examples

      iex> list_lines()
      [%Line{}, ...]

  """
  def list_lines do
    Repo.all(Line)
  end

  @doc """
  Gets a single line.

  Raises `Ecto.NoResultsError` if the Line does not exist.

  ## Examples

      iex> get_line!(123)
      %Line{}

      iex> get_line!(456)
      ** (Ecto.NoResultsError)

  """
  def get_line!(id), do: Repo.get!(Line, id)

  @doc """
  Creates a line.

  ## Examples

      iex> create_line(%{field: value})
      {:ok, %Line{}}

      iex> create_line(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_line(attrs \\ %{}) do
    %Line{}
    |> Line.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a line.

  ## Examples

      iex> update_line(line, %{field: new_value})
      {:ok, %Line{}}

      iex> update_line(line, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_line(%Line{} = line, attrs) do
    line
    |> Line.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a line.

  ## Examples

      iex> delete_line(line)
      {:ok, %Line{}}

      iex> delete_line(line)
      {:error, %Ecto.Changeset{}}

  """
  def delete_line(%Line{} = line) do
    Repo.delete(line)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking line changes.

  ## Examples

      iex> change_line(line)
      %Ecto.Changeset{data: %Line{}}

  """
  def change_line(%Line{} = line, attrs \\ %{}) do
    Line.changeset(line, attrs)
  end

  alias TravelLinesManagement.Trip.Stop

  @doc """
  Returns the list of stops.

  ## Examples

      iex> list_stops()
      [%Stop{}, ...]

  """
  def list_stops do
    Repo.all(Stop)
  end

  @doc """
  Gets a single stop.

  Raises `Ecto.NoResultsError` if the Stop does not exist.

  ## Examples

      iex> get_stop!(123)
      %Stop{}

      iex> get_stop!(456)
      ** (Ecto.NoResultsError)

  """
  def get_stop!(id), do: Repo.get!(Stop, id)

  @doc """
  Creates a stop.

  ## Examples

      iex> create_stop(%{field: value})
      {:ok, %Stop{}}

      iex> create_stop(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_stop(attrs \\ %{}) do
    %Stop{}
    |> Stop.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a stop.

  ## Examples

      iex> update_stop(stop, %{field: new_value})
      {:ok, %Stop{}}

      iex> update_stop(stop, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_stop(%Stop{} = stop, attrs) do
    stop
    |> Stop.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a stop.

  ## Examples

      iex> delete_stop(stop)
      {:ok, %Stop{}}

      iex> delete_stop(stop)
      {:error, %Ecto.Changeset{}}

  """
  def delete_stop(%Stop{} = stop) do
    Repo.delete(stop)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking stop changes.

  ## Examples

      iex> change_stop(stop)
      %Ecto.Changeset{data: %Stop{}}

  """
  def change_stop(%Stop{} = stop, attrs \\ %{}) do
    Stop.changeset(stop, attrs)
  end

  alias TravelLinesManagement.Trip.Vehicle

  @doc """
  Returns the list of vehicles.

  ## Examples

      iex> list_vehicles()
      [%Vehicle{}, ...]

  """
  def list_vehicles do
    Repo.all(Vehicle)
  end

  @doc """
  Gets a single vehicle.

  Raises `Ecto.NoResultsError` if the Vehicle does not exist.

  ## Examples

      iex> get_vehicle!(123)
      %Vehicle{}

      iex> get_vehicle!(456)
      ** (Ecto.NoResultsError)

  """
  def get_vehicle!(id), do: Repo.get!(Vehicle, id)

  @doc """
  Creates a vehicle.

  ## Examples

      iex> create_vehicle(%{field: value})
      {:ok, %Vehicle{}}

      iex> create_vehicle(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_vehicle(attrs \\ %{}) do
    %Vehicle{}
    |> Vehicle.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a vehicle.

  ## Examples

      iex> update_vehicle(vehicle, %{field: new_value})
      {:ok, %Vehicle{}}

      iex> update_vehicle(vehicle, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_vehicle(%Vehicle{} = vehicle, attrs) do
    vehicle
    |> Vehicle.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a vehicle.

  ## Examples

      iex> delete_vehicle(vehicle)
      {:ok, %Vehicle{}}

      iex> delete_vehicle(vehicle)
      {:error, %Ecto.Changeset{}}

  """
  def delete_vehicle(%Vehicle{} = vehicle) do
    Repo.delete(vehicle)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking vehicle changes.

  ## Examples

      iex> change_vehicle(vehicle)
      %Ecto.Changeset{data: %Vehicle{}}

  """
  def change_vehicle(%Vehicle{} = vehicle, attrs \\ %{}) do
    Vehicle.changeset(vehicle, attrs)
  end

  alias TravelLinesManagement.Trip.Travel

  @doc """
  Returns the list of travels.

  ## Examples

      iex> list_travels()
      [%Travel{}, ...]

  """
  def list_travels do
    Repo.all(Travel)
  end

  @doc """
  Gets a single travel.

  Raises `Ecto.NoResultsError` if the Travel does not exist.

  ## Examples

      iex> get_travel!(123)
      %Travel{}

      iex> get_travel!(456)
      ** (Ecto.NoResultsError)

  """
  def get_travel!(id), do: Repo.get!(Travel, id)

  @doc """
  Creates a travel.

  ## Examples

      iex> create_travel(%{field: value})
      {:ok, %Travel{}}

      iex> create_travel(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_travel(attrs \\ %{}) do
    %Travel{}
    |> Travel.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a travel.

  ## Examples

      iex> update_travel(travel, %{field: new_value})
      {:ok, %Travel{}}

      iex> update_travel(travel, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_travel(%Travel{} = travel, attrs) do
    travel
    |> Travel.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a travel.

  ## Examples

      iex> delete_travel(travel)
      {:ok, %Travel{}}

      iex> delete_travel(travel)
      {:error, %Ecto.Changeset{}}

  """
  def delete_travel(%Travel{} = travel) do
    Repo.delete(travel)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking travel changes.

  ## Examples

      iex> change_travel(travel)
      %Ecto.Changeset{data: %Travel{}}

  """
  def change_travel(%Travel{} = travel, attrs \\ %{}) do
    Travel.changeset(travel, attrs)
  end

  alias TravelLinesManagement.Trip.TravelDetail

  @doc """
  Returns the list of travel_details.

  ## Examples

      iex> list_travel_details()
      [%TravelDetail{}, ...]

  """
  def list_travel_details do
    Repo.all(TravelDetail)
  end

  @doc """
  Gets a single travel_detail.

  Raises `Ecto.NoResultsError` if the Travel detail does not exist.

  ## Examples

      iex> get_travel_detail!(123)
      %TravelDetail{}

      iex> get_travel_detail!(456)
      ** (Ecto.NoResultsError)

  """
  def get_travel_detail!(id), do: Repo.get!(TravelDetail, id)

  def get_previus_travel_detail_by_travel_id(travel_id), do: TravelDetail.getPreviousTravelDetail(travel_id) |> Repo.one

  def handle_travel_detail_creation(travel_id,travel_detail_params ) do

    previous_travel_detail = get_previus_travel_detail_by_travel_id(travel_id)
    passangers_on_board_on_stop = travel_detail_params["passangers_get_on_stop"]- travel_detail_params["passangers_get_down_stop"]

    if (previous_travel_detail != nil) do
      passangers_on_board = passangers_on_board_on_stop + previous_travel_detail.passangers_on_board
      Map.put(travel_detail_params,  "passangers_on_board", passangers_on_board)
    else
      Map.put(travel_detail_params,"passangers_on_board",passangers_on_board_on_stop)
    end
  end

  @doc """
  Creates a travel_detail.

  ## Examples

      iex> create_travel_detail(%{field: value})
      {:ok, %TravelDetail{}}

      iex> create_travel_detail(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_travel_detail(attrs \\ %{}) do
    %TravelDetail{}
    |> TravelDetail.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a travel_detail.

  ## Examples

      iex> update_travel_detail(travel_detail, %{field: new_value})
      {:ok, %TravelDetail{}}

      iex> update_travel_detail(travel_detail, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_travel_detail(%TravelDetail{} = travel_detail, attrs) do
    travel_detail
    |> TravelDetail.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a travel_detail.

  ## Examples

      iex> delete_travel_detail(travel_detail)
      {:ok, %TravelDetail{}}

      iex> delete_travel_detail(travel_detail)
      {:error, %Ecto.Changeset{}}

  """
  def delete_travel_detail(%TravelDetail{} = travel_detail) do
    Repo.delete(travel_detail)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking travel_detail changes.

  ## Examples

      iex> change_travel_detail(travel_detail)
      %Ecto.Changeset{data: %TravelDetail{}}

  """
  def change_travel_detail(%TravelDetail{} = travel_detail, attrs \\ %{}) do
    TravelDetail.changeset(travel_detail, attrs)
  end
end
