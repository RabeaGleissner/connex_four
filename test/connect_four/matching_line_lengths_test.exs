defmodule MatchingLineLengthsTest do
  use ExUnit.Case
  doctest ConnectFour.MatchingLineLengths
  alias ConnectFour.MatchingLineLengths

  describe "finds longest line with matching contiguous coins" do
    test "finds zero match length when there are no coins" do
      result = MatchingLineLengths.longest_chain_length([], {})

      assert result == 0
    end

    test "finds match length for horizontal line" do
      current_player_coins = [
        {0, 0}, {1, 0}, {2, 0}, {3, 0}
      ]
      result = MatchingLineLengths.longest_chain_length(current_player_coins, {0, 0})

      assert result == 4
    end

    test "finds match length for vertical line" do
      current_player_coins = [
        {0, 2},
        {0, 1},
        {0, 0},
      ]
      result = MatchingLineLengths.longest_chain_length(current_player_coins, {0, 0})

      assert result == 3
    end

    test "finds match length for diagonal line" do
      current_player_coins = [
                                  {4, 4},
                            {3, 3},
                     {2, 2},
              {1, 1},
        {0, 0},
      ]
      result = MatchingLineLengths.longest_chain_length(current_player_coins, {0, 0})

      assert result == 5
    end
  end
end
