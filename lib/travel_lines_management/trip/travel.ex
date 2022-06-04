defmodule TravelLinesManagement.Trip.Travel do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Phoenix.Param, key: :travel_id}
  @primary_key {:travel_id, :id, autogenerate: true}

  schema "travels" do
    field :arrival, :naive_datetime
    field :departure, :naive_datetime
    field :status, :integer

    timestamps()
    belongs_to :line, TravelLinesManagement.Trip.Line, foreign_key: :line_id, references: :line_id
    belongs_to :vehicle, TravelLinesManagement.Trip.Vehicle, foreign_key: :vehicle_id, references: :vehicle_id
    has_many :travel_details, TravelLinesManagement.Trip.TravelDetail, foreign_key: :travel_id, references: :travel_id
  end

  @doc false
  def changeset(travel, attrs) do
    travel
    |> cast(attrs, [:departure, :arrival, :status, :line_id, :vehicle_id])
    |> validate_required([ :line_id, :vehicle_id, :status])
  end
end
