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
end
