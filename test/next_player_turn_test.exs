defmodule NextPlayerTurnTest do
  use ExUnit.Case
  doctest ConnectFour

  describe "next player turn" do
    test "returns :one when there are no moves yet" do
      moves = []
      assert ConnectFour.next_player_turn(moves) == {:ok, :one}
    end

    test "returns :one when moves are equal" do
      moves = [one: {0, 0}, two: {1, 1}, one: {2, 2}, two: {3, 3}]
      assert ConnectFour.next_player_turn(moves) == {:ok, :one}
    end

    test "returns :two when :one has more moves" do
      moves = [one: {0, 0}, one: {1, 1}, two: {2, 2}]
      assert ConnectFour.next_player_turn(moves) == {:ok, :two}
    end

    test "returns error when :two has more moves" do
      moves = [one: {0, 0}, two: {1, 1}, two: {2, 2}]
      assert ConnectFour.next_player_turn(moves) == {:error}
    end
  end
end
