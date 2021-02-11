Logger.configure(level: :warn)

ExUnit.start(exclude: [:skip])

# Ensure that symlink to custom ecto priv directory exists
source = Lti_1p3.DataProviders.EctoProvider.Repo.config()[:priv]
target = Application.app_dir(:lti_1p3_ecto_provider, source)
File.rm_rf(target)
File.mkdir_p(target)
File.rmdir(target)
:ok = :file.make_symlink(Path.expand(source), target)

Mix.Task.run("ecto.drop", ~w(--quiet -r Lti_1p3.DataProviders.EctoProvider.Repo))
Mix.Task.run("ecto.create", ~w(--quiet -r Lti_1p3.DataProviders.EctoProvider.Repo))
Mix.Task.run("ecto.migrate", ~w(--quiet -r Lti_1p3.DataProviders.EctoProvider.Repo))

{:ok, _pid} = Lti_1p3.DataProviders.EctoProvider.Repo.start_link()
Ecto.Adapters.SQL.Sandbox.mode(Lti_1p3.DataProviders.EctoProvider.Repo, :manual)
