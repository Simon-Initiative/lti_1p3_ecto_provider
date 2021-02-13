defmodule Lti_1p3.DataProviders.EctoProvider.LtiParams do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lti_1p3_params" do
    field :sub, :string
    field :params, :map
    field :exp, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(nonce, attrs) do
    nonce
    |> cast(attrs, [:sub, :params, :exp])
    |> validate_required([:sub, :params, :exp])
    |> unique_constraint(:sub)
  end
end
