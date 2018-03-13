#! /usr/bin/env elixir

# 2.9 Exercises

# Learning about the Enum Module and its Function
# Enum
# Enum has over 70 functions
# Here are some of the main ones

# View all Functions
Enum.__info__(:functions)
|> Enum.each(fn {function, arity} ->
  IO.puts("#{function}/#{arity}")
end)

# For Lazy Enumeration, use the Stream module

# all?
Enum.all?(["foo", "bar", "hello"], fn s -> String.length(s) == 3 end)
Enum.all?(["foo", "bar", "hello"], fn s -> String.length(s) > 1 end)

# any?
Enum.any?(["foo", "bar", "hello"], fn s -> String.length(s) == 5 end)

# chunk_every
Enum.chunk_every([1, 2, 3, 4, 5, 6], 2)

# chunk_by
# Note: this is not Grouping by. It's iterating and grouping as it goes, by the function
Enum.chunk_by(["one", "two", "three", "four", "five", "forty two"], fn x -> String.length(x) end)

# map_every
# Can apply map to every n number of items
Enum.map_every([1, 2, 3, 4, 5, 6, 7, 8], fn x -> x + 1000 end)

# each
Enum.each(["one", "two", "three"], fn s -> IO.puts(s) end)

# map
Enum.map([0, 1, 2, 3], fn x -> x - 1 end)

# min
Enum.min([5, 3, 0, -1])

# max
Enum.max([5, 3, 0, -1])

# reduce
Enum.reduce([1, 2, 3], 10, fn x, acc -> x + acc end)
Enum.reduce([1, 2, 3], fn x, acc -> x + acc end)
Enum.reduce(["a", "b", "c"], "1", fn x, acc -> x <> acc end)

# sort/1
Enum.sort([5, 6, 1, 3, -1, 4])
Enum.sort([:foo, "bar", Enum, -1, 4])

# sort/2
Enum.sort([%{:val => 4}, %{:val => 1}], fn x, y -> x[:val] > y[:val] end)

list = [%{:val => 4}, %{:val => 3}, %{:val => 10}]
Enum.sort(list, fn x, y -> x[:val] < y[:val] end)

# uniq_by
Enum.uniq_by([1, 2, 3, 2, 1, 1, 1, 1, 1], fn x -> x end)

# 4. Transform [1, [[2], 3]] to [9, 4, 1] with and without pipe
Enum.reverse(Enum.map(List.flatten([1, [[2], 3]]), fn x -> x * x end))
# Better to write with Pipe
result =
  [1, [[2], 3]]
  |> List.flatten()
  |> Enum.map(fn x -> x * x end)
  |> Enum.reverse()

IO.puts(result)
