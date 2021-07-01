defmodule NorthwindApiWeb.UserController do

  use NorthwindApiWeb, :controller
  use PhoenixSwagger

  alias NorthwindApi.User
  alias NorthwindApi.Repo

  swagger_path :get_all do
    get("/users")
    description "List of all users"
    response 200, "Success"
  end

  swagger_path :add_new do
    post("/users")
    description "Add new user"
    response 200, "Success"

    parameters do
      name :query, :string, "name", required: true
      email :query, :string, "email", required: true
      country :query, :string, "email", required: true
    end
  end

  def get_all(conn, _params) do
    users = Repo.all(User)
    json(conn, users)
  end

  def add_new(conn, %{"name" => name, "email" => email, "country" => country}) do
    user = %User{name: name, email: email, country: country}
    Repo.insert!(user)
    json(conn, user)
  end

end
