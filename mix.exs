defmodule ConnectFour.MixProject do
  use Mix.Project

  def project do
    [
      app: :connect_four,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      description: description(),
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
      {:ex_doc, "~> 0.28.4", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    Logic for finding winners in a Connect Four game.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Rabea Gleissner"],
      links: %{"GitHub" => "https://github.com/rabeagleissner/connex_four"}
    ]
  end
end
