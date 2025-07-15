defmodule Lti_1p3.DataProviders.EctoProvider.Repo.Migrations.AddPlatformInstanceStatusField do
  use Ecto.Migration

  def change do
    alter table(:lti_1p3_platform_instances) do
      add :status, :string, default: "active", null: false
    end
  end
end
