# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Repo.insert!(%Oli.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# Ensure the application dependencies are started
Application.ensure_all_started(:lti_1p3_ecto_provider)

# Start the repo manually since the application no longer auto-starts
{:ok, _} = Lti_1p3.DataProviders.EctoProvider.Repo.start_link()

alias Lti_1p3.DataProviders.EctoProvider
alias Lti_1p3.DataProviders.EctoProvider.Repo

# create a default active lti_1p3 jwk
if !Repo.get_by(EctoProvider.Jwk, id: 1) do
  %{private_key: private_key} = Lti_1p3.KeyGenerator.generate_key_pair()
  {:ok, _jwk} = EctoProvider.create_jwk(%Lti_1p3.Jwk{
    pem: private_key,
    typ: "JWT",
    alg: "RS256",
    kid: UUID.uuid4(),
    active: true,
  })
end

# create lti_1p3 platform roles
if !Repo.get_by(EctoProvider.PlatformRole, id: 1) do
  Lti_1p3.Roles.PlatformRoles.list_roles()
  |> Enum.map(fn t -> struct(EctoProvider.PlatformRole, Map.from_struct(t)) end)
  |> Enum.map(&EctoProvider.PlatformRole.changeset/1)
  |> Enum.map(fn t -> Repo.insert!(t, on_conflict: :replace_all, conflict_target: :id) end)
end

# create lti_1p3 context roles
if !Repo.get_by(EctoProvider.ContextRole, id: 1) do
  Lti_1p3.Roles.ContextRoles.list_roles()
  |> Enum.map(fn t -> struct(EctoProvider.ContextRole, Map.from_struct(t)) end)
  |> Enum.map(&EctoProvider.ContextRole.changeset/1)
  |> Enum.map(fn t -> Repo.insert!(t, on_conflict: :replace_all, conflict_target: :id) end)
end
