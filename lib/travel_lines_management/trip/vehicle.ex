defmodule TravelLinesManagement.Trip.Vehicle do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Phoenix.Param, key: :vehicle_id}
  @primary_key {:vehicle_id, :id, autogenerate: true}

  schema "vehicles" do
    field :plate, :string
    field :status, :integer

    timestamps()
  end

  @doc false
  def changeset(vehicle, attrs) do
    vehicle
    |> cast(attrs, [:plate, :status])
    |> validate_required([:plate, :status])
  end
end
