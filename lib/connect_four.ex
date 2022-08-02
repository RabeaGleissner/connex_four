defmodule ConnectFour do
  @moduledoc """
  Logic for the game rules of a Connect Four game.
  """

  alias ConnectFour.MatchingLineLengths
  alias ConnectFour.Grid

  @doc """
  Returns true or false, depending on if the most recent move has won the game.

  ## Examples
  iex> ConnectFour.game_state([
  ...>moves: [one: {0, 0}, two: {1, 1}, one: {2, 2}, one: {3, 3}],
  ...>current_player: [player_id: :one, current_move: {3, 3}],
  ...>config: [connect_what: 4, grid_height: 6, grid_width: 8]
  ...>])

  returns one of these:
  {:won, [winner_id: <some id>]}
  {:draw}
  {:in_progress}
  """

  def game_state([
    moves: moves,
    current_player: [player_id: player_id, current_move: current_move],
    config: [connect_what: connect_what, grid_height: grid_height, grid_width: grid_width]
  ]) do
    moves
    |> moves_for_current_player(player_id)
    |> MatchingLineLengths.longest_chain_length(current_move)
    |> winning_line_length?(connect_what)
    |> case do
      true -> {:won, [winner_id: player_id]}
      false -> if Grid.full?([moves: moves, config: [width: grid_width, height: grid_height]]) do
          {:draw}
      else
          {:in_progress}
      end
    end
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
