defmodule FoodTrucksWeb.Controllers.FoodTrucksTest do
  use FoodTrucksWeb.ConnCase, async: true

  import Phoenix.ConnTest

  @endpoint FoodTrucksWeb.Endpoint

  test "get by location", %{conn: conn} do
    conn = conn |> get("/api/food_trucks")
    json = json_response(conn, 200)
    assert json != nil
    %{"All Names" => all_names} = json
    assert Enum.count(all_names) == 629
  end

  test "fail get by location", %{conn: conn} do
    conn = conn |> get("/food_trucks")
    json = json_response(conn, 404)
    assert json == %{"errors" => %{"detail" => "Not Found"}}
  end
end
