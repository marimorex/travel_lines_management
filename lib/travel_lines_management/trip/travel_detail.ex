defmodule TravelLinesManagement.Trip.TravelDetail do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false

  schema "travel_details" do
    field :arrival, :naive_datetime
    field :departure, :naive_datetime
    field :passangers_get_down_stop, :integer
    field :passangers_get_on_stop, :integer
    field :passangers_on_board, :integer
    field :status, :integer

    timestamps()
    belongs_to :travel,TravelLinesManagement.Trip.Travel, foreign_key: :travel_id, references: :travel_id, primary_key: true
    belongs_to :stop, TravelLinesManagement.Trip.Stop, foreign_key: :stop_id, references: :stop_id, primary_key: true

  end

  @doc false
  def changeset(travel_detail, attrs) do
    travel_detail
    |> cast(attrs, [:departure, :arrival, :status, :passangers_get_on_stop, :passangers_get_down_stop, :passangers_on_board, :travel_id, :stop_id])
    |> validate_required([:status, :passangers_get_on_stop, :passangers_get_down_stop, :passangers_on_board, :travel_id, :stop_id])
  end
end
