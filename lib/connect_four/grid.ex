defmodule ConnectFour.Grid do
  def full?([moves: moves, config: [width: width, height: height]]) do
    length(moves) == width * height
  end
end
