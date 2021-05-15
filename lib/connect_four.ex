defmodule ConnectFour do

  def won?([moves: moves, config: [connect_what: connect_what, current_player: current_player]]) do
    moves
    |> sorted_moves_for_current_player(current_player)
    |> most_contiguous_moves == connect_what
  end

  defp most_contiguous_moves(moves, counter \\ 0)
  defp most_contiguous_moves([], counter), do: counter
  defp most_contiguous_moves([_], counter), do: counter + 1
  defp most_contiguous_moves([{row_number, _} | rest], counter) do
    [{next_row_number, _} | _] = rest
    if (next_row_number - row_number == 1) do
      most_contiguous_moves(rest, counter + 1)
    else
      most_contiguous_moves(rest, 0)
    end
  end

  defp sorted_moves_for_current_player(moves, player_id) do
    moves
    |> moves_for_player(player_id)
    |> Enum.sort(&(&1 < &2))
  end

  defp moves_for_player(moves, player_id) do
    Enum.reduce(moves, [], fn {player, coordinates}, acc ->
      if player == player_id, do: acc ++ [coordinates], else: acc
    end)
  end
end
