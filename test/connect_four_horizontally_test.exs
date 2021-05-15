defmodule ConnectFourTest do
  use ExUnit.Case
  doctest ConnectFour

  describe "connect target > 4" do
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
  end

  describe "connect four" do
    test "game won for four connected moves" do
      game = [moves: [
        {:one, {0, 0}},
        {:one, {1, 0}},
        {:one, {2, 0}},
        {:one, {3, 0}}
      ], config: [size: {4, 1}, connect_what: 4]]
      assert ConnectFour.won?(game)
    end

    test "game not won for four unconnected moves" do
      game = [moves: [
        {:one, {0, 0}},
        {:one, {1, 0}},
        {:one, {2, 0}},
        {:one, {4, 0}}
      ], config: [size: {4, 1}, connect_what: 4]]
      refute ConnectFour.won?(game)
    end

    test "game not won for four connected moves from different players" do
      game = [moves: [
        {:one, {0, 0}},
        {:one, {1, 0}},
        {:one, {2, 0}},
        {:two, {3, 0}}
      ], config: [size: {4, 1}, connect_what: 4]]
      refute ConnectFour.won?(game)
    end
  end
end
