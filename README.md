# purerl-alias

A library for aliasing PureScript (`purerl`) modules in Elixir code.

## Usage Example

```elixir
defmodule MyModule do
  require PurerlAlias # One can also specify `as: PSAlias` or the like

  PurerlAlias.alias(MyPureScriptCode.MyPureScriptModule)
  PurerlAlias.alias(MyPureScriptCode.MyPureScriptModule, as: MyAlias)

  def my_function() do
    MyPureScriptModule.myEffectfulFunctionFromPureScript().()
    MyAlias.myOtherFunction()
  end
end
```

## Hosted documentation

See [https://hexdocs.pm/purerl_alias](https://hexdocs.pm/purerl_alias) for usage instructions.

## Installing

Add `:purerl_alias` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:purerl_alias, "~> 0.1.3"}]
end
```

Made with [`purerl`](https://github.com/purerl/purerl).
