defmodule ConnectFour do

  def won?([
    moves: moves,
    current_player: [player_id: player_id, current_move: current_move],
    config: [connect_what: connect_what]
  ]) do
    moves
    |> moves_for_player(player_id)
    |> MatchingLineLengths.lengths(current_move)
    |> winning_line_length?(connect_what)
  end

  defp winning_line_length?(line_lenght_per_direction, connect_what) do
    Enum.any?(line_lenght_per_direction, fn {_, length} -> length == connect_what end)
  end

  defp moves_for_player(moves, player_id) do
    Enum.reduce(moves, [], fn {player, coordinates}, acc ->
      if player == player_id, do: acc ++ [coordinates], else: acc
    end)
  end
end
