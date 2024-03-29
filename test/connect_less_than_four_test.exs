defmodule ConnectLessThanFourTest do
  use ExUnit.Case
  doctest ConnectFour

  describe "connect < 4" do
    test "game not won if there are no moves" do
      game = [
        moves: [],
        current_player: [player_id: :one, current_move: {}],
        config: [connect_what: 2, grid_height: 2, grid_width: 2]
      ]
      assert ConnectFour.game_state(game) == {:in_progress}
    end

    test "game won if there is a single move for connect one" do
      game = [
        moves: [{:one, {0, 0}}],
        current_player: [player_id: :one, current_move: {0, 0}],
        config: [connect_what: 1, grid_height: 2, grid_width: 2]
      ]
      assert ConnectFour.game_state(game) == {:won, [winner_id: :one]}
    end

    test "game not won for single move for connect two" do
      game = [
        moves: [{:one, {0, 0}}],
        current_player: [player_id: :one, current_move: {0, 0}],
        config: [connect_what: 2, grid_height: 2, grid_width: 2]
      ]
      assert ConnectFour.game_state(game) == {:in_progress}
    end

    test "game not won for three unconnected move for connect three" do
      game = [
        moves: [
          {:one, {0, 0}},
          {:one, {1, 1}},
          {:one, {1, 2}},
        ],
        current_player: [player_id: :one, current_move: {1, 2}],
        config: [connect_what: 3, grid_height: 2, grid_width: 2]
      ]
      assert ConnectFour.game_state(game) == {:in_progress}
    end
  end
end
