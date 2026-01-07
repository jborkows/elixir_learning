child = spawn(fn -> 1 + 2 end)
IO.puts("Main #{inspect(self())} created process #{inspect(child)}")
IO.puts("Is child alive? #{Process.alive?(child)}")

# this does not block
send(self(), {:hello, "world"})

msg =
  receive do
    {:hello, msg} -> msg
    {:world, _msg} -> "won't match"
  end

IO.puts(msg)

IO.puts("Timeout test")

should_timeout =
  receive do
    {:hello, msg} -> msg
  after
    1_000 -> "nothing after 1s"
  end

IO.puts(should_timeout)

# spawn_link connects parent and child propagating errors
# There are also Task.start and Task.start_link and Task has also functions like await or async and have more detail error message
~S"""
iex(3)> Task.start(fn -> raise "oops" end)
{:ok, #PID<0.108.0>}

17:32:57.422 [error] Task #PID<0.108.0> started from #PID<0.107.0> terminating
** (RuntimeError) oops
    (elixir 1.19.4) src/elixir.erl:365: :elixir.eval_external_handler/3
Function: #Function<43.81571850/0 in :erl_eval.expr/6>
    Args: []
iex(4)> spawn(fn -> raise "oops" end)
#PID<0.109.0>

17:33:29.259 [error] Process #PID<0.109.0> raised an exception
** (RuntimeError) oops
"""

defmodule KV do
  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send(caller, Map.get(map, key))
        loop(map)

      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end
end

{:ok, pid} = KV.start_link()
Process.register(pid, :kv)
send(:kv, {:get, :hello, self()})

receive do
  v -> nil
end

send(:kv, {:put, :hello, self()})
send(:kv, {:get, :hello, self()})

receive do
  v -> IO.puts("Main received #{inspect(v)}")
end

# Agents are example wrapper on states
{:ok, pid} = Agent.start_link(fn -> %{} end)
Agent.update(pid, fn map -> Map.put(map, :hello, :world) end)
IO.puts(Agent.get(pid, fn map -> Map.get(map, :hello) end))
