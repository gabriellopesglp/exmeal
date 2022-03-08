defmodule Exmeal.Meals.CreateTest do
  use Exmeal.DataCase, async: true

  import Exmeal.Factory

  alias Exmeal.{Error, Meal}

  describe "Create Meal" do
    test "when all params are valid, returns the meal" do
      params = build(:meal_params)

      response = Exmeal.create_meal(params)

      assert {:ok,
              %Meal{
                calories: 20,
                date: _date,
                description: "Banana",
                id: _id
              }} = response
    end

    test "when there are invalid params, returns an error" do
      params = build(:meal_params, %{"calories" => 0})

      response = Exmeal.create_meal(params)

      assert {:error, %Error{}} = response
    end
  end
end
