defmodule NorthwindApiWeb.OrderController do

  use NorthwindApiWeb, :controller
  use PhoenixSwagger

  import Ecto.Query, only: [from: 2]

  alias NorthwindApi.Order
  alias NorthwindApi.Repo

  swagger_path :get_all do
    get("/orders")
    description "List of all orders"
    response 200, "Success"
  end

  swagger_path :get_by_customer_id do
    get("/orders/{id}")
    description "List of all orders by customer id"
    response 200, "Success"

    parameters do
      id :path, :string, "Customer id", required: true
    end
  end

  def get_all(conn, _params) do
    orders = Repo.all(Order)
    json(conn, orders)
  end

  def get_by_customer_id(conn, %{"id" => id}) do
    orders = Repo.all(from x in Order, where: x.customer_id == ^id)
    json(conn, orders)
  end

end
