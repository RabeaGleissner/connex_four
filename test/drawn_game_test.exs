defmodule DrawnGameTest do
  use ExUnit.Case
  doctest ConnectFour

  describe "drawn game state" do
    test "is draw when all spaces are full and there is no winner" do
      game = [
        moves: [
          {:one, {0, 0}},
          {:two, {1, 0}},
          {:one, {2, 0}},
          {:two, {0, 1}},
          {:one, {0, 2}},
          {:one, {1, 1}},
          {:two, {2, 1}},
          {:one, {1, 2}},
          {:two, {2, 2}},
        ],
        current_player: [player_id: :one, current_move: {2, 2}],
        config: [connect_what: 3, grid_height: 3, grid_width: 3]
      ]

      assert ConnectFour.game_state(game) == {:draw}
    end

    test "is not draw when all spaces are full and winner exists" do
      game = [
        moves: [
          {:one, {0, 0}},
          {:two, {1, 0}},
          {:one, {2, 0}},
          {:two, {0, 1}},
          {:one, {0, 2}},
          {:one, {1, 1}},
          {:two, {2, 1}},
          {:one, {2, 2}},
          {:two, {1, 2}},
        ],
        current_player: [player_id: :one, current_move: {2, 2}],
        config: [connect_what: 3, grid_height: 3, grid_width: 3]
      ]

      assert ConnectFour.game_state(game) == {:won, [winner_id: :one]}
    end

    test "is not draw when there are empty spaces" do
      game = [
        moves: [
          {:one, {0, 0}},
          {:two, {1, 0}},
          {:one, {2, 0}},
        ],
        current_player: [player_id: :one, current_move: {2, 2}],
        config: [connect_what: 3, grid_height: 3, grid_width: 3]
      ]

      assert ConnectFour.game_state(game) == {:in_progress}
    end
  end
end
