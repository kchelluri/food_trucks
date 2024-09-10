defmodule FoodTrucksWeb.Router do
  use FoodTrucksWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FoodTrucksWeb do
    pipe_through :api

    get "/ping", Controllers.Ping, :ping
    get "/food_trucks", Controllers.FoodTrucks, :fetch_trucks
    get "/food_trucks/:location_id", Controllers.FoodTruckLocation, :fetch_location
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:food_trucks, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: FoodTrucksWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
