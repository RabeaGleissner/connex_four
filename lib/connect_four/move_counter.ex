defmodule ConnectFour.MoveCounter do
  def count_moves_for_each_player(moves) do
    Enum.reduce(moves, {0, 0}, fn move, {one, two} ->
      case move do
        {:one, _} -> {one + 1, two}
        {:two, _} -> {one, two + 1}
      end
    end)
  end
end
