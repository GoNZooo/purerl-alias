defmodule PurerlAlias.MixProject do
  use Mix.Project

  def project do
    [
      app: :purerl_alias,
      version: "0.1.4",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      build_embedded: Mix.env() == :prod,
      deps: deps(),
      compilers: compilers(),
      erlc_paths: erlc_paths(),
      package: package(),
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp compilers() do
    if Mix.env() == :prod do
      Mix.compilers()
    else
      [:purerl | Mix.compilers()]
    end
  end

  defp erlc_paths() do
    if Mix.env() == :prod do
      []
    else
      ["output"]
    end
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:purerlex, "~> 0.4.2", only: [:dev, :test]},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package() do
    [
      maintainers: ["Rickard Andersson"],
      files: ["lib", "mix.exs", "README.md", "LICENSE", "src", "spago.dhall", "packages.dhall"],
      description: "A library for aliasing PureScript (`purerl`) modules in Elixir",
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/GoNZooo/purerl_alias"
      }
    ]
  end

  defp docs() do
    [
      main: "PurerlAlias"
    ]
  end
end
