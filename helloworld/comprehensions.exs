first = for n <- 1..5, do: n * n
IO.puts(inspect(first))
values = [good: 1, good: 2, bad: 3, good: 4]
with_pattern_matching = for {:good, n} <- values, do: n * n
IO.puts(inspect(with_pattern_matching))

with_filters = for n <- 0..5, rem(n, 3) == 0, do: n * n
IO.puts(inspect(with_filters))

dirs = [".", ".."]

for dir <- dirs,
    file <- File.ls!(dir),
    path = Path.join(dir, file),
    File.regular?(path) do
  size = File.stat!(path).size
  IO.puts(inspect(path) <> " " <> to_string(size))
end

cartesian = for i <- [:a, :b, :c], j <- [1, 2], do: {i, j}
IO.puts("Cartesian #{inspect(cartesian)}. 
  Is it a map? #{is_map(cartesian)}
  Is it a list (yes)? #{is_list(cartesian)} 
  ")

# Remove empty characters, creating bitstring from string and move it into collectible element -> empty string
IO.puts(for <<c <- " hello world ">>, c != ?\s, into: "", do: <<c>>)

# move into map
for {key, val} <- %{"a" => 1, "b" => 2}, into: %{}, do: {key, val * val}

# # Reading from standard in and writing back uppercase
# stream = IO.stream(:stdio, :line)
# for line <- stream, into: stream do
#   String.upcase(line) <> "\n"
# end
reduced =
  for x <- [1, 2, 3], reduce: 0 do
    acc ->
      x + acc
  end

IO.puts("For comprehension can be used for reducing. #{reduced}")

unique_values =
  for x <- [1, 2, 3, 1, 2], uniq: true do
    x
  end

IO.puts("Unique #{inspect(unique_values)}")
