defmodule Lti1p3EctoProvider.MixProject do
  use Mix.Project

  def project do
    [
      app: :lti_1p3_ecto_provider,
      version: "0.2.1",
      elixir: "~> 1.11",
      elixirc_paths: elixirc_paths(Mix.env()),
      elixirc_options: elixirc_options(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        test: :test,
        "test.watch": :test,
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
        "coveralls.xml": :test
      ],

      package: package(),
      description: description(),

      name: "Lti 1p3 Ecto Provider",
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:excoveralls, "~> 0.10", only: :test},
      {:ex_doc, "~> 0.23", only: :dev, runtime: false},
      {:ecto_sql, "~> 3.1"},
      {:httpoison, "~> 1.6"},
      {:lti_1p3, "~> 0.3.1"},
      {:mox, "~> 0.5", only: :test},
      {:postgrex, ">= 0.0.0"},
      {:timex, "~> 3.5"},
      {:uuid, "~> 1.1" },
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp elixirc_options(:dev), do: []
  defp elixirc_options(:test), do: []
  defp elixirc_options(_), do: [warnings_as_errors: true]

  defp description do
    """
    An Ecto-based DataProvider implementation for the Lti_1p3 library
    """
  end

  defp package do
    [
      files: ["lib", "priv", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Open Learning Initiative"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/Simon-Initiative/lti_1p3_ecto_provider"}
    ]
  end

  defp docs() do
    [
      main: "readme",
      extras: [
        "README.md",
      ]
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.seed": ["run priv/repo/seeds.exs"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "ecto.seed"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["test"],

      # runs tests in deterministic order, only shows one failure at a time and reruns tests if any changes are made
      "test.watch": ["test.watch --stale --max-failures 1 --trace --seed 0"],
    ]
  end
end
