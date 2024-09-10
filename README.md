# FoodTrucks

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

This is a phoenix-elixir API project with no web layout

Now you can visit [`localhost:4000/api/ping`](http://localhost:4000/api/ping) from browser or `curl-k 'http://localhost:4000/api/ping' -H 'accept: application/json'` from terminal to get 200 response.

Here are couple more APIs supported by this app

Get all food truck namea `http://localhost:4000/api/food_trucks` or `curl -k 'http://localhost:4000/api/food_trucks' -H 'accept: application/json'`
Get details of a truck name with location_id `http://localhost:4000/api/food_trucks/1569152` or `curl -k 'http://localhost:4000/api/food_trucks/1569152' -H 'accept: application/json'`
