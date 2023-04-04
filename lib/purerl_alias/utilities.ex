defmodule PurerlAlias.Utilities do
  @spec lowercase_first_letter(input :: String.t()) :: String.t()
  def lowercase_first_letter(<<>>), do: <<>>

  def lowercase_first_letter(<<first_character::binary-size(1), rest::binary>>) do
    <<String.downcase(first_character)::binary, rest::binary>>
  end
end
