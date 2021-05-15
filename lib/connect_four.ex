defmodule ConnectFour do

  def won?([moves: moves, config: [size: _, connect_what: connect_what]]) do
    moves
    |> Enum.map(fn {_, coordinates} -> coordinates end)
    |> most_contiguous_moves == connect_what
  end

  defp most_contiguous_moves(moves, counter \\ 0)
  defp most_contiguous_moves([], _), do: 0
  defp most_contiguous_moves([_], counter), do: counter + 1
  defp most_contiguous_moves([{row_number, _} | rest], counter) do
    [{next_row_number, _} | _] = rest
    if (next_row_number - row_number == 1) do
      most_contiguous_moves(rest, counter + 1)
    else
      most_contiguous_moves(rest, 0)
    end
  end
end
