defmodule Whenever.Output.Redirection do

  @moduledoc """
  Converts output options
  """

  @doc """
  Converts input to string

  Example:

  iex> Whenever.Output.Redirection.to_s("/var/log/cron.log") == ">> /var/log/cron.log 2>&1"
  true

  iex> Whenever.Output.Redirection.to_s(nil) == ">> /dev/null 2>&1"
  true
  """

  def to_s(redirection) when is_binary(redirection) do
    ">> #{redirection} 2>&1"
  end

  def to_s(map = %{}) do
    map_to_s(stderr: stderr(map), stdout: stdout(map))
  end

  def to_s(func) when is_function(func) do
    func.()
  end

  def to_s(nil) do
    ">> /dev/null 2>&1"
  end

  def to_s(_) do
    ''
  end

  defp map_to_s(stdout: "/dev/null", stderr: "/dev/null") do
    "> /dev/null 2>&1"
  end

  defp map_to_s(stdout: nil, stderr: "/dev/null") do
    "2> /dev/null"
  end

  defp map_to_s(stdout: "/dev/null", stderr: nil) do
    "> /dev/null"
  end

  defp map_to_s(stdout: stdout, stderr: "/dev/null") do
    ">> #{stdout} 2> /dev/null"
  end

  defp map_to_s(stdout: stdout, stderr: stderr) do
    ">> #{stdout} 2>> #{stderr}"
  end

  defp map_to_s(stdout: nil, stderr: stderr) do
    "2>> #{stderr}"
  end

  defp map_to_s(stdout: stdout, stderr: nil) do
    ">> #{stdout}"
  end

  defp map_to_s(_), do: ""


  defp stdout(%{standart: nil}), do: "/dev/null"
  defp stdout(%{standart: dst}), do: dst
  defp stdout(%{}), do: nil

  defp stderr(%{error: nil}), do: "/dev/null"
  defp stderr(%{error: dst}), do: dst
  defp stderr(%{}), do: nil
end
