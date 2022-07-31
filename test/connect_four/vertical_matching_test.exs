defmodule VerticalMatchingTest do
  use ExUnit.Case
  doctest ConnectFour.VerticalMatching
  alias ConnectFour.VerticalMatching

  describe "contiguous vertical moves" do
    test "is zero if there are no coins" do
      start = {}
      coins = []
      assert VerticalMatching.contiguous_moves(start, coins, :positive) == 0
      assert VerticalMatching.contiguous_moves(start, coins, :negative) == 0
    end

    test "is zero if there is no coin on the start position" do
      start = {2, 2}
      coins = [{0, 0}]
      assert VerticalMatching.contiguous_moves(start, coins, :positive) == 0
      assert VerticalMatching.contiguous_moves(start, coins, :negative) == 0
    end

    test "is one if there is one move at the start position" do
      start = {2, 2}
      coins = [{0, 0}, {2, 2}]
      assert VerticalMatching.contiguous_moves(start, coins, :positive) == 1
      assert VerticalMatching.contiguous_moves(start, coins, :negative) == 1
    end

    test "is three if there are three contiguous moves in a positive direction" do
      start = {2, 2}
      coins = [{2, 2}, {2, 3}, {2, 4}]
      assert VerticalMatching.contiguous_moves(start, coins, :positive) == 3
      assert VerticalMatching.contiguous_moves(start, coins, :negative) == 1
    end

    test "is three if there are three contiguous moves in a negative direction" do
      start = {2, 2}
      coins = [{2, 2}, {2, 1}, {2, 0}]
      assert VerticalMatching.contiguous_moves(start, coins, :positive) == 1
      assert VerticalMatching.contiguous_moves(start, coins, :negative) == 3
    end
  end
end
