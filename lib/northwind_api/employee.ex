defmodule NorthwindApi.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:employee_id, :id, autogenerate: false}
  @foreign_key_type :id

  @derive {Jason.Encoder, only: [
    :address,
    :birth_date,
    :city,
    :country,
    :extension,
    :first_name,
    :hire_date,
    :home_phone,
    :last_name,
    :notes,
    :photo,
    :photo_path,
    :postal_code,
    :region,
    :reports_to,
    :title,
    :title_of_courtesy
    ]}

  schema "employees" do
    field :address, :string
    field :birth_date, :date
    field :city, :string
    field :country, :string
    field :extension, :string
    field :first_name, :string
    field :hire_date, :date
    field :home_phone, :string
    field :last_name, :string
    field :notes, :string
    field :photo, :binary
    field :photo_path, :string
    field :postal_code, :string
    field :region, :string
    field :reports_to, :integer
    field :title, :string
    field :title_of_courtesy, :string

    has_many :orders, NorthwindApi.Order
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:last_name, :first_name, :title, :title_of_courtesy, :birth_date, :hire_date, :address, :city, :region, :postal_code, :country, :home_phone, :extension, :photo, :notes, :reports_to, :photo_path])
    |> validate_required([:last_name, :first_name, :title, :title_of_courtesy, :birth_date, :hire_date, :address, :city, :region, :postal_code, :country, :home_phone, :extension, :photo, :notes, :reports_to, :photo_path])
  end
end
