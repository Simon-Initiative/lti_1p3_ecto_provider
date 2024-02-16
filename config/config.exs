import Config

config :lti_1p3_ecto_provider,
  ecto_repos: [
    Lti_1p3.DataProviders.EctoProvider.Repo
  ]

if Mix.env() == :test do
  import_config "test.exs"
end
