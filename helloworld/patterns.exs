[x|_] = [1,2,3,4]
IO.puts("Interested only in first #{x}")

{a,b,c} = {"AAA", :ok, :false}
IO.puts("Pattern matching from tupple #{a} #{b} #{c}")


x = 5
result = case {1,2,3} do
  {4,5,6} -> "This will not match"
  {1,^x,3} -> "This will not match x is pinned so its value is 5"
  {1,x,3} -> "This will match x will be 2"
_ -> "other"
end
IO.puts(result)

#Failure in guards does not make them fail
result = case 1 do 
  x when hd(x) -> "Won't match hd cannot accept integer"
x -> "Got #{x} even if guard fails"  
end
IO.puts(result)


result = case {1,2,3} do 
  {1,x,3} when x>2 -> "Will not match x would be equal to 2"
  _ -> "Matches instead while guard does block"
end
IO.puts(result)

x = 2
IO.puts("In elixir everything returns value even = ")
if true do
  x = x + 1
  IO.puts("Inside of if #{x}")
end
IO.puts("Outside of if #{x}")
x = if true do 
  x = x + 1 #this gives warning that x is not used
end
IO.puts("Experiment with assigning new value #{x}")

# if true do 
#   ^x = x + 1  # this does not compile, since 3 != 4, this is not assignment it is match operator!
# end
# IO.puts("Experiment with pinning new value #{x}")

result = cond do
  2 + 2 == 5 ->
    "This is never true"
  2 * 2 == 3 ->
    "Nor this"
  true -> # without it ** (CondClauseError) no cond clause evaluated to a truthy value
    "This is always true (equivalent to else)"
end

IO.puts("Result of cond #{result} ")
