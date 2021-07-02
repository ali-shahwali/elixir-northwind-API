defmodule NorthwindApi.Order do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:order_id, :id, autogenerate: false}

  @derive {Jason.Encoder, only: [
    :freight,
    :order_date,
    :required_date,
    :ship_address,
    :ship_city,
    :ship_country,
    :ship_name,
    :ship_postal_code,
    :ship_region,
    :ship_via,
    :shipped_date
    ]}

  schema "orders" do
    field :freight, :float
    field :order_date, :date
    field :required_date, :date
    field :ship_address, :string
    field :ship_city, :string
    field :ship_country, :string
    field :ship_name, :string
    field :ship_postal_code, :string
    field :ship_region, :string
    field :ship_via, :integer
    field :shipped_date, :date

    belongs_to :customers, NorthwindApi.Customer, type: :string, foreign_key: :customer_id
    belongs_to :employees, NorthwindApi.Employee, type: :id,  foreign_key: :employee_id


  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:customer_id, :employee_id, :order_date, :required_date, :shipped_date, :ship_via, :freight, :ship_name, :ship_address, :ship_city, :ship_region, :ship_postal_code, :ship_country])
    |> validate_required([:customer_id, :employee_id, :order_date, :required_date, :shipped_date, :ship_via, :freight, :ship_name, :ship_address, :ship_city, :ship_region, :ship_postal_code, :ship_country])
  end
end
