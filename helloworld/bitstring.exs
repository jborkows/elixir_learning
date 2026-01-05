# << >> declares bitstring, ::8 declares optional number of bites which should be used
<<42>> = <<42::8>>
<<0::1, 0::1, 1::1, 1::1>> == <<3::4>>
IO.puts("By default they are stored in 8 bites
  <<257>> == <<1>> will be truncated => #{<<257>> == <<1>>}
  <<257::9>> will be split into two => #{inspect(<<257::9>>)}
  ")

IO.puts("If bitstring is not divisible by 8 it is not binary:
  is_bitstring(<<3::4>>) => #{is_bitstring <<3::4>>}
  is_binary(<<3::4>>) => #{is_binary <<3::4>>}
  is_bitstring(<<3>>) => #{is_bitstring <<3>>}
  is_binary(<<3>>) => #{is_binary <<3>>}
  ")

<<head, rest::binary>> = "hello"
IO.puts("String are binary and bitstring so they can be pattern matched
<<head, rest::binary>> = \"hello\"
  head == ?h is first letter h value => #{head == ?h}
  rest => #{inspect(rest)}
  ")
<<x, rest::binary>> = "über"
IO.puts("Pattern matching will only work on first byte
  x == ?ü (will not match) => #{x == ?ü}
  ")
<<x::utf8, rest::binary>> = "über"
IO.puts("It will work when using modifiers utf8
  x == ?ü (will match) => #{x == ?ü}
  ")


