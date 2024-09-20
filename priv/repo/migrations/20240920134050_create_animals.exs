defmodule LvjsDemo.Repo.Migrations.CreateAnimals do
  use Ecto.Migration

  def change do
    create table(:animals) do
      add :name, :text

      timestamps(type: :utc_datetime)
    end
  end
end
