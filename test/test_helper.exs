ExUnit.start()
ExUnit.configure(exclude: :pending)

defmodule GameStateBuilder do
  def build(moves, current_move \\ {0, 0}, current_player_id \\ :one, connect_what \\ 4)
  def build(moves, current_move, current_player_id, connect_what) do
    [
      moves: moves,
      current_player: [player_id: current_player_id, current_move: current_move],
      config: [connect_what: connect_what, grid_height: 3, grid_width: 3]
    ]
  end
end
