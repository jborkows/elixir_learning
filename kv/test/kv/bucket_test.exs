defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  test "stores values by key" do
    {:ok, bucket} = start_supervised(KV.Bucket)
    assert KV.Bucket.get(bucket, "milk") == nil

    KV.Bucket.put(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") == 3
  end

  # this is ok, till it is not, using atom could make start_link to fail for some tests if there are more then one
  # test "stores values by key on a named process" do
  #   {:ok, _} = KV.Bucket.start_link(name: :shopping_list)
  #   assert KV.Bucket.get(:shopping_list, "milk") == nil
  #
  #   KV.Bucket.put(:shopping_list, "milk", 3)
  #   assert KV.Bucket.get(:shopping_list, "milk") == 3
  # end

  # this uses test name as bucket name
  test "stores values by key on a named process", config do
    {:ok, _} = start_supervised({KV.Bucket, name: config.test})
    assert KV.Bucket.get(config.test, "milk") == nil

    KV.Bucket.put(config.test, "milk", 3)
    assert KV.Bucket.get(config.test, "milk") == 3
  end

  test "value of removed key should be returned", config do
    {:ok, _} = start_supervised({KV.Bucket, name: config.test})
    assert KV.Bucket.delete(config.test, "milk") == nil

    KV.Bucket.put(config.test, "milk", 3)
    assert KV.Bucket.delete(config.test, "milk") == 3
    assert KV.Bucket.get(config.test, "milk") == nil
  end
end
