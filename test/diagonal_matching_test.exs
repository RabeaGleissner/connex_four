defmodule DiagonalMatchingTest do
  use ExUnit.Case
  doctest DiagonalMatching

  describe "contiguous diagonal moves" do
    test "is zero if there is no coin on the start position" do
      start = {2, 2}
      coins = []
      assert DiagonalMatching.contiguous_moves(start, coins, :positive) == 0
      assert DiagonalMatching.contiguous_moves(start, coins, :negative) == 0
    end

    test "is zero if there are coins but none on the start position" do
      start = {2, 2}
      coins = [{2, 3}]
      assert DiagonalMatching.contiguous_moves(start, coins, :positive) == 0
      assert DiagonalMatching.contiguous_moves(start, coins, :negative) == 0
    end

    test "is one if there is one move on the start position" do
      start = {2, 2}
      coins = [start, {4, 4}]
      assert DiagonalMatching.contiguous_moves(start, coins, :positive) == 1
      assert DiagonalMatching.contiguous_moves(start, coins, :negative) == 1
    end

    test "is three if there are three contiguous moves in a positive direction" do
      start = {2, 2}
      coins = [start, {3, 3}, {4,4}]
      assert DiagonalMatching.contiguous_moves(start, coins, :positive) == 3
      assert DiagonalMatching.contiguous_moves(start, coins, :negative) == 1
    end

    test "is three if there are three contiguous moves in a negative direction" do
      start = {2, 2}
      coins = [start, {1, 1}, {0,0}]
      assert DiagonalMatching.contiguous_moves(start, coins, :positive) == 1
      assert DiagonalMatching.contiguous_moves(start, coins, :negative) == 3
    end
  end
end
