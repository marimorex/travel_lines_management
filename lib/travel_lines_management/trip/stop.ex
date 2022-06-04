defmodule TravelLinesManagement.Trip.Stop do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Phoenix.Param, key: :stop_id}
  @primary_key {:stop_id, :id, autogenerate: true}

  schema "stops" do
    field :city_name, :string
    field :gps_latitude, :float
    field :gps_longitude, :float
    field :name, :string
    field :order, :integer
    field :status, :integer
    field :time, :time

    timestamps()
    belongs_to :line, TravelLinesManagement.Trip.Line, foreign_key: :line_id, references: :line_id

  end

  @doc false
  def changeset(stop, attrs) do
    stop
    |> cast(attrs, [:name, :order, :city_name, :time, :gps_latitude, :gps_longitude, :status])
    |> validate_required([:name, :order, :city_name, :time, :status])
  end
end
