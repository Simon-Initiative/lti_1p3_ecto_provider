defmodule Lti_1p3.DataProviders.EctoProvider.Registration do
  use Ecto.Schema
  import Ecto.Changeset
  import Lti_1p3.DataProviders.EctoProvider.Config

  schema "lti_1p3_registrations" do
    field :issuer, :string
    field :client_id, :string
    field :key_set_url, :string
    field :auth_token_url, :string
    field :auth_login_url, :string
    field :auth_server, :string

    has_many :deployments, schema(:deployment)
    belongs_to :tool_jwk, schema(:jwk), foreign_key: :tool_jwk_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(registration, attrs \\ %{}) do
    registration
    |> cast(attrs, [
      :issuer,
      :client_id,
      :key_set_url,
      :auth_token_url,
      :auth_login_url,
      :auth_server,
      :tool_jwk_id,
    ])
    |> validate_required([
      :issuer,
      :client_id,
      :key_set_url,
      :auth_token_url,
      :auth_login_url,
      :auth_server,
      :tool_jwk_id,
    ])
  end
end
