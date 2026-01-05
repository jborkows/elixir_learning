defmodule User do
  # structures have name as module 
  defstruct name: "John", age: 30

  def example do
    john = %User{}
    jane = %{john | name: "Jane"}
    # jane = %{john | name: "Jane", aaa: "something else"}  #  will throw exception about key
    dynamic_update()

    # but they cannot be enumarated or accessed using map[key]
    IO.puts("Structs are maps => is_map(john) = #{is_map(john)}")
  end

  defp dynamic_update do
    john = %User{}
    updates = [name: "Jane", age: 30]
    # updates = [name: "Jane", age: 30, aaa: "22"] # will throw exception about key
    jane = struct!(john, updates)
    IO.puts(inspect(jane))
  end
end

User.example()

defmodule Car do
  IO.puts("--- Compiling Car module ---")
  @enforce_keys [:make]
  defstruct [:model, :make]

  def example() do
    # car = %Car{} #compilation error
    car = %Car{make: "sth"}
    IO.puts(inspect(car))
  end
end

IO.puts("--- Using Car module ---")
Car.example()
