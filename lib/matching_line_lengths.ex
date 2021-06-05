defmodule MatchingLineLengths do
  def lengths([], _), do: [horizontal: 0, vertical: 0, diagonal: 0]
  def lengths(current_player_coins, start_position) do
      [
        horizontal: horizontal(current_player_coins, start_position),
        vertical: vertical(current_player_coins, start_position),
        diagonal: diagonal(current_player_coins, start_position),
      ]
  end

  defp horizontal(current_player_coins, start_position) do
    positive_direction = HorizontalMatching.contiguous_moves(start_position, current_player_coins, :positive)
    negative_direction = HorizontalMatching.contiguous_moves(start_position, current_player_coins, :negative)
    positive_direction + negative_direction - 1
  end

  defp vertical(current_player_coins, start_position) do
    positive_direction = VerticalMatching.contiguous_moves(start_position, current_player_coins, :positive)
    negative_direction = VerticalMatching.contiguous_moves(start_position, current_player_coins, :negative)
    positive_direction + negative_direction - 1
  end

  defp diagonal(current_player_coins, start_position) do
    positive_direction = DiagonalMatching.contiguous_moves(start_position, current_player_coins, :positive)
    negative_direction = DiagonalMatching.contiguous_moves(start_position, current_player_coins, :negative)
    positive_direction + negative_direction - 1
  end
end
