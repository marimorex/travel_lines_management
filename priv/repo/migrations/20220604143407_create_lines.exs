defmodule TravelLinesManagement.Repo.Migrations.CreateLines do
  use Ecto.Migration

  def change do
    create table(:lines) do
      add :name, :string
      add :description, :string
      add :status, :integer

      timestamps()
    end
  end
end
