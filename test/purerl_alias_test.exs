defmodule PurerlAliasTest do
  use ExUnit.Case

  alias PurerlAlias.Utilities

  test "the truth" do
    assert Utilities.lowercase_first_letter("Hello") == "hello"
    assert Utilities.lowercase_first_letter("") == ""
    assert Utilities.lowercase_first_letter("hello") == "hello"
  end
end
