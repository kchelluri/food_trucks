defmodule FoodTrucks.InitData.TruckData do
  @moduledoc """
  Import truck data into an ets table named `:truck_data`.
  """
  alias FoodTrucks.InitData.Parser
  @table_name :truck_data

  @doc """
  Import truck data into an ETS table. Result should be an `:ok`
  tuple containing also a count of records imported, `{:ok, count}`.
  """
  @spec import(String.t()) :: {:ok, integer()}
  def import(filename) do
    :ets.new(@table_name, [:bag, :public, :named_table])

    count =
      filename
      |> Parser.stream()
      |> Stream.map(&insert/1)
      |> Enum.count()

    {:ok, count}
  end

  @spec insert(Parser.t()) :: boolean()
  defp insert(%Parser{} = data), do: :ets.insert(@table_name, {data.locationid, data})

  @doc """
  Lookup truck data by locationid.
  """
  @spec lookup(String.t()) :: list(Parser.t())
  def lookup(location_id),
    do: @table_name |> :ets.lookup(location_id) |> Enum.map(fn {_key, record} -> record end)

  @doc """
  Fetchs all food truck names in a list
  """
  @spec all_names() :: list()
  def all_names do
    :ets.tab2list(@table_name)
    |> Enum.map(fn {_key, struct} -> struct.applicant end)
  end
end
