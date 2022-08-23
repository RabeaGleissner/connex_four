defmodule NextSlotInColumnTest do
  use ExUnit.Case
  doctest ConnectFour

  describe "next slot in column" do
    test "returns move coordinates when it's the first move" do
      moves = []
      assert ConnectFour.next_slot_in_column(3, moves) == {0, 3}
    end

    test "returns move coordinates when it's the first move in the column and has aother moves" do
      moves = [one: {0, 3}, two: {1, 3}]
      assert ConnectFour.next_slot_in_column(1, moves) == {0, 1}
    end

    test "returns move coordinates there is one move in the column" do
      moves = [one: {0, 3}, two: {1, 3}, one: {0, 0}, two: {0, 1}, one: {1, 1}, two: {0, 2}]
      assert ConnectFour.next_slot_in_column(2, moves) == {1, 2}
    end

    test "returns move coordinates there are two moves in the column" do
      moves = [one: {0, 3}, two: {1, 3}, one: {0, 0}, two: {0, 1}]
      assert ConnectFour.next_slot_in_column(3, moves) == {2, 3}
    end
  end
end
