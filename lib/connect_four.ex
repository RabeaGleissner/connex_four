defmodule ConnectFour do

  def won?([moves: moves, config: [size: size, connect_what: connect_what]]) do
    most_contiguous_moves(moves) >= connect_what
  end

  defp most_contiguous_moves([]), do: 0
  defp most_contiguous_moves([_]), do: 1
  defp most_contiguous_moves(moves) do
    [{_, {first_move_x, _}}, {_, {second_move_x, _}}] = moves
    if first_move_x + 1 == second_move_x do
      2
    else
      1
    end
  end
end