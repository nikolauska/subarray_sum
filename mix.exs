defmodule SubarraySum.MixProject do
  use Mix.Project

  def project do
    [
      app: :subarray_sum,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
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
      {:benchee, "~> 1.3"}
    ]
  end

  defp aliases do
    [
      benchmark: ["run scripts/benchmark.exs"]
    ]
  end
end
