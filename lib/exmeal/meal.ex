defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:description, :date, :calories]

  # Quando chamar o user na view só vai retornar no JSON os items a baixo
  @derive {Jason.Encoder, only: [:id, :descricao, :data, :calorias]}

  schema "meals" do
    field(:description, :string)
    field(:date, :utc_datetime)
    field(:calories, :string)

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> validations(params, @required_params)
    |> IO.inspect()
  end

  def changeset(meal, params) do
    meal
    |> validations(params, @required_params)
  end

  defp validations(struct, params, fields) do
    struct
    |> cast(params, fields)
    |> validate_required(fields)
    |> validate_number(:calories, greater_than: 0)
  end
end
