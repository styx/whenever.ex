defmodule Mix.Tasks.Whenever do
  use Mix.Task

  @shortdoc "Cron jobs manager"

  @doc """
  DSL to define Cron jobs in easy way.
  """

  def run(["init"]) do
    Whenever.Init.run()
  end

  def run(["help"]) do
    help
  end

  def run(_) do
    help
  end

  defp help do
    IO.puts """
    mix whenever help - show this message
    mix whenever init - initialize config/scheduler.exs
    """
  end
end
