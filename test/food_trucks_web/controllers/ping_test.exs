defmodule FoodTrucksWeb.Controllers.PingTest do
  use FoodTrucksWeb.ConnCase, async: true

  import Phoenix.ConnTest

  @endpoint FoodTrucksWeb.Endpoint

  test "ping/pong", %{conn: conn} do
    conn = conn |> get("/api/ping")
    json = json_response(conn, 200)
    assert json == %{"ping" => "pong"}
  end

  test "fail ping/pong", %{conn: conn} do
    conn = conn |> get("/ping")
    json = json_response(conn, 404)
    assert json == %{"errors" => %{"detail" => "Not Found"}}
  end
end
