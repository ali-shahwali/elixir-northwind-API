defmodule NorthwindApiWeb.Router do
  use NorthwindApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", NorthwindApiWeb do
    pipe_through :api

    get "/shippers", ShipperController, :get_all
    get "/shippers/:id", ShipperController, :get_by_id
    delete "/shippers/:id", ShipperController, :delete_by_id
    patch "/shippers/:id", ShipperController, :update_shipper
    post "/shippers", ShipperController, :add_new

    get "/users", UserController, :get_all
    post "/users", UserController, :add_new
  end

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  scope "/" do
    forward "/", PhoenixSwagger.Plug.SwaggerUI,
      otp_app: :northwind_api,
      swagger_file: "swagger.json"
  end

  # Info displayed on swagger page
  def swagger_info do
    %{
      schemes: ["http", "https", "ws", "wss"],
      info: %{
        version: "1.0",
        title: "NorthwindApi",
        description: "API Documentation for Northwind v1",
        termsOfService: "Open for public",
        contact: %{
          name: "Ali Shahwali",
          email: "shahwali@kth.se"
        }
      },
      securityDefinitions: %{
        Bearer: %{
          type: "apiKey",
          name: "Authorization",
          description:
          "API Token must be provided via `Authorization: Bearer ` header",
      in: "header"
        }
      },
      consumes: ["application/json"],
      produces: ["application/json"],
    }
  end
end
