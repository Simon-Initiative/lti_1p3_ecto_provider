defmodule Lti_1p3.DataProviders.EctoProvider.PlatformRole do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lti_1p3_platform_roles" do
    field(:uri, :string)
  end

  @doc false
  def changeset(platform_role, attrs \\ %{}) do
    platform_role
    |> cast(attrs, [:uri])
    |> validate_required([:uri])
    |> unique_constraint(:uri)
  end

  defimpl Jason.Encoder do
    @impl Jason.Encoder
    def encode(value, opts) do
      Jason.Encode.string(value.uri, opts)
    end
  end
end
