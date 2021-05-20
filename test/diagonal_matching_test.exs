defmodule DiagonalMatchingTest do
  use ExUnit.Case
  doctest DiagonalMatching 

  describe "contigous_diagonal_moves" do
    test "is zero if there isn't even a coin on the start position" do
      start = {2, 2}
      coins = []
      assert DiagonalMatching.contigous_moves(start, coins, :positive) == 0
    end

    test "is zero if there are coins but none on the start position" do
      start = {2, 2}
      coins = [{2, 3}]
      assert DiagonalMatching.contigous_moves(start, coins, :positive) == 0
    end

    test "is one if there is only one move on the start position" do
      start = {2, 2}
      coins = [start, {4, 4}]
      assert DiagonalMatching.contigous_moves(start, coins, :positive) == 1
    end

    test "is two if there are two contiguous moves in a positive direction" do
      start = {2, 2}
      coins = [start, {3, 3}]
      assert DiagonalMatching.contigous_moves(start, coins, :positive) == 2
      assert DiagonalMatching.contigous_moves(start, coins, :negative) == 1
    end

    test "is two if there are two contiguous moves in a negative direction" do
      start = {2, 2}
      coins = [start, {1, 1}]
      assert DiagonalMatching.contigous_moves(start, coins, :positive) == 1
      assert DiagonalMatching.contigous_moves(start, coins, :negative) == 2
    end
  end
end