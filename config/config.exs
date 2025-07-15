import Config

config :lti_1p3,
  provider: Lti_1p3.DataProviders.EctoProvider,
  ecto_provider: [
    repo: Lti_1p3.DataProviders.EctoProvider.Repo
  ]

config :lti_1p3_ecto_provider,
  ecto_repos: [
    Lti_1p3.DataProviders.EctoProvider.Repo
  ]

config :lti_1p3_ecto_provider, Lti_1p3.DataProviders.EctoProvider.Repo,
  username: System.get_env("DB_USER", "postgres"),
  password: System.get_env("DB_PASSWORD", "postgres"),
  database: System.get_env("DB_NAME", "lti_1p3_dev"),
  hostname: System.get_env("DB_HOST", "localhost"),
  pool_size: 10,
  priv: "priv/repo"

if Mix.env() == :test do
  import_config "test.exs"
end
