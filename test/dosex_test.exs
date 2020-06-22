defmodule DosexTest do
  use ExUnit.Case
  doctest Dosex

  test "greets the world" do
    assert Dosex.hello() == :world
  end
end
