defmodule ExCallfireTest do
  use ExUnit.Case
  doctest ExCallfire

  test "greets the world" do
    assert ExCallfire.hello() == :world
  end
end
