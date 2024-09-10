defmodule FoodTrucksWeb.Controllers.FoodTrucks do
  @moduledoc """
  Simple controller to fetch all food truck names.
  """
  use FoodTrucksWeb, :controller
  alias FoodTrucks.InitData.TruckData

  def fetch_trucks(conn, _params) do
    IO.inspect("Here all trucks")

    conn
    |> put_status(:ok)
    |> json(%{"All Names": TruckData.all_names()})
  end
end
