defmodule GridTest do
  use ExUnit.Case
  doctest ConnectFour.Grid
  alias ConnectFour.Grid

  describe "grid behaviour" do
    test "is full when the number of moves is the same as available slots" do
      moves = [one: {0, 0}, two: {1, 1}, one: {2, 2}, two: {1, 2}]
      config = [width: 2, height: 2]

      assert Grid.full?([moves: moves, config: config])
    end

    test "is not full when the number of moves is less than available slots" do
      moves = [one: {0, 0}, two: {1, 1}, one: {2, 2}]
      config = [width: 2, height: 2]

      refute Grid.full?([moves: moves, config: config])
    end
  end
end
