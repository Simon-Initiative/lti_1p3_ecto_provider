Logger.configure(level: :warning)

ExUnit.start(exclude: [:skip])
Ecto.Adapters.SQL.Sandbox.mode(Lti_1p3.DataProviders.EctoProvider.Repo, :manual)
