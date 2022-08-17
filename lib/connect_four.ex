defmodule ConnectFour do
  @moduledoc """
  Logic for the game rules of a Connect Four game.
  """

  alias ConnectFour.MatchingLineLengths
  alias ConnectFour.Grid
  alias ConnectFour.MoveCounter

  @doc """
  Returns true or false, depending on if the most recent move has won the game.

  ## Examples
  iex> ConnectFour.game_state([
  ...>moves: [one: {0, 0}, two: {1, 1}, one: {2, 2}, two: {3, 3}],
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
      false -> handle_non_win_state([moves: moves, config: [width: grid_width, height: grid_height]])
    end
  end

  @doc """
  Returns tuple of :ok and the player id (:one or :two)
  Returns :error when :two has more moves than :one because this should never be the case

  ## Examples
  iex> ConnectFour.next_player_turn(
  ...>[one: {0, 0}, two: {1, 1}, one: {2, 2}, two: {3, 3}]
  ...>)

  returns one of these:
  {:ok, :one}
  {:ok, :two}
  {:error}
  """
  def next_player_turn([]), do: {:ok, :one}
  def next_player_turn(moves) do
    {player_one_moves, player_two_moves} = MoveCounter.count_moves_for_each_player(moves)

    cond do
      player_one_moves > player_two_moves ->
        {:ok, :two}
      player_one_moves == player_two_moves ->
        {:ok, :one}
      player_two_moves > player_one_moves ->
        {:error}
    end
  end

  @doc """
  Returns coordinates for the next available slot in the column given

  ## Examples
  iex> ConnectFour.next_slot_in_column(
  ...>2,
  ...>[one: {0, 0}, two: {1, 1}, one: {2, 2}, two: {3, 3}]
  ...>)

  returns x,y coordinates like this: {1, 3}
  x is the row, y is the column
  """
  def next_slot_in_column(given_column, []), do: {0, given_column}
  def next_slot_in_column(given_column, moves) do
    highest_move_in_column = Enum.reduce(moves, 0, fn move, counter ->
      case move do
        {_, {row, ^given_column}} ->
          if row >= counter, do: row, else: counter
        _ -> counter
      end
    end)
    {highest_move_in_column + 1, given_column}
  end

  defp winning_line_length?(longest_chain, connect_what) do
    longest_chain == connect_what
  end

  defp moves_for_current_player(moves, player_id) do
    Enum.reduce(moves, [], fn {player, coordinates}, acc ->
      if player == player_id, do: acc ++ [coordinates], else: acc
    end)
  end

  defp handle_non_win_state([moves: moves, config: [width: grid_width, height: grid_height]]) do
    if Grid.full?([moves: moves, config: [width: grid_width, height: grid_height]]) do
      {:draw}
    else
      {:in_progress}
    end
  end
end
