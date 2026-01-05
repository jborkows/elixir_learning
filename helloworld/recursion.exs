defmodule Recursion do
  def print_many_times(message, howMany) when howMany > 0 do
    IO.puts(message)
    print_many_times(message, howMany - 1)
  end

  def print_many_times(_, 0), do: :ok
end

Recursion.print_many_times("Hello", 3)

defmodule Doubling do
  def double([head | tail]), do: [head * 2 | double(tail)]
  def double([]), do: []
end

IO.puts("incoming [1,2,3] doubling => #{inspect(Doubling.double([1, 2, 3]))}")
