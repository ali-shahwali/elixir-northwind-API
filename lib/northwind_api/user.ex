defmodule NorthwindApi.User do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:country, :email, :name]}

  schema "users" do
    field :country, :string
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :country])
    |> validate_required([:name, :email, :country])
  end
end
