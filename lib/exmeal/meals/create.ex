defmodule Exmeal.Meals.Create do
  alias Exmeal.{Error, Repo, Meal}

  def call(params) do
    params
    |> build_datetime()
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp build_datetime(%{"date" => date} = params) do
    [dd, mm, yyyy] = String.split(date, "/")
    {:ok, formatedDate} = Date.from_iso8601("#{yyyy}-#{mm}-#{dd}")

    {:ok, dateTime} = DateTime.new(formatedDate, Time.utc_now(), "Etc/UTC")

    params = Map.replace(params, "date", dateTime)

    params
  end

  defp handle_insert({:ok, %Meal{}} = result), do: result

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
