defmodule Whenever.NumericSeconds do
  @moduledoc """
  Helper module to convert time to seconds
  """

  @doc """
  just returns value passed in

  Example:

  iex> Whenever.NumericSeconds.seconds(42)
  42
  """
  def seconds(number) do
    number
  end

  @doc "alias for seconds"
  def second(number) do
    seconds(number)
  end

  @doc """
  returns minutes in seconds

  Example:

  iex> Whenever.NumericSeconds.minutes(42)
  2520
  """
  def minutes(number) do
    number * 60
  end

  @doc "alias for minutes"
  def minute(number) do
    minutes(number)
  end

  @doc """
  returns hours in seconds

  Example:

  iex> Whenever.NumericSeconds.hours(42)
  151200
  """
  def hours(number) do
    number * 3_600
  end

  @doc "alias for hours"
  def hour(number) do
    hours(number)
  end

  @doc """
  returns days in seconds

  Example:

  iex> Whenever.NumericSeconds.days(42)
  3628800
  """
  def days(number) do
    number * 86_400
  end

  @doc "alias for days"
  def day(number) do
    days(number)
  end

  @doc """
  returns weeks in seconds

  Example:

  iex> Whenever.NumericSeconds.weeks(42)
  25401600
  """
  def weeks(number) do
    number * 604_800
  end

  @doc "alias for weeks"
  def week(number) do
    weeks(number)
  end

  @doc """
  returns months in seconds

  Example:

  iex> Whenever.NumericSeconds.months(42)
  108864000
  """
  def months(number) do
    number * 2_592_000
  end

  @doc "alias for months"
  def month(number) do
    months(number)
  end

  @doc """
  returns years in seconds

  Example:

  iex> Whenever.NumericSeconds.years(42)
  1325419200
  """
  def years(number) do
    number * 31_557_600
  end

  @doc "alias for years"
  def year(number) do
    years(number)
  end
end
