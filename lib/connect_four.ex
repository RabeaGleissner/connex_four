defmodule ConnectFour do
  @moduledoc """
  Logic for the game rules of a Connect Four game.
  """

  alias ConnectFour.MatchingLineLengths

  @doc """
  Returns true or false, depending on if the most recent move has won the game.

  ## Examples
  iex> ConnectFour.won?([
  ...>moves: [one: {0, 0}, two: {1, 1}, one: {2, 2}, one: {3, 3}],
  ...>current_player: [player_id: :one, current_move: {3, 3}],
  ...>config: [connect_what: 4]
  ...>])

  returns false / true
  """

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
