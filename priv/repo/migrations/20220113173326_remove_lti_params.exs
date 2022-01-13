defmodule Lti_1p3.DataProviders.EctoProvider.Repo.Migrations.RemoveLtiParams do
  use Ecto.Migration

  def change do
    drop table(:lti_1p3_params)
  end
end
