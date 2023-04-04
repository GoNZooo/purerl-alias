defmodule PurerlAlias.MixProject do
  use Mix.Project

  def project do
    [
      app: :purerl_alias,
      version: "0.1.6",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      build_embedded: Mix.env() == :prod,
      deps: deps(),
      compilers: Mix.compilers(),
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

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package() do
    [
      maintainers: ["Rickard Andersson"],
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
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
