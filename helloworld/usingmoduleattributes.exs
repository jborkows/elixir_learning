defmodule LongTask do
  def foo do
    IO.puts(">>> LongTask.foo() is being executed...")
    result = Enum.reduce(1..10_000_000, 0, fn _x, acc -> acc + 1 end)
    IO.puts(">>> LongTask.foo() finished with result: #{result}")
    result
  end
end

defmodule UsingIt do
  IO.puts("--- Compiling UsingIt module ---")
  @long_calculation LongTask.foo()
  IO.puts("--- Module attribute @long_calculation set ---")

  # here could be some operations
  def some_function, do: example()
  def another_function, do: example()
  # long calculation will be executed ONCE at compile time, not at runtime
  defp example, do: @long_calculation
end

IO.puts("=== Runtime: calling UsingIt.some_function() ===")
result = UsingIt.some_function()
IO.puts("=== Result: #{result} ===")
