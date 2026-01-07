# KV

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `kv` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:kv, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/kv>.


## Notes
iex -S mix enables to run code iex. Inside there is recompile() function which can be used to change code.

Test convention each file in lib directory with test would have in test directory file file_name_test.exs
Each successful will print "."
e.g. executed 2 tests
```bash 
Running ExUnit with seed: 2803, max_cases: 16

..
Finished in 0.02 seconds (0.00s async, 0.02s sync)

```
If failure report will be longer with part:
```bash
  1) test greets the world (KVTest)
     test/kv_test.exs:5
     Assertion with == failed
     code:  assert KV.hello() == :ooo
     left:  :world
     right: :ooo
     stacktrace:
       test/kv_test.exs:7: (test)

```
This last stacktrace part can be then used to run only this test:
```bash
mix test test/kv_test.exs:7
```
There are 3 environments: dev,test,prod, compile run by default in dev, test in test. 
Mix will not be available in production, so Mix.enn should not be used outside build script.
To change environment use MIX_ENV
```bash
MIX_ENV=prod mix compile
```

