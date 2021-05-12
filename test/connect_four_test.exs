defmodule ConnectFourTest do
  use ExUnit.Case
  doctest ConnectFour

  describe "horizontal matching" do
    test "game not won if there are no moves" do
      game = [moves: [], config: [size: {4, 1}, connect_what: 4]]
      refute ConnectFour.won?(game)
    end

    test "game won if there is a single move for connect one" do
      game = [moves: [{:one, {0, 0}}], config: [size: {4, 1}, connect_what: 1]]
      assert ConnectFour.won?(game)
    end

    test "game not won for single move for connect two" do
      game = [moves: [{:one, {0, 0}}], config: [size: {4, 2}, connect_what: 2]]
      refute ConnectFour.won?(game)
    end

    test "game not won for two unconnected moves in connect two" do
      game = [moves: [
          {:one, {0, 0}},
          {:one, {2, 0}}
        ], config: [size: {4, 1}, connect_what: 2]]
      refute ConnectFour.won?(game)
    end

    test "game won for two connected moves in connect two" do
      game = [moves: [
          {:one, {0, 0}},
          {:one, {1, 0}}
        ], config: [size: {4, 1}, connect_what: 2]]
      assert ConnectFour.won?(game)
    end

  end
end
