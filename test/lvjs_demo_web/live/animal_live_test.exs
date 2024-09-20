defmodule LvjsDemoWeb.AnimalLiveTest do
  use LvjsDemoWeb.ConnCase

  import Phoenix.LiveViewTest
  import LvjsDemo.AnimalsFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  defp create_animal(_) do
    animal = animal_fixture()
    %{animal: animal}
  end

  describe "Index" do
    setup [:create_animal]

    test "lists all animals", %{conn: conn, animal: animal} do
      {:ok, _index_live, html} = live(conn, ~p"/animals")

      assert html =~ "Listing Animals"
      assert html =~ animal.name
    end

    test "saves new animal", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/animals")

      assert index_live |> element("a", "New Animal") |> render_click() =~
               "New Animal"

      assert_patch(index_live, ~p"/animals/new")

      assert index_live
             |> form("#animal-form", animal: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#animal-form", animal: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/animals")

      html = render(index_live)
      assert html =~ "Animal created successfully"
      assert html =~ "some name"
    end

    test "updates animal in listing", %{conn: conn, animal: animal} do
      {:ok, index_live, _html} = live(conn, ~p"/animals")

      assert index_live |> element("#animals-#{animal.id} a", "Edit") |> render_click() =~
               "Edit Animal"

      assert_patch(index_live, ~p"/animals/#{animal}/edit")

      assert index_live
             |> form("#animal-form", animal: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#animal-form", animal: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/animals")

      html = render(index_live)
      assert html =~ "Animal updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes animal in listing", %{conn: conn, animal: animal} do
      {:ok, index_live, _html} = live(conn, ~p"/animals")

      assert index_live |> element("#animals-#{animal.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#animals-#{animal.id}")
    end
  end

  describe "Show" do
    setup [:create_animal]

    test "displays animal", %{conn: conn, animal: animal} do
      {:ok, _show_live, html} = live(conn, ~p"/animals/#{animal}")

      assert html =~ "Show Animal"
      assert html =~ animal.name
    end

    test "updates animal within modal", %{conn: conn, animal: animal} do
      {:ok, show_live, _html} = live(conn, ~p"/animals/#{animal}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Animal"

      assert_patch(show_live, ~p"/animals/#{animal}/show/edit")

      assert show_live
             |> form("#animal-form", animal: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#animal-form", animal: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/animals/#{animal}")

      html = render(show_live)
      assert html =~ "Animal updated successfully"
      assert html =~ "some updated name"
    end
  end
end
