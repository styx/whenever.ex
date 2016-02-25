defmodule Mix.Tasks.Whenever do
  use Mix.Task

  @shortdoc "Cron jobs manager"

  @doc """
  DSL to define Cron jobs in easy way.
  """

  @config "config/schedule.exs"

  def run(_args) do
    path =
      System.cwd()
      |> Path.join(@config)

    if File.exists?(path) do
      IO.puts "[skip] `#{path}' already exists"
      #elsif File.exists?(file.downcase)
      #warn "[skip] `#{file.downcase}' exists, which could conflict with `#{file}'"
      #elsif !File.exists?(File.dirname(file))
      #warn "[skip] directory `#{File.dirname(file)}' does not exist"
    #else
      #puts "[add] writing `#{file}'"
      #File.open(file, "w") { |f| f.write(content) }
    end

    IO.puts "[done] wheneverized!"
  end

end
