defmodule FriendlyTimeZoneListTest do
  use ExUnit.Case
  doctest FriendlyTimeZoneList

  test "list should be a list of two-touples" do
    assert FriendlyTimeZoneList.list() |> Enum.take(5) == [
             {"International Date Line West", "Etc/GMT+12"},
             {"Midway Island", "Pacific/Midway"},
             {"American Samoa", "Pacific/Pago_Pago"},
             {"Hawaii", "Pacific/Honolulu"},
             {"Alaska", "America/Juneau"}
           ]
  end
end
