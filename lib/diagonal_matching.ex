defmodule DiagonalMatching do
  def contigous_moves(start, coins, direction) do
    if Enum.member?(coins, start) do
      1 + contigous_moves(next(start, direction), coins, direction)
    else
      0
    end
  end

  defp next({x, y}, :positive), do: {x + 1, y + 1}
  defp next({x, y}, :negative), do: {x - 1, y - 1}
end