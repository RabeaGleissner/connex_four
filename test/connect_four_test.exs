defmodule ConnectFourTest do
  use ExUnit.Case
  doctest ConnectFour

  #[
    #[:empty, :empty, :empty, :empty, :empty, :empty, :empty],
    #[:empty, :empty, :empty, :empty, :empty, :empty, :empty],
    #[:empty, :empty, :empty, :empty, :two, :empty, :empty],
    #[:empty, :empty, :empty, :one, :one, :empty, :empty],
    #[:one, :two, :one, :one, :one, :two, :two],
    #[:one, :two, :two, :one, :one, :two, :two]
  #]

  test "game is not over" do
    game_state = [
      [:empty, :empty, :empty, :empty, :empty, :empty, :empty],
      [:empty, :empty, :empty, :empty, :empty, :empty, :empty],
      [:empty, :empty, :empty, :empty, :empty, :empty, :empty],
      [:empty, :empty, :empty, :empty, :empty, :empty, :empty],
      [:empty, :empty, :empty, :empty, :empty, :empty, :empty],
      [:empty, :empty, :empty, :empty, :empty, :empty, :empty],
    ]
    refute ConnectFour.game_over?(game_state)
  end
end
