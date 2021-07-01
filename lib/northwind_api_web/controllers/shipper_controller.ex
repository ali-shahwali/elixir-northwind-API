defmodule NorthwindApiWeb.ShipperController do

  use NorthwindApiWeb, :controller
  use PhoenixSwagger

  alias NorthwindApi.Shipper
  alias NorthwindApi.Repo

  swagger_path :get_all do
    get("/shippers")
    description "List of all shippers"
    response 200, "Success"
  end

  swagger_path :get_by_id do
    get("/shippers/{id}")
    description "Get a single shipper by id"
    response 200, "Success"

    parameters do
      id :path, :integer, "Shipper id", required: true
    end
  end

  swagger_path :delete_by_id do
    delete("/shippers/{id}")
    description "Delete shipper by id"
    response 200, "Success"

    parameters do
      id :path, :integer, "Shipper id", required: true
    end
  end

  swagger_path :update_shipper do
    patch("/shippers/{id}")
    description "Update shipper by id"
    response 200, "Success"

    parameters do
      id :path, :integer, "Shipper id", required: true
      company_name :query, :string, "Company name"
    end
  end

  swagger_path :add_new do
    post("/shippers")
    description "Add new shipper"
    response 200, "Success"

    parameters do
      company_name :query, :string, "Company name", required: true
      phone :query, :string, "Phone number", required: true
    end
  end

  def get_all(conn, _params) do
    shippers = Repo.all(Shipper)
    json(conn, shippers)
  end

  def get_by_id(conn, %{"id" => id}) do
    shipper = Repo.get!(Shipper, id)
    json(conn, shipper)
  end

  def delete_by_id(conn, %{"id" => id}) do
    shipper = Repo.get!(Shipper, id)
    Repo.delete(shipper)
    json(conn, shipper)
  end

  def update_shipper(conn, %{"id" => id, "company_name" => company_name}) do
    shipper = Repo.get!(Shipper, id)
    shipper = Ecto.Changeset.change(shipper, company_name: company_name)
    Repo.update(shipper)
    json(conn, shipper.data)
  end

  def add_new(conn, %{"phone" => phone, "company_name" => company_name}) do
    shipper = %Shipper{company_name: company_name, phone: phone}
    Repo.insert!(shipper)
    json(conn, shipper)
  end

end
