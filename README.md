# Lti 1p3 Ecto Provider

[![Hex.pm](https://img.shields.io/hexpm/v/lti_1p3_ecto_provider)](https://hex.pm/packages/lti_1p3_ecto_provider)
[![GitHub](https://img.shields.io/github/license/Simon-Initiative/lti_1p3_ecto_provider?color=blue)](https://github.com/Simon-Initiative/lti_1p3_ecto_provider/blob/master/LICENSE)
[![Build & Test](https://github.com/Simon-Initiative/lti_1p3_ecto_provider/actions/workflows/main.yml/badge.svg)](https://github.com/Simon-Initiative/lti_1p3_ecto_provider/actions/workflows/main.yml)
[![Coverage Status](https://coveralls.io/repos/github/Simon-Initiative/lti_1p3_ecto_provider/badge.svg?branch=master)](https://coveralls.io/github/Simon-Initiative/lti_1p3_ecto_provider?branch=master)

An Ecto-based DataProvider implementation for the Lti_1p3 library.

## Installation

The package can be installed by adding `lti_1p3_ecto_provider` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:lti_1p3_ecto_provider, "~> 0.9"}
  ]
end
```

Documentation can be found at [https://hexdocs.pm/lti_1p3_ecto_provider](https://hexdocs.pm/lti_1p3_ecto_provider).

## Getting Started

To configure the Lti_1p3 library to use this provider, set the following provider in `config/config.ex`:

```elixir
use Mix.Config

# ... existing config

config :lti_1p3,
  # ...
  provider: Lti_1p3.DataProviders.EctoProvider
  ecto_provider: [
    repo: MyApp.Repo
  ]

# ... import_config

```

### Migration

You will need to create a migration file to build the required tables for ecto. Please refer to the example migrations in [priv/repo/migrations](https://github.com/Simon-Initiative/lti_1p3_ecto_provider/blob/master/priv/repo/migrations). If using custom schemas, you will need to tweak these accordingly.

### Custom Schemas

You can specify a custom schema for any of the ecto schemas. This is useful if you wish to add fields or use your own existing schemas. Any custom schema used must have the same fields and types as schema it is replacing. Please refer to the default schemas in [lib/data_providers/ecto_provider](https://github.com/Simon-Initiative/lti_1p3_ecto_provider/tree/master/lib/data_providers/ecto_provider) as a starting point or example of required fields. To specify a custom schema, set the following for any schema in `config/config.ex`:

```elixir
config :lti_1p3,
  ecto_provider: [
    # ...
    schemas: [
      registration: MyApp.DataProviders.EctoProvider.CustomRegistration,
      platform_instance: MyApp.DataProviders.EctoProvider.CustomPlatformInstance,
      login_hint: MyApp.DataProviders.EctoProvider.CustomLoginHint,
      nonce: MyApp.DataProviders.EctoProvider.CustomNonce,
      jwk: MyApp.DataProviders.EctoProvider.CustomJwk,
      deployment: MyApp.DataProviders.EctoProvider.CustomDeployment,
      platform_role: MyApp.DataProviders.EctoProvider.CustomPlatformRole,
      context_role: MyApp.DataProviders.EctoProvider.CustomContextRole,
    ]
  ]

```
