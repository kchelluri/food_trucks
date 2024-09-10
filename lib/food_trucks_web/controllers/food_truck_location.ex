defmodule FoodTrucksWeb.Controllers.FoodTruckLocation do
  @moduledoc """
  Simple controller to respond to a food_tuck_location API call.
  """
  use FoodTrucksWeb, :controller
  alias FoodTrucks.InitData.TruckData

  @spec fetch_location(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def fetch_location(conn, %{"location_id" => location_id}) do
    conn
    |> put_status(:ok)
    |> json(TruckData.lookup(location_id))
  end
end
