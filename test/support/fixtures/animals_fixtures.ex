defmodule LvjsDemo.AnimalsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LvjsDemo.Animals` context.
  """

  @doc """
  Generate a animal.
  """
  def animal_fixture(attrs \\ %{}) do
    {:ok, animal} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> LvjsDemo.Animals.create_animal()

    animal
  end
end
