IO.puts("Hello world from Elixir")

IO.puts("False and true is atom 
is_atom(false) = #{is_atom(false)}
is_atom(:false) = #{is_atom(:false)}
")

IO.puts("Atoms are like constants
:apple == :orange = #{:apple == :orange}
:apple == :apple = #{:apple == :apple}
  ")

IO.puts("IO.puts returns atom :ok after printing")
IO.puts("String concatenation using \"aa\" <> \"bb\" #{"aa" <> "bb"} ")


IO.puts("Is number to check if something is number
is_number(3) #{is_number(3)}
is_number(:aaa) #{is_number(:aaa)}
is_integer(3) #{is_integer(3)}
is_float(3) #{is_float(3)}
is_float(3/2) #{is_float(3/2)}
is_float(div(3,2)) #{is_float(div(3,2))}
is_boolean(false) #{is_boolean false}
is_boolean(3) #{is_boolean 3}
div 3,2 #{div 3,2}
rem 3,2 #{rem 3,2}
trunc 3.7 #{trunc 3.7}
round 3.7 #{round 3.7}
  ")
IO.puts("Binary data:
is_binary \"string is binary\" #{is_binary "string"}
  byte_size \"cześć\" should be 7 => #{byte_size "cześć"} 
  String.length \"cześć\" should be 5 => #{String.length "cześć"}
  String.upcase \"cześć\" should be CZEŚĆ => #{String.upcase "cześć"}
  ")

IO.puts("There is strict and not strict comparison for values
  1 == 1.0 => #{1 == 1.0}
  1 == 2.0 => #{1 == 2.0}
  1 === 1.0 => #{1 === 1.0}
  ")
