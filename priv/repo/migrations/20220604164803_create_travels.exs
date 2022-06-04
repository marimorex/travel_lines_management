defmodule TravelLinesManagement.Repo.Migrations.CreateTravels do
  use Ecto.Migration

  def change do
    create table(:travels, primary_key: false) do
      add :travel_id, :serial, primary_key: true
	    add :line_id, references(:lines, on_delete: :delete_all, column: :line_id)
	    add :vehicle_id, references(:vehicles, on_delete: :delete_all, column: :vehicle_id)
      add :departure, :naive_datetime
      add :arrival, :naive_datetime
      add :status, :integer

      timestamps()
    end
  end
end
