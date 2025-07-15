defmodule Lti1p3EctoProvider.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Lti_1p3.DataProviders.EctoProvider.Repo
    ]

    opts = [strategy: :one_for_one, name: Lti1p3EctoProvider.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
