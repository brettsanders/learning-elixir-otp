defmodule MyList do
  # Base Case (degenerate case)
  def flatten([]) do
    IO.puts "def flatten([])"
    []
  end

  # Recursive call on List (all lists have head|tail)
  def flatten([ head | tail ]) do
    IO.puts "flatten([ head | tail ])"
    IO.inspect head
    IO.inspect tail
    IO.puts "- - - -"
    flatten(head) ++ flatten(tail)
  end

  # If get non-list item, turn into list with single item
  # We do NOT recurse here
  def flatten(head) do
    IO.puts "flatten(head)..."
    IO.inspect head
    [ head ]
  end
end

# MyList.flatten([[1], 2])
# Example: [[1], 2]

# Author explanation is wrong
# Here is how actually works ...

# MyList.flatten([[1], 2])
# flatten([ head | tail ])
# [1]
# [2]
# - - - -
# flatten([ head | tail ])
# 1
# []
# - - - -
# flatten(head)...
# 1
# def flatten([])
# flatten([ head | tail ])
# 2
# []
# - - - -
# flatten(head)...
# 2
# def flatten([])
# [1, 2]


# Here's my explanation:

# MyList.flatten([[1], 2])

# 1. The initial flatten call converts the 2 into a list
# flatten([ head | tail ])
# head is: [1]
# tail is: [2]
# So, we then call flatten([1]) and flatten([2])

# 2. We then run the functions above
# calling flatten([1]) translates to flatten(1, [])
# flatten([ head | tail ])
# head is: 1
# tail is : []
# So, we now have flatten(1) ++ flatten([])

# 3. We then expand these base cases
# flatten(head)...
# 1
# def flatten([])
# so higher function is now
# [1] ++ [] + flatten([2])

# 4. Processing then handles the flatten([2])
# Which again expands the flatten([2])
# flatten([ head | tail ])
# head is: 2
# tail is: []

# 5. Now we are at base cases
# flatten(head)...
# 2
# def flatten([])

# 6. Now we have
# [1] ++ [] ++ [2] ++ []
# Which equals...
# [1, 2]
