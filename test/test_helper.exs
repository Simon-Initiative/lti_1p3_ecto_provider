Logger.configure(level: :warning)

# Start the application dependencies and repo for testing
Application.ensure_all_started(:lti_1p3_ecto_provider)
{:ok, _} = Lti_1p3.DataProviders.EctoProvider.Repo.start_link()

ExUnit.start(exclude: [:skip])
Ecto.Adapters.SQL.Sandbox.mode(Lti_1p3.DataProviders.EctoProvider.Repo, :manual)
