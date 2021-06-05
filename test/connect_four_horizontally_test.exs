defmodule ConnectFourHorizontallyTest do
  use ExUnit.Case
  doctest ConnectFour

  describe "connect four horizontally" do
    test "game won for four connected moves" do
      game = GameStateBuilder.build(
        [
          {:one, {0, 0}},
          {:one, {1, 0}},
          {:one, {2, 0}},
          {:one, {3, 0}}
        ],
        {3, 0}
      )
      assert ConnectFour.won?(game)
    end

    test "game not won for four unconnected moves" do
      game = GameStateBuilder.build(
        [
          {:one, {0, 0}},
          {:one, {1, 0}},
          {:one, {2, 0}},
          {:one, {4, 0}}
        ],
        {4, 0}
      )
      refute ConnectFour.won?(game)
    end

    test "game won for four unordered moves" do
      game = GameStateBuilder.build(
        [
          {:two, {1, 0}},
          {:two, {0, 0}},
          {:one, {5, 0}},
          {:two, {3, 0}},
          {:one, {6, 0}},
          {:two, {2, 0}}
        ],
        {2, 0},
        :two
      )
      assert ConnectFour.won?(game)
    end

    test "game not won for four connected moves from different players" do
      game = GameStateBuilder.build(
        [
          {:one, {0, 0}},
          {:one, {1, 0}},
          {:two, {3, 0}},
          {:one, {2, 0}}
        ],
        {2, 0}
      )
      refute ConnectFour.won?(game)
    end

    test "game not won for four contiguous moves in different rows" do
      game = GameStateBuilder.build(
        [
          {:one, {0, 0}},
          {:one, {1, 1}},
          {:one, {2, 0}},
          {:one, {3, 2}}
        ],
        {2, 0}
      )
      refute ConnectFour.won?(game)
    end
  end
end
