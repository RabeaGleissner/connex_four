defmodule ConnectFour do

  def won?([moves: moves, config: [connect_what: connect_what, current_player: current_player]]) do
    moves
    |> moves_for_player(current_player)
    |> Enum.sort(&(&1 < &2))
    |> winning_row_or_column?(connect_what)
  end

  defp winning_row_or_column?(moves, connect_what) do
    contiguous_moves(moves, :vertical) == connect_what || contiguous_moves(moves, :horizontal) == connect_what
  end

  defp contiguous_moves(moves, direction, counter \\0)
  defp contiguous_moves([], _, counter), do: counter
  defp contiguous_moves([_], _, counter), do: counter + 1
  defp contiguous_moves([first_move | [next_move | _] = rest], direction, counter) do
    if neighbours?(first_move, next_move, direction) do
      contiguous_moves(rest, direction, counter + 1)
    else
      contiguous_moves(rest, direction, 0)
    end
  end

  defp neighbours?(first_move, next_move, direction) do
    direction == :vertical && vertical_neighbour?(first_move, next_move) ||
      direction == :horizontal && horizontal_neighbour?(first_move, next_move)
  end

  defp vertical_neighbour?({row_index, column_index}, {next_row_index, next_column_index}) do
    next_column_index - column_index == 1 && next_row_index === row_index
  end

  defp horizontal_neighbour?({row_index, column_index}, {next_row_index, next_column_index}) do
    next_row_index - row_index == 1 && next_column_index === column_index
  end

  defp moves_for_player(moves, player_id) do
    Enum.reduce(moves, [], fn {player, coordinates}, acc ->
      if player == player_id, do: acc ++ [coordinates], else: acc
    end)
  end
end
