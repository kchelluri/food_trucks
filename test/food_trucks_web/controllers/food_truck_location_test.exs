defmodule FoodTrucksWeb.Controllers.FoodTruckLocationTest do
  use FoodTrucksWeb.ConnCase, async: true

  import Phoenix.ConnTest

  @endpoint FoodTrucksWeb.Endpoint

  test "get by location", %{conn: conn} do
    conn = conn |> get("/api/food_trucks/1569152")
    json = json_response(conn, 200)
    assert json != nil
    [%{"__raw__" => value}] = json
    assert value != nil
    [head | _tail] = value
    assert "1569152" == head
  end

  test "fail get by location", %{conn: conn} do
    conn = conn |> get("/food_trucks/1569152")
    json = json_response(conn, 404)
    assert json == %{"errors" => %{"detail" => "Not Found"}}
  end
end
