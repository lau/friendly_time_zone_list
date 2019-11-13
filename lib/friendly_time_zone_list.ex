defmodule FriendlyTimeZoneList do
  @moduledoc """
  FriendlyTimeZoneList.

  Based on the Ruby on Rails ActiveSupport time zone mappings.

  Provide a list of more user friendly names
  e.g., "Eastern Time (US & Canada)" instead of "America/New_York".
  """

  # Read mapping text file in Ruby format. Transform to list of two tuples
  # with strings
  @time_zone_mapping File.read!("lib/mapping.txt")
                     |> String.split("\n")
                     |> Enum.map(fn line -> String.trim(line) end)
                     |> Enum.map(fn line -> String.split(line, "=>") end)
                     |> Enum.filter(fn line -> line != [""] end)
                     |> Enum.map(fn [friendly, iana_name] ->
                       new_friendly =
                         friendly
                         |> String.trim()
                         |> String.trim_trailing("\"")
                         |> String.trim_leading("\"")

                       new_iana_name =
                         iana_name
                         |> String.trim()
                         |> String.trim_trailing(",")
                         |> String.trim_trailing("\"")
                         |> String.trim_leading("\"")
                         |> String.trim()

                       {new_friendly, new_iana_name}
                     end)

  @doc """
  Get the mapping of frindly name to IANA TZ data identifier.
  A list of two-tuples is returned.

  ## Examples

  iex> FriendlyTimeZoneList.list() |> Enum.take(5)
  [
    {"International Date Line West", "Etc/GMT+12"},
    {"Midway Island", "Pacific/Midway"},
    {"American Samoa", "Pacific/Pago_Pago"},
    {"Hawaii", "Pacific/Honolulu"},
    {"Alaska", "America/Juneau"}
  ]

  """
  @spec list :: [{String.t(), String.t()}]
  def list do
    @time_zone_mapping
  end
end
