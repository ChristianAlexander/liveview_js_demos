defmodule LvjsDemo.Animals.Animal do
  use Ecto.Schema
  import Ecto.Changeset

  schema "animals" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(animal, attrs) do
    animal
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
