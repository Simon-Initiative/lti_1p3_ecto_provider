defmodule Lti_1p3.DataProviders.EctoProvider.Repo do
  use Ecto.Repo,
    otp_app: :lti_1p3_ecto_provider,
    adapter: Ecto.Adapters.Postgres
end
