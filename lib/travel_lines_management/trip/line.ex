defmodule TravelLinesManagement.Trip.Line do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Phoenix.Param, key: :line_id}
  @primary_key {:line_id, :id, autogenerate: true}

  schema "lines" do
    field :description, :string
    field :name, :string
    field :status, :integer

    timestamps()
  end

  @doc false
  def changeset(line, attrs) do
    line
    |> cast(attrs, [:name, :description, :status])
    |> validate_required([:name, :status])
  end
end
