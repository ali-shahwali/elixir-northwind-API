defmodule NorthwindApi.Shipper do

  @moduledoc """
  Shipper model
  """

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:shipper_id, :id, autogenerate: true}
  @derive {Jason.Encoder, only: [:company_name, :phone]}

  schema "shippers" do
    field :company_name, :string
    field :phone, :string

  end

  @doc false
  def changeset(shipper, attrs) do
    shipper
    |> cast(attrs, [:company_name, :phone])
    |> validate_required([:company_name, :phone])
  end
end
