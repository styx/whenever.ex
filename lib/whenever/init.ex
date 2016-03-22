defmodule Whenever.Init do
  import Whenever.PP, only: :functions

  @shortdoc "Initializes schedule.ex with default data"

  @template """
  # Use this file to easily define all of your cron jobs.
  #
  # It's helpful, but not entirely necessary to understand cron before proceeding.
  # http://en.wikipedia.org/wiki/Cron

  # Example:
  #
  # set :output, "/path/to/my/cron_log.log"
  #
  # every 2.hours do
  #   command "/usr/bin/some_great_command"
  #   runner "MyModule.some_method"
  #   mix "some:great:mix:task"
  # end
  #
  # every 4.days do
  #   runner "AnotherModule.prune_old_records"
  # end

  # Learn more: http://github.com/styx/whenever.ex
  """

  @schedule_file "config/schedule.exs"

  def run do
    output = System.cwd! |> Path.join(@schedule_file)

    if File.exists?(output) do
      warn "skip", "`#{output}' already exists"
    else
      info "add", "writing `#{@schedule_file}'"
      output |> write_schedule_file
    end

    success "done", "Wheneverized!"
  end

  defp write_schedule_file(path) do
    {:ok, file} = File.open(path, [:write])
    IO.write(file, @template)
    File.close(file)
  end
end
