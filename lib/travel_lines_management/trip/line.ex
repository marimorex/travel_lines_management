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
    has_many :stops, TravelLinesManagement.Trip.Stop, foreign_key: :line_id, references: :line_id
    has_many :travels, TravelLinesManagement.Trip.Travel, foreign_key: :line_id, references: :line_id
  end

  @spec changeset(
          {map, map}
          | %{
              :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
              optional(atom) => any
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(line, attrs) do
    line
    |> cast(attrs, [:name, :description, :status])
    |> validate_required([:name, :status])
  end
end
