defmodule ConnectFour do

  def won?([
    moves: moves,
    current_player: [player_id: player_id, current_move: current_move],
    config: [connect_what: connect_what]
  ]) do
    moves
    |> moves_for_current_player(player_id)
    |> MatchingLineLengths.longest_chain_length(current_move)
    |> winning_line_length?(connect_what)
  end

  defp winning_line_length?(longest_chain, connect_what) do
    longest_chain == connect_what
  end

  defp moves_for_current_player(moves, player_id) do
    Enum.reduce(moves, [], fn {player, coordinates}, acc ->
      if player == player_id, do: acc ++ [coordinates], else: acc
    end)
  end
end
