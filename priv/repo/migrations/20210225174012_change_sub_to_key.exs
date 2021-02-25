defmodule Lti_1p3.DataProviders.EctoProvider.Repo.Migrations.ChangeSubToKey do
  use Ecto.Migration

  def change do
    drop unique_index(:lti_1p3_params, [:sub])

    rename table(:lti_1p3_params), :sub, to: :key

    create unique_index(:lti_1p3_params, [:key])
  end
end
