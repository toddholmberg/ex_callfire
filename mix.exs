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
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 0.13"},
      {:poison, "~> 3.1"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp package do
    [
      maintainers: ["Todd Holmberg <todd@welikesmall.com>"],
      licenses: ["MIT"],
      links: %{"Welikesmall" => "http://www.welikesmall.com/"}
    ]
  end
end
