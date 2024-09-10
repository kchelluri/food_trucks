defmodule FoodTrucksWeb.Controllers.Ping do
  @moduledoc """
  Simple controller to respond to a ping API call.
  """
  use FoodTrucksWeb, :controller

  @spec ping(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def ping(conn, _params) do
    IO.inspect("Here")

    conn
    |> put_status(:ok)
    |> json(%{ping: "pong"})
  end
end
