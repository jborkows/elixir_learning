defmodule KV.Bucket do
  @moduledoc """
  A key-value store implemented as an Agent process.

  `KV.Bucket` provides a simple interface for storing and retrieving
  values by key. Each bucket is a separate process that maintains
  its own state as a map.

  ## Example

      {:ok, bucket} = KV.Bucket.start_link([])
      KV.Bucket.put(bucket, "eggs", 3)
      KV.Bucket.get(bucket, "eggs")
      #=> 3

  """

  # one of things that it does is add support for child_spec
  use Agent

  @typedoc "The bucket process identifier"
  @type bucket :: Agent.agent()

  @typedoc "The key used to store values in the bucket"
  @type key :: any()

  @typedoc "The value stored in the bucket"
  @type value :: any()

  @doc """
  Starts a new bucket process linked to the current process.

  All options are forwarded to `Agent.start_link/2`.

  ## Parameters

    - `opts` - A keyword list of options passed to `Agent.start_link/2`.
      Common options include:
      - `:name` - Used for name registration as described in the "Name registration" section of `GenServer`.

  ## Returns

    - `{:ok, pid}` - The bucket was successfully started.
    - `{:error, {:already_started, pid}}` - A bucket with the given name already exists.
    - `{:error, reason}` - The bucket failed to start.

  ## Examples

      iex> {:ok, bucket} = KV.Bucket.start_link([])
      iex> is_pid(bucket)
      true

      iex> KV.Bucket.start_link(name: :my_bucket)
      {:ok, _pid}

  """
  @spec start_link(keyword()) :: Agent.on_start()
  def start_link(opts) do
    Agent.start_link(fn -> %{} end, opts)
  end

  @doc """
  Retrieves a value from the bucket by key.

  Returns `nil` if the key does not exist in the bucket.

  ## Parameters

    - `bucket` - The bucket process (pid, name, or `{name, node}`).
    - `key` - The key to look up.

  ## Returns

    - The value associated with the key, or `nil` if not found.

  ## Examples

      iex> {:ok, bucket} = KV.Bucket.start_link([])
      iex> KV.Bucket.get(bucket, "milk")
      nil

      iex> {:ok, bucket} = KV.Bucket.start_link([])
      iex> KV.Bucket.put(bucket, "milk", 3)
      iex> KV.Bucket.get(bucket, "milk")
      3

  """
  @spec get(bucket(), key()) :: value() | nil
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Stores a value in the bucket under the given key.

  If the key already exists, the value is updated.

  ## Parameters

    - `bucket` - The bucket process (pid, name, or `{name, node}`).
    - `key` - The key to store the value under.
    - `value` - The value to store.

  ## Returns

    - `:ok` - The value was successfully stored.

  ## Examples

      iex> {:ok, bucket} = KV.Bucket.start_link([])
      iex> KV.Bucket.put(bucket, "milk", 3)
      :ok
      iex> KV.Bucket.get(bucket, "milk")
      3

      iex> {:ok, bucket} = KV.Bucket.start_link([])
      iex> KV.Bucket.put(bucket, "milk", 1)
      iex> KV.Bucket.put(bucket, "milk", 5)
      iex> KV.Bucket.get(bucket, "milk")
      5

  """
  @spec put(bucket(), key(), value()) :: :ok
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end

  @doc """
  Delete a value from the bucket under the given key.

  If the key exists, the value is returned.

  ## Parameters

    - `bucket` - The bucket process (pid, name, or `{name, node}`).
    - `key` - The key to store the value under.
    - `value` - The value to store.

  ## Returns

    - `value` - The value under key or nill if key did not exist

  ## Examples

      iex> {:ok, bucket} = KV.Bucket.start_link([])
      iex> KV.Bucket.put(bucket, "milk", 3)
      :ok
      iex> KV.Bucket.delete(bucket, "milk")
      3

      iex> {:ok, bucket} = KV.Bucket.start_link([])
      iex> KV.Bucket.delete(bucket, "milk")
      nil

  """
  @spec delete(bucket(), key()) :: value()
  def delete(bucket, key) do
    # Client code will affect this process
    # what is inside Agent functions are server and all processes will wait till Agent will finish processing
    Agent.get_and_update(bucket, &Map.pop(&1, key))
  end
end
