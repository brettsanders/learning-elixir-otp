defmodule Finder do
  # def find(directory, keyword, extension) do
  def find(directory \\ "/Users/bsanders/Downloads",
           extension \\ "",
           keyword \\ "") do
    directory
      |> Path.join("*#{extension}")
      |> Path.wildcard
      |> Enum.filter(fn fname ->
        String.contains?(Path.basename(fname), keyword
        )end)
  end
end
