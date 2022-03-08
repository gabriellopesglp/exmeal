defmodule Exmeal.Meals.GetTest do
  use Exmeal.DataCase, async: true

  import Exmeal.Factory

  alias Exmeal.{Error, Meal}

  describe "Get Meal" do
    test "when a valid id is given, returns the meal" do
      params = build(:meal_params)

      {_ok, meal} = Exmeal.create_meal(params)

      response = Exmeal.get_meal_by_id(meal.id)

      assert {:ok,
              %Meal{
                calories: 20,
                date: _date,
                description: "Banana",
                id: _id
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"
      response = Exmeal.get_meal_by_id(id)

      assert {:error, %Error{result: "Meal not found", status: :not_found}} = response
    end
  end
end
