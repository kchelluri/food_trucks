defmodule FoodTrucks.StartupTask do
  @moduledoc """
  Startup task to parse food truck csv datga to erlang storage
  """

  def run, do: FoodTrucks.InitData.Import.execute()
end
