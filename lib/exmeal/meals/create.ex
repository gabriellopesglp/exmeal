defmodule Exmeal.Meals.Create do
  alias Exmeal.{Error, Repo, Meal, DateTimeFormatter}

  def call(params) do
    params
    |> DateTimeFormatter.call()
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Meal{}} = result), do: result

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
