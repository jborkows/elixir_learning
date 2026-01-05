
[1,2,false] #{[1,2,false]}

#concatenation 
[1,2,3] ++ [4,5]
#removing 
[1,2,3] -- [1,3] 
IO.puts("Lists are immutable:
hd([1,2,3] -- [1]) #{hd([1,2,3] -- [1])}
tl([1,2,3] -- [1]) #{hd tl([1,2,3] -- [1])}
  ")
#tuple. Tuple are constant and with contiguous memory, lists -> linked lists
{:ok, "aaa"}

IO.puts("
  If function is named size it should be constant time -> precalculated
  If function is lenght it is in linear time
  ")
