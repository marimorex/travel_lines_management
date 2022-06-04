defmodule TravelLinesManagement.Repo.Migrations.CreateVehicles do
  use Ecto.Migration

  def change do
    create table(:vehicles, primary_key: false) do
      add :vehicle_id, :serial, primary_key: true
      add :plate, :string
      add :status, :integer

      timestamps()
    end
  end
end
