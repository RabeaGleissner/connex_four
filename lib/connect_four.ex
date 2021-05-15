defmodule ConnectFour do

  def won?([moves: moves, config: [size: _, connect_what: connect_what]]) do
    outcome =  moves |> find_winner(connect_what)
    outcome == :winner
  end

  defp find_winner(moves, connect_what) do
    player_one_contiguous_moves = most_contiguous_moves(moves_for_player(moves, :one))
    player_two_contiguous_moves = most_contiguous_moves(moves_for_player(moves, :two))
    cond do
      player_one_contiguous_moves == connect_what ->
        :winner
      player_two_contiguous_moves == connect_what ->
        :winner
      true ->
        :no_winner
    end
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

  defp moves_for_player(moves, player_id) do
    moves
    |> Enum.reduce([], fn {player, coordinates}, acc ->
      if player == player_id, do: acc ++ [coordinates], else: acc
    end)
    |> Enum.sort(&(&1 < &2))
  end
end
