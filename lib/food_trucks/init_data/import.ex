defmodule FoodTrucks.InitData.Import do
  @moduledoc """
  Import static food trucks data
  """
  alias FoodTrucks.InitData.TruckData

  def execute() do
    {:ok, _location_count} = TruckData.import("Mobile_Food_Facility_Permit.csv")
  end
end
