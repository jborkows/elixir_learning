defmodule KVTest do
  use ExUnit.Case, async: true
  doctest KV

  test "create and lookup bucket", config do
    name = config.test
    assert is_nil(KV.lookup(name))
    assert {:ok, bucket} = KV.create_bucket(name)
    assert KV.lookup(name) == bucket
    assert {:error, {:already_started, ^bucket}} = KV.create_bucket(name)
  end
end
