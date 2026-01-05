# matches
%{} = %{:a => 1, 2 => :b}
# matches part of structure
%{:a => a} = %{:a => 1, 2 => :b}
IO.puts("a => #{a}")

# %{:c => c} = %{:a => 1, 2 => :b} ** (MatchError) no match of right hand side value: %{2 => :b, :a => 1}

IO.puts("
  Map.put(%{:a => 1, 2 => :b}, :key, \"value\") => #{inspect(Map.put(%{:a => 1, 2 => :b}, :key, "value"))}
  Map.get(%{:a => 1, 2 => :b}, :a) => #{inspect(Map.get(%{:a => 1, 2 => :b}, :a))}
  Map.get(%{:a => 1, 2 => :b}, :not_existing) => #{inspect(Map.get(%{:a => 1, 2 => :b}, :not_existing))}
  Map.to_list(%{:a => 1, 2 => :b}) => #{inspect(Map.to_list(%{:a => 1, 2 => :b}))}

  ")

map = %{name: "John", age: 23}
# ok
"John" = map.name
# ok
23 = map.age
IO.puts("using different map operations

  ")

map = %{name: "John"}
IO.puts("   inspect(%{map | name: \"John2\"})) => #{inspect(%{map | name: "John2"})}")
# %{map | other: "John2"} #** (KeyError) key :other not found update of not existing will fail

users = [
  john: %{name: "John", age: 27, languages: ["Erlang", "Ruby", "Elixir"]},
  mary: %{name: "Mary", age: 29, languages: ["Elixir", "F#", "Clojure"]}
]

IO.puts("
  #{inspect(users)}
  users[:john].age => #{users[:john].age}
  put_in(users[:john].age,32) => #{inspect(put_in(users[:john].age, 32))}


  ")
users = update_in(users[:mary].languages, fn languages -> List.delete(languages, "Clojure") end)
IO.puts("Update in allows to provide function how to process entry #{inspect(users)}")
