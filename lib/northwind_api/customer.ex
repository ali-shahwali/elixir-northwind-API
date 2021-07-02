defmodule NorthwindApi.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:customer_id, :string, autogenerate: false}
  @foreign_key_type :string

  @derive {Jason.Encoder, only: [
    :address,
    :city,
    :company_name,
    :contact_name,
    :contact_title,
    :country,
    :fax,
    :phone,
    :postal_code,
    :region
    ]}

  schema "customers" do
    field :address, :string
    field :city, :string
    field :company_name, :string
    field :contact_name, :string
    field :contact_title, :string
    field :country, :string
    field :fax, :string
    field :phone, :string
    field :postal_code, :string
    field :region, :string

    has_many :orders, NorthwindApi.Order
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [:company_name, :contact_name, :contact_title, :address, :city, :region, :postal_code, :country, :phone, :fax])
    |> validate_required([:company_name, :contact_name, :contact_title, :address, :city, :region, :postal_code, :country, :phone, :fax])
  end
end
