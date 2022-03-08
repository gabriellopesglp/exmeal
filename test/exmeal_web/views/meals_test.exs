defmodule ExmealWeb.MealsViewTest do
  use ExmealWeb.ConnCase, async: true

  import Exmeal.Factory
  import Phoenix.View

  alias Exmeal.Meal
  alias ExmealWeb.MealsView

  test "render create.json" do
    params = build(:meal_params)
    {_ok, meal} = Exmeal.create_meal(params)

    response = render(MealsView, "create.json", meal: meal)

    assert %{
             meal: %Meal{
               __meta__: _meta,
               calories: 20,
               date: _date,
               description: "Banana",
               id: _id,
               inserted_at: _inserted,
               updated_at: _updated
             },
             message: "Meal created!"
           } = response
  end

  test "render meal.json" do
    params = build(:meal_params)
    {_ok, meal} = Exmeal.create_meal(params)

    response = render(MealsView, "meal.json", meal: meal)

    assert %{
             meal: %Meal{
               calories: 20,
               date: _date,
               description: "Banana",
               id: _id
             }
           } = response
  end
end
