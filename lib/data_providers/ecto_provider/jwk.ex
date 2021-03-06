defmodule Lti_1p3.DataProviders.EctoProvider.Jwk do
  use Ecto.Schema
  import Ecto.Changeset
  import Lti_1p3.DataProviders.EctoProvider.Config

  schema "lti_1p3_jwks" do
    field :pem, :string
    field :typ, :string
    field :alg, :string
    field :kid, :string
    field :active, :boolean, default: false

    has_many :registrations, schema(:registration), foreign_key: :tool_jwk_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(jwk, attrs \\ %{}) do
    jwk
    |> cast(attrs, [:pem, :typ, :alg, :kid, :active])
    |> validate_required([:pem, :typ, :alg, :kid])
  end
end
