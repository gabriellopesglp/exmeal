defmodule Exmeal.MealTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  alias Ecto.Changeset

  alias Exmeal.Meal

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:meal_changeset)

      response = Meal.changeset(params)

      assert %Changeset{
               changes: %{description: "Banana", date: _date, calories: 20},
               valid?: true
             } = response
    end
  end
end
