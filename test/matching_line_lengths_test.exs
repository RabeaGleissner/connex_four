defmodule MatchingLineLengthsTest do
  use ExUnit.Case
  doctest MatchingLineLengths

  describe "finds length of contiguous matching coins per orientation" do
    test "finds zero match length when there are no coins" do
      result = MatchingLineLengths.lengths([], {})

      assert result == [horizontal: 0, vertical: 0, diagonal: 0]
    end

    test "finds match lengths for horizontal line" do
      current_player_coins = [
        {0, 0}, {1, 0}, {2, 0}, {3, 0}
      ]
      result = MatchingLineLengths.lengths(current_player_coins, {0, 0})

      assert result == [horizontal: 4, vertical: 1, diagonal: 1]
    end

    test "finds match lengths for vertical line" do
      current_player_coins = [
        {0, 2},
        {0, 1},
        {0, 0},
      ]
      result = MatchingLineLengths.lengths(current_player_coins, {0, 0})

      assert result == [horizontal: 1, vertical: 3, diagonal: 1]
    end

    test "finds match lengths for diagonal line" do
      current_player_coins = [
                                  {4, 4},
                            {3, 3},
                     {2, 2},
              {1, 1},
        {0, 0},
      ]
      result = MatchingLineLengths.lengths(current_player_coins, {0, 0})

      assert result == [horizontal: 1, vertical: 1, diagonal: 5]
    end
  end
end
