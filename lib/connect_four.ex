defmodule ConnectFour do

  def won?([moves: moves, config: [connect_what: connect_what, current_player: current_player]]) do
    moves
    |> moves_for_player(current_player)
    |> Enum.sort(&(&1 < &2))
    |> contiguous_moves == connect_what
  end

  defp contiguous_moves(moves, counter \\0)
  defp contiguous_moves([], counter), do: counter
  defp contiguous_moves([_], counter), do: counter + 1
  defp contiguous_moves([first_move | [next_move | _] = rest], counter) do
    if neighbours?(first_move, next_move) do
      contiguous_moves(rest, counter + 1)
    else
      contiguous_moves(rest, 0)
    end
  end

  defp neighbours?(first_move, next_move) do
    vertical_neighbour?(first_move, next_move) ||
      horizontal_neighbour?(first_move, next_move) ||
      diagonal_neighbour?(first_move, next_move)
  end

  defp vertical_neighbour?({row_index, column_index}, {next_row_index, next_column_index}) do
    adjacent?(next_column_index, column_index) && same_line?(next_row_index, row_index)
  end

  defp adjacent?(next_index, index), do: next_index - index == 1
  defp same_line?(next_index, index), do: next_index == index

  defp horizontal_neighbour?({row_index, column_index}, {next_row_index, next_column_index}) do
    next_row_index - row_index == 1 && next_column_index == column_index
  end

  defp diagonal_neighbour?({row_index, column_index}, {next_row_index, next_column_index}) do
    next_row_index - row_index == 1 && next_column_index - column_index == 1
  end

  defp moves_for_player(moves, player_id) do
    Enum.reduce(moves, [], fn {player, coordinates}, acc ->
      if player == player_id, do: acc ++ [coordinates], else: acc
    end)
  end
end
