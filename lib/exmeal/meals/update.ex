defmodule Exmeal.Meals.Update do
  alias Exmeal.{Error, Repo, Meal}

  def call(%{"id" => id} = params) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_meal_not_found_error()}
      meal -> do_update(meal, params)
    end
  end

  defp do_update(meal, params) do
    params = build_datetime(params)

    meal
    |> Meal.changeset(params)
    |> Repo.update()
  end

  defp build_datetime(%{"date" => date} = params) when is_bitstring(date) do
    [dd, mm, yyyy] = String.split(date, "/")
    {:ok, formatedDate} = Date.from_iso8601("#{yyyy}-#{mm}-#{dd}")

    {:ok, dateTime} = DateTime.new(formatedDate, Time.utc_now(), "Etc/UTC")

    params = Map.replace(params, "date", dateTime)

    params
  end

  defp build_datetime(params), do: params
end
