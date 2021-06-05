defmodule MatchingLineLengths do
  def longest_chain_length([], _), do: 0
  def longest_chain_length(coins, start_position) do
    [HorizontalMatching, VerticalMatching, DiagonalMatching]
    |> Enum.map(&length_for_orientation(&1, coins, start_position))
    |> Enum.max
  end

  defp length_for_orientation(matcher, coins, start_position) do
    positive_direction = matcher.contiguous_moves(start_position, coins, :positive)
    negative_direction = matcher.contiguous_moves(start_position, coins, :negative)
    positive_direction + negative_direction - 1
  end
end
