import Config

config :lti_1p3,
  provider: Lti_1p3.DataProviders.EctoProvider,
  ecto_provider: [
    repo: Lti_1p3.DataProviders.EctoProvider.Repo
  ]

config :lti_1p3_ecto_provider, Lti_1p3.DataProviders.EctoProvider.Repo,
  username: System.get_env("TEST_DB_USER", "postgres"),
  password: System.get_env("TEST_DB_PASSWORD", "postgres"),
  database: System.get_env("TEST_DB_NAME", "lti_1p3_test"),
  hostname: System.get_env("TEST_DB_HOST", "localhost"),
  pool: Ecto.Adapters.SQL.Sandbox,
  priv: "priv/repo"
