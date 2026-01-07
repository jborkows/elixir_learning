try do
  raise "oops"
rescue
  e in RuntimeError -> IO.puts(inspect(e))
end

try do
  raise ArgumentError, message: "invalid argument foo"
rescue
  e in ArgumentError -> IO.puts("Failed with " <> e.message)
end

defmodule Example do
  defmodule AnError do
    @enforce_keys [:message]
    defexception [:message]
  end

  def foo() do
    try do
      raise %AnError{message: "AAAA"}
    rescue
      e in AnError -> IO.puts(inspect(e))
    end
  end
end

Example.foo()

defmodule HowToCatchForLogging do
  def work() do
    try do
      foo()
    rescue
      RuntimeError -> IO.puts("Got in upper")
    end
  end

  defp foo() do
    try do
      moo()
    rescue
      e ->
        require Logger
        Logger.error(Exception.format(:error, e, __STACKTRACE__))
        reraise e, __STACKTRACE__
    end
  end

  defp moo(), do: raise(~s(oops))
end

HowToCatchForLogging.work()

# ARTIFICIAL EXAMPLE USE FIND INSTEAD
try do
  Enum.each(-50..50, fn x ->
    if rem(x, 13) == 0, do: throw(x)
  end)

  "Got nothing"
catch
  x -> "Got #{x}"
end

"Got -39"

defmodule RunAfter do
  def without_even_trying do
    IO.puts("Starting")
  after
    # it is soft guaranty, it may not be executed if process exited 
    IO.puts("cleaning up!")
  end
end

RunAfter.without_even_trying()

x = 2

result =
  try do
    1 / x
  rescue
    ArithmeticError ->
      :infinity
  else
    y when y < 1 and y > -1 ->
      :small

    _ ->
      :large
  end

IO.puts("Else block works if try succeed -> #{result}")
