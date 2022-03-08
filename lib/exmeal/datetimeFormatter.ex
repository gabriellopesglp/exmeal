defmodule Exmeal.DateTimeFormatter do
  def call(%{"date" => date} = params) do
    with [dd, mm, yyyy] <- String.split(date, "/"),
         {:ok, formatedDate} <- Date.from_iso8601("#{yyyy}-#{mm}-#{dd}"),
         {:ok, dateTime} <- DateTime.new(formatedDate, Time.utc_now(), "Etc/UTC") do
      params = Map.replace(params, "date", dateTime)
      params
    end
  end

  def call(params), do: params
end
