doubled = Enum.map([1, 2, 3], fn x -> x * 2 end)
IO.puts(inspect(doubled))
key_value = Enum.map(%{1 => 1, 2 => 2, 3 => 3}, fn {x, y} -> x * y end)
IO.puts(inspect(key_value))

odd? = fn x -> rem(x, 2) != 0 end
# all functions in Enum are eager
1..100_000 |> Enum.map(&(&1 * 3)) |> Enum.filter(odd?) |> Enum.sum()
# streams are lazy
1..100_000 |> Stream.map(&(&1 * 3)) |> Stream.filter(odd?) |> Enum.sum()
# infinite stream
stream = Stream.cycle([1, 2, 3])
IO.puts(inspect(Enum.take(stream, 10)))
# "path/to/file" |> File.stream!() |> Enum.take(10)
