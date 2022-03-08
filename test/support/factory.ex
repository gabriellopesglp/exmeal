defmodule Exmeal.Factory do
  use ExMachina.Ecto, repo: Exmeal.Repo

  alias Exmeal.Meal

  def meal_params_factory do
    %{
      "description" => "Banana",
      "date" => "07/03/2022",
      "calories" => 20
    }
  end

  def meal_changeset_factory do
    %{
      "description" => "Banana",
      "date" => ~U[2016-05-24 23:18:27.306043Z],
      "calories" => 20
    }
  end

  def meal_factory do
    %Meal{
      calories: 20,
      date: "2022-03-07T00:48:50Z",
      description: "Banana",
      id: "04f0fbd4-d231-40ea-8170-3a8cc20586bf"
    }
  end
end
