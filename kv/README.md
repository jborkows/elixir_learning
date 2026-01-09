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

### Applications
our build application manifest:
_build/dev/lib/kv/ebin/kv.app
```

{application,kv,[{modules,['Elixir.KV','Elixir.KV.Bucket']},{optional_applications,[]},{applications,[kernel,stdlib,elixir,logger]},{description,"kv"},{registered,[]},{vsn,"0.1.0"}]}.

```
By default machine starts all "applications" but
```
$> (cd kv; iex -S mix)
Erlang/OTP 27 [erts-15.2.7.4] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [jit:ns]

Compiling 1 file (.ex)
Generated kv app
Interactive Elixir (1.19.4) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Application.start(:kv)
{:error, {:already_started, :kv}}
iex(2)> Application.stop(:kv)

07:52:09.176 [notice] Application kv exited: :stopped
:ok
iex(3)> Application.stop(:logger)
:ok
iex(4)> Application.start(:kv)
{:error, {:not_started, :logger}}
iex(5)> Application.ensure_all_started(:kv)
{:ok, [:logger, :kv]}
iex(6)>

```

