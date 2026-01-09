defmodule KV do
  @moduledoc """
  Documentation for `KV`.
  """
  #  it's provide additional needed behavior, probably more in further tutorial or documentation
  use Application

  @doc """
  Hello world.

  ## Examples

      iex> KV.hello()
      :world

  """
  def hello do
    :world
  end

  # The @impl true annotation says we are implementing a callback required to be used as callback
  @impl true
  def start(_type, _args) do
    # this code will be run at start of application
    IO.puts("AAAAA")
    Supervisor.start_link([], strategy: :one_for_one)
  end
end
