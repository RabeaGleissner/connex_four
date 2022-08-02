defmodule ConnectFourDiagonallyTest do
  use ExUnit.Case
  doctest ConnectFour

  describe " connect four diagonally" do
    test "game won for four connected moves" do
      game = GameStateBuilder.build(
        [
          {:one, {0, 0}},
          {:one, {1, 1}},
          {:one, {2, 2}},
          {:one, {3, 3}}
        ],
        {3, 3},
        :one
      )
      assert ConnectFour.game_state(game) == {:won, [winner_id: :one]}
    end

    test "game won for four connected but unordered moves" do
      game = GameStateBuilder.build(
        [
          {:one, {2, 2}},
          {:one, {0, 0}},
          {:one, {1, 1}},
          {:one, {3, 3}}
        ],
        {3, 3},
        :one
      )
      assert ConnectFour.game_state(game) == {:won, [winner_id: :one]}
    end

    test "game not won for four diagonally unconnected moves" do
      game = GameStateBuilder.build(
        [
          {:one, {0, 0}},
          {:one, {1, 1}},
          {:one, {2, 2}},
          {:one, {4, 4}}
        ],
        {4, 4},
        :one
      )
      assert ConnectFour.game_state(game) == {:in_progress}
    end

    test "game not won for four connected moves from different players" do
      game = GameStateBuilder.build(
        [
          {:one, {0, 0}},
          {:two, {1, 1}},
          {:one, {2, 2}},
          {:one, {3, 3}}
        ],
        {3, 3},
        :one
      )
      assert ConnectFour.game_state(game) == {:in_progress}
    end
  end
end
