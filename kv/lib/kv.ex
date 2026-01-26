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

    children = [
      # starts registry which enables to use not only atoms as key at application start
      {Registry, name: KV, keys: :unique},
      {DynamicSupervisor, name: KV.BucketSuperviser, strategy: :one_for_one},
      {Task.Supervisor, name: KV.ServerSupervisor},
      # Task on default has restart temporal
      Supervisor.child_spec({Task, fn -> KV.Server.accept(4000) end}, restart: :permanent)
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end

  @doc """
  Creates bucket for given name
  """
  def create_bucket(name) do
    DynamicSupervisor.start_child(KV.BucketSuperviser, {KV.Bucket, name: via(name)})
  end

  @doc """
  Looks for bucket with name
  """
  def lookup(name) do
    GenServer.whereis(via(name))
  end

  defp via(name), do: {:via, Registry, {KV, name}}
end
