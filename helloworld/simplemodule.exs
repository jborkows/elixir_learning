defmodule Math do
  def sum(a, b) do
    private_sum(a, b)
  end

  defp private_sum(a, b) do
    a + b
  end

  # same function with guards, ? means that function returns boolean
  def zero?(0) do
    true
  end

  def zero?(x) when is_integer(x) do
    false
  end

  # treat rest of types, it is same as do false end, without it there would be an error when calling with not integer
  def zero?(_), do: false
end

IO.puts(Math.sum(2, 3))

# IO.puts(Math.private_sum(2, 3)) #** (UndefinedFunctionError) function Math.private_sum/2 is undefined or private

IO.puts("
  Math.zero?(0) => #{Math.zero?(0)}
  Math.zero?(1) => #{Math.zero?(1)}
  Math.zero?([1,2,3]) => #{Math.zero?([1, 2, 3])}
  ")

defmodule Fun do
  def default_argument(a \\ "Haha"), do: a
end

IO.puts("
  Fun.default_argument() => #{Fun.default_argument()}
  Fun.default_argument(3) => #{Fun.default_argument(3)}
  ")

defmodule Concat do
  # needed if default argument will be used, if line +13 and +16 would be commented, then no compilation or runtime error
  def join(a, b, sep \\ " ")

  def join(a, b, _sep) when b == "" do
    a
  end

  def join(a, b, sep) do
    a <> sep <> b
  end
end

# => Hello
IO.puts(Concat.join("Hello", ""))
# => Hello world
IO.puts(Concat.join("Hello", "world"))
# => Hello_world
IO.puts(Concat.join("Hello", "world", "_"))

defmodule Foo.Bar do
end

defmodule Foo do
  alias Foo.Bar
  # Can still access it as `Bar`
end

defmodule Foox do
  defmodule Barx do
    defmodule Bazx do
      def baz() do
        "Hello from Bazx"
      end
    end

    def foo() do
      "Hello"
    end
  end
end

alias Foox.Barx.Bazx
IO.puts(Bazx.baz())
# IO.puts(Barx.baz()) ## but Barx is not available only because Bazx is available
