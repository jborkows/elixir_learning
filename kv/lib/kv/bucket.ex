defmodule KV.Bucket do
  # don't know why yet...
  use Agent

  @moduledoc """
  Represents place to store values
  """
  @doc """
  Starts a new bucket.

  All options are forwarded to `Agent.start_link/2`.
  """
  def start_link(opts) do
    Agent.start_link(fn -> %{} end, opts)
  end

  @doc """
    Extracts key from bucket
  """
  def get(bucket, name) do
    # Agent.get(bucket, fn x -> Map.get(x, name) end)
    Agent.get(bucket, &Map.get(&1, name))
  end

  @doc """
    Inserts or update bucket value
  """
  def put(bucket, name, value) do
    # Agent.update(bucket, fn x -> Map.put(x, name, value) end)
    Agent.update(bucket, &Map.put(&1, name, value))
  end
end
