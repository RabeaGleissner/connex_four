defmodule ConnectFourVerticallyTest do
  use ExUnit.Case
  doctest ConnectFour

  describe "connect four vertically" do
    test "game won for four connected moves" do
      game = [moves: [
        {:one, {0, 0}},
        {:one, {0, 1}},
        {:one, {0, 2}},
        {:one, {0, 3}}
      ], config: [connect_what: 4, current_player: :one]]
      assert ConnectFour.won?(game)
    end

    test "game not won for four unconnected moves in the same column" do
      game = [moves: [
        {:one, {0, 0}},
        {:one, {0, 1}},
        {:one, {0, 3}},
        {:one, {0, 4}}
      ], config: [connect_what: 4, current_player: :one]]
      refute ConnectFour.won?(game)
    end

    test "game won for four unordered moves" do
      game = [moves: [
        {:one, {0, 1}},
        {:one, {0, 0}},
        {:one, {0, 3}},
        {:one, {0, 2}}
      ], config: [connect_what: 4, current_player: :one]]
      assert ConnectFour.won?(game)
    end

    test "game not won for four connected moves from different players" do
      game = [moves: [
        {:one, {0, 0}},
        {:two, {0, 1}},
        {:one, {0, 2}},
        {:two, {0, 3}}
      ], config: [connect_what: 4, current_player: :one]]
      refute ConnectFour.won?(game)
    end

    test "game not won for four contiguous moves in different columns" do
      game = [moves: [
        {:one, {0, 0}},
        {:one, {1, 1}},
        {:one, {3, 2}},
        {:one, {0, 3}}
      ], config: [connect_what: 4, current_player: :one]]
      refute ConnectFour.won?(game)
    end
  end
end
