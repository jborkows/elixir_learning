add=fn a,b -> a + b end
IO.puts("Calling functions
  add.(3,4) (to be sure we are calling anonymous function) => #{add.(3,4)}
  is_function(add) => #{is_function(add)}
  is_function(add,1) => #{is_function(add,1)}
  is_function(add,2) => #{is_function(add,2)}
  ")

double = fn x -> add.(x,x) end
IO.puts("Calling closure double.(x) => #{double.(3)}")
x = 3
no_args = fn -> x > 5 end
IO.puts("Calling no arg no_args.() => #{no_args.()}")
IO.puts("Calling no arg inline (fn -> x < 5 end).() => #{(fn -> x < 5 end).()}")


pattern_matched = fn 
  x,y when x>0 and y>0 -> x+y
  x,y when x<0  -> x*y
end
IO.puts("Calling pattern_matched.(1,2) will give 3 => #{pattern_matched.(1,2)}")
IO.puts("Calling pattern_matched.(-3,2) will give -6 => #{pattern_matched.(-3,2)}")


using_capture_operator=&is_atom/1 # assigns function is_atom with 1 argument to using_capture_operator
IO.puts "using_capture_operator.(:aa) #{using_capture_operator.(:aa)}"

add = &+/2
IO.puts "Capturing + operator add.(2,3) #{add.(2,3)}"

is_arity_2 = fn fun -> is_function(fun, 2) end
is_arity_2 = &is_function(&1, 2) #is same as above &1 first argument of function (like above fun)
