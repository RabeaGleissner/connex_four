defmodule ConnectFour.VerticalMatching do
  def contiguous_moves(start, coins, direction) do
    if Enum.member?(coins, start) do
      1 + contiguous_moves(next(start, direction), coins, direction)
    else
      0
    end
  end

  defp next({x, y}, :positive), do: {x, y + 1}
  defp next({x, y}, :negative), do: {x, y - 1}
end
