# FoodTrucks

A simple API project that parses the the CSV file on startup and saves in Erland term storage. Designed to avoid Database for simplicity. As an extension this data can be saved to database table and APIs can start querying the table for all sorts of data combinations

Developed two APIs to fetch all truck names as a list and the second API to fetch all data related to one location_id

Steps to start application

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

This is a phoenix-elixir API project with no web layout

APIs

  * Ping - Can visit [`localhost:4000/api/ping`](http://localhost:4000/api/ping) from browser or `curl-k 'http://localhost:4000/api/ping' -H 'accept: application/json'` from terminal to get 200 response.

  * All truck names - Get all food truck names [`localhost:4000/api/food_trucks`](http://localhost:4000/api/food_trucks) or `curl -k 'http://localhost:4000/api/food_trucks' -H 'accept: application/json'`

  * All details of a locaiton_id - Get details of a truck name with location_id [`localhost:4000/api/food_trucks/1569152`](http://localhost:4000/api/food_trucks/1569152) or `curl -k 'http://localhost:4000/api/food_trucks/1569152' -H 'accept: application/json'`

-- Tests
Unit tests are provided for all 3 APIs for success and failure scenarios. This can be enhanced to monitor code coverage 

-- Credo, Dialyzer are not added in this project but can easily be added to mix.exs for standartization and formatting