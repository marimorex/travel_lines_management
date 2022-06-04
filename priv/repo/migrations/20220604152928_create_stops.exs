defmodule TravelLinesManagement.Repo.Migrations.CreateStops do
  use Ecto.Migration

  def change do
    create table(:stops, primary_key: false) do
      add :stop_id, :serial, primary_key: true
	    add :line_id, references(:lines, on_delete: :delete_all, column: :id)
      add :name, :string
      add :order, :integer
      add :city_name, :string
      add :time, :time
      add :gps_latitude, :float
      add :gps_longitude, :float
      add :status, :integer

      timestamps()
    end
  end
end
