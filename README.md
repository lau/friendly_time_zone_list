# FriendlyTimeZoneList

The Ruby on Rails time zone list mapping in Elixir.

Do you want to let someone select their time zone from a list of names like "Alaska, Pacific Time (US & Canada), Copenhagen" instead of "America/Juneau, America/Los_Angeles, Europe/Copenhagen"?

This package provides a list of "friendly" names that maps to TZ data names.

Note that not all time zones are covered, but the list covers most places.

## Installation

The package can be installed
by adding `friendly_time_zone_list` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:friendly_time_zone_list, "~> 0.1.0"}
  ]
end
```

The docs can be found at [https://hexdocs.pm/friendly_time_zone_list](https://hexdocs.pm/friendly_time_zone_list).

## Use

`FriendlyTimeZoneList.list()` returns a list of two tuples containing the friendly name and the IANA tzdata id.

```elixir
iex> FriendlyTimeZoneList.list() |> Enum.take(5)
[
  {"International Date Line West", "Etc/GMT+12"},
  {"Midway Island", "Pacific/Midway"},
  {"American Samoa", "Pacific/Pago_Pago"},
  {"Hawaii", "Pacific/Honolulu"},
  {"Alaska", "America/Juneau"}
]
```


