# Notes

## Function documentation in iex
h trunc/1 -> why trunc/1 ? trunc has 1 argument
can be done with
h trunc
h Kernel.trunc/1

h -> displays helpers

h Kernel.+/2 -> displays documentation for operator + 
## Code point checking
?ł will show 322
### Showing code points
```elixir
String.codepoints("👩‍🚒")
```
### Showing bytes in string
```elixir
"hełło" <> <<0>>
IO.inspect("hełło", binaries: :as_binaries) #or like this

```

## Mix
```bash 
mix new kv --module KV
```
