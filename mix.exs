defmodule LTSV.Mixfile do
  use Mix.Project

  def project do
    [app: :ltsv,
     name: "ltsvex",
     version: "0.1.0",
     elixir: "~> 1.0",
     package: [
       contributors: ["Takayuki Matsubara"],
       licenses: ["MIT"],
       links: %{"GitHub" => "https://github.com/ma2gedev/ltsvex"}
      ],
     description: "A Labeled Tab-separated Values Parser",
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    []
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [{:ex_doc, "~> 0.6", only: :dev}]
  end
end
