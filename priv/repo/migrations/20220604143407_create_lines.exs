defmodule TravelLinesManagement.Repo.Migrations.CreateLines do
  use Ecto.Migration

  def change do
    create table(:lines, primary_key: false) do
      add :line_id, :serial, primary_key: true
      add :name, :string
      add :description, :string
      add :status, :integer

      timestamps()
    end
  end
end
