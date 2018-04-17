defmodule ExCallfire.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_callfire,
      version: "0.1.0",
      elixir: "~> 1.6",
      name: "ExCallfire",
      description: "Micro wrapper for the CallFire REST API",
      package: package(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ExCallfire.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.0"},
      {:poison, "~> 3.1"}
    ]
  end

  defp package do
    [
      maintainers: ["Todd Holmberg <todd@welikesmall.com>"],
      licenses: ["MIT"],
      organization: ["Welikesmall, Inc."],
      links: %{"Welikesmall" => "http://www.welikesmall.com/"}
    ]
  end
end
