IO.puts("Hello")
IO.puts(:stderr, "error stream")

case File.read("path/to/file/hello") do
  {:ok, body} -> IO.puts("I don't know why it would work")
  {:error, reason} -> IO.puts(:standard_error, reason)
end

# read! will raise Error if it cannot read a file

IO.puts(Path.join("foo", "bar"))
IO.puts(Path.expand("~/hello"))
IO.puts([?O, ?l, ?á, ?\s, "Mary", ?!])
