#! /usr/bin/env elixir

result =
  [1, [[2], 3]]
  |> List.flatten()
  |> Enum.map(fn x -> x * x end)
  |> Enum.reverse()

IO.inspect(result)
