defmodule MyApp.Hello do
  @moduledoc """
  This is the Hello module.
  """
  @moduledoc since: "1.0.0"

  @doc """
  Says hello to the given `name`.

  Returns `:ok`.

  ## Examples

      iex> MyApp.Hello.world(:john)
      :ok

  """
  @doc since: "1.3.0"
  def world(name) do
    IO.puts("hello #{name}")
  end

  @doc """
  Calls `world/1` with the given name.

  ## Parameters

    - `name` - A string representing the name.

  ## Returns

  Returns an integer.

  ## Examples

      iex> MyApp.Hello.world_end("john")
      0

  """
  @spec world_end(String.t()) :: integer()
  def world_end(name) do
    world(name)
    0
  end
end
