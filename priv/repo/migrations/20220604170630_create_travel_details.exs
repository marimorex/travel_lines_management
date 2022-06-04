defmodule TravelLinesManagement.Repo.Migrations.CreateTravelDetails do
  use Ecto.Migration

  def change do
    create table(:travel_details, primary_key: false) do
      add :departure, :naive_datetime
      add :arrival, :naive_datetime
      add :status, :integer
      add :passangers_get_on_stop, :integer
      add :passangers_get_down_stop, :integer
      add :passangers_on_board, :integer

      timestamps()
      add :travel_id, references(:travels, on_delete: :delete_all, column: :travel_id), primary_key: true
      add :stop_id, references(:stops, on_delete: :delete_all, column: :stop_id), primary_key: true
    end
  end
end
