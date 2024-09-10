defmodule FoodTrucksWeb.Controllers.FoodTrucks do
  @moduledoc """
  Simple controller to fetch all food truck names.
  """
  use FoodTrucksWeb, :controller
  alias FoodTrucks.InitData.TruckData

  @spec fetch_trucks(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def fetch_trucks(conn, _params) do
    conn
    |> put_status(:ok)
    |> json(%{"All Names": TruckData.all_names()})
  end
end
