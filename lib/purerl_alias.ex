defmodule PurerlAlias do
  @moduledoc """
  Allows one to alias PureScript module names in Elixir and thus use them with nicer names.
  """

  @utilities :purerlAlias_moduleUtilities@ps

  @doc """
  Aliases a PureScript module in Elixir. Does automatic translation of the PureScript module name
  to the corresponding Erlang module name.

  ## Example

      defmodule MyModule do
        require PurerlAlias, as: PSAlias

        PSAlias.alias(MyPureScriptCode.ModuleName)
        PSAlias.alias(MyPureScriptCode.ModuleName, as: MyAlias)

        def my_function do
          ModuleName.myEffectfulFunction().()
          MyAlias.myOtherFunction()
        end
      end
  """
  defmacro alias(purescript_module_name, options \\ []) do
    aliased_name =
      case purescript_module_name do
        {:__aliases__, _line_info, module_components} -> Enum.join(module_components, ".")
        name when is_atom(name) -> Atom.to_string(name)
        name when is_binary(name) -> name
      end

    erlang_module_name = @utilities.pureScriptModuleToErlangModule(aliased_name)
    options = Enum.into(options, %{})
    alias_name = options |> Map.get(:as, default_name(aliased_name))

    quote do
      alias unquote(erlang_module_name), as: unquote(alias_name)
    end
  end

  defp default_name(aliased_name) do
    aliased_name
    |> String.split(".")
    |> List.last(:no_value)
    |> case do
      value when is_binary(value) -> Module.concat([value])
      :no_value -> raise "Could not determine default name for #{aliased_name}"
    end
  end
end
