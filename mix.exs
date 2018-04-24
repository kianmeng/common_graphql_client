defmodule CommonGraphqlClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :common_graphql_client,
      version: "0.1.2",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
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
      {:ecto, "~> 2.2"},
      {:absinthe_websocket, "~> 0.1", git: "git@github.com:annkissam/absinthe_websocket.git"},
    ]
  end

  defp aliases do
    ["publish": [&git_tag/1]]
  end

  defp git_tag(_args) do
    System.cmd "git", ["tag", "v" <> Mix.Project.config[:version]]
    System.cmd "git", ["push", "--tags"]
  end
end
