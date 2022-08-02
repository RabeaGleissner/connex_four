defmodule ConnectFourVerticallyTest do
  use ExUnit.Case
  doctest ConnectFour

  describe "connect four vertically" do
    test "game won for four connected moves" do
      game = GameStateBuilder.build(
        [
          {:one, {0, 0}},
          {:one, {0, 1}},
          {:one, {0, 2}},
          {:one, {0, 3}}
        ],
        {0, 3},
        :one
      )
      assert ConnectFour.game_state(game) == {:won, [winner_id: :one]}
    end

    test "game won for four connected moves with one additional move" do
      game = GameStateBuilder.build(
        [
          {:one, {0, 0}},
          {:one, {0, 1}},
          {:one, {0, 2}},
          {:one, {0, 3}},
          {:one, {1, 1}}
        ],
        {0, 3},
        :one
      )
      assert ConnectFour.game_state(game) == {:won, [winner_id: :one]}
    end

    test "game not won for four unconnected moves in the same column" do
      game = GameStateBuilder.build(
        [
          {:one, {0, 0}},
          {:one, {0, 1}},
          {:one, {0, 3}},
          {:one, {0, 4}}
        ],
        {0, 4},
        :one
      )
      assert ConnectFour.game_state(game) == {:in_progress}
    end

    test "game won for four unordered moves" do
      game = GameStateBuilder.build(
        [
          {:one, {0, 1}},
          {:one, {0, 0}},
          {:one, {0, 3}},
          {:one, {0, 2}}
        ],
        {0, 2},
        :one
      )
      assert ConnectFour.game_state(game) == {:won, [winner_id: :one]}
    end

    test "game not won for four connected moves from different players" do
      game = GameStateBuilder.build(
        [
          {:one, {0, 0}},
          {:two, {0, 1}},
          {:one, {0, 2}},
          {:two, {0, 3}}
        ],
        {0, 3},
        :one
      )
      assert ConnectFour.game_state(game) == {:in_progress}
    end

    test "game not won for four contiguous moves in different columns" do
      game = GameStateBuilder.build(
        [
          {:one, {0, 0}},
          {:one, {1, 1}},
          {:one, {3, 2}},
          {:one, {0, 3}}
        ],
        {0, 3}
      )
      assert ConnectFour.game_state(game) == {:in_progress}
    end
  end
end
