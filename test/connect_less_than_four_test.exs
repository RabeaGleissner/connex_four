defmodule ConnectLessThanFourTest do
  use ExUnit.Case
  doctest ConnectFour

  describe "connect < 4" do
    test "game not won if there are no moves" do
      game = [moves: [], config: [connect_what: 4, current_player: :one]]
      refute ConnectFour.won?(game)
    end

    test "game won if there is a single move for connect one" do
      game = [moves: [{:one, {0, 0}}], config: [connect_what: 1, current_player: :one]]
      assert ConnectFour.won?(game)
    end

    test "game not won for single move for connect two" do
      game = [moves: [{:one, {0, 0}}], config: [connect_what: 2, current_player: :one]]
      refute ConnectFour.won?(game)
    end
  end

end
