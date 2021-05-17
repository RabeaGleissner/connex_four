defmodule ConnectFourDiagonallyTest do
  use ExUnit.Case
  doctest ConnectFour

  describe " connect four diagonally" do
    test "game won for four connected moves" do
      game = [moves: [
        {:one, {0, 0}},
        {:one, {1, 1}},
        {:one, {2, 2}},
        {:one, {3, 3}}
      ], config: [connect_what: 4, current_player: :one]]
      assert ConnectFour.won?(game)
    end

    test "game not won for four diagonally unconnected moves" do
      game = [moves: [
        {:one, {0, 0}},
        {:one, {1, 1}},
        {:one, {2, 2}},
        {:one, {4, 4}}
      ], config: [connect_what: 4, current_player: :one]]
      refute ConnectFour.won?(game)
    end

    test "game not won for four connected moves from different players" do
      game = [moves: [
        {:one, {0, 0}},
        {:two, {1, 1}},
        {:one, {2, 2}},
        {:one, {3, 3}}
      ], config: [connect_what: 4, current_player: :one]]
      refute ConnectFour.won?(game)
    end
  end
end
