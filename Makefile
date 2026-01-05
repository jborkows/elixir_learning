.PHONY: hello-world, lists, patterns, functions

hello-world:
	@(cd helloworld; elixir hello.exs)

lists:
	@(cd helloworld; elixir lists.exs)
patterns:
	@(cd helloworld; elixir patterns.exs)
functions:
	@(cd helloworld; elixir functions.exs)

