defmodule Lti_1p3.DataProviders.EctoProvider.PlatformInstance do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lti_1p3_platform_instances" do
    field(:guid, :string)
    field(:name, :string)
    field(:description, :string)
    field(:client_id, :string)
    field(:target_link_uri, :string)
    field(:login_url, :string)
    field(:keyset_url, :string)
    field(:redirect_uris, :string)
    field(:custom_params, :string)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(platform_instance, attrs) do
    platform_instance
    |> cast(attrs, [
      :guid,
      :name,
      :description,
      :client_id,
      :target_link_uri,
      :login_url,
      :keyset_url,
      :redirect_uris,
      :custom_params
    ])
    |> validate_required([
      :guid,
      :name,
      :client_id,
      :target_link_uri,
      :login_url,
      :keyset_url,
      :redirect_uris
    ])
  end
end
