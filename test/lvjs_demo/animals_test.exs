defmodule LvjsDemo.AnimalsTest do
  use LvjsDemo.DataCase

  alias LvjsDemo.Animals

  describe "animals" do
    alias LvjsDemo.Animals.Animal

    import LvjsDemo.AnimalsFixtures

    @invalid_attrs %{name: nil}

    test "list_animals/0 returns all animals" do
      animal = animal_fixture()
      assert Animals.list_animals() == [animal]
    end

    test "get_animal!/1 returns the animal with given id" do
      animal = animal_fixture()
      assert Animals.get_animal!(animal.id) == animal
    end

    test "create_animal/1 with valid data creates a animal" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Animal{} = animal} = Animals.create_animal(valid_attrs)
      assert animal.name == "some name"
    end

    test "create_animal/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Animals.create_animal(@invalid_attrs)
    end

    test "update_animal/2 with valid data updates the animal" do
      animal = animal_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Animal{} = animal} = Animals.update_animal(animal, update_attrs)
      assert animal.name == "some updated name"
    end

    test "update_animal/2 with invalid data returns error changeset" do
      animal = animal_fixture()
      assert {:error, %Ecto.Changeset{}} = Animals.update_animal(animal, @invalid_attrs)
      assert animal == Animals.get_animal!(animal.id)
    end

    test "delete_animal/1 deletes the animal" do
      animal = animal_fixture()
      assert {:ok, %Animal{}} = Animals.delete_animal(animal)
      assert_raise Ecto.NoResultsError, fn -> Animals.get_animal!(animal.id) end
    end

    test "change_animal/1 returns a animal changeset" do
      animal = animal_fixture()
      assert %Ecto.Changeset{} = Animals.change_animal(animal)
    end
  end
end
