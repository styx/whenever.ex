defmodule Whenever.PP do
  @shortdoc "Pretty printer"

  def success(tag, string) do
    IO.ANSI.format([:green, :bright, "[#{tag}] ", :white, string])
    |> IO.puts
  end

  def info(tag, string) do
    IO.ANSI.format([:blue, :bright, "[#{tag}] ", :white, :normal, string])
    |> IO.puts
  end

  def warn(tag, string) do
    IO.ANSI.format([:yellow, :bright, "[#{tag}] ", :normal, string])
    |> IO.puts
  end
end
