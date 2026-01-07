matches = "https://example.com" =~ ~r(^https?://.*)
IO.puts("Matches? #{matches}")
matches = "HELLO" =~ ~r/hello/
IO.puts("Matches? #{matches}")
matches = "HELLO" =~ ~r/hello/i
IO.puts("Matches? #{matches}")
# sigils enable to use
~r/hello/
~r|hello|
~r"hello"
~r'hello'
~r(hello)
~r[hello]
~r{hello}
~r<hello>
