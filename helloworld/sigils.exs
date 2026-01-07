string_with_sigils = ~s(I can put "" in it)
IO.puts(string_with_sigils)
char_list = ~c(cat)
IO.puts(inspect(char_list))
word_list = ~w(cat dog bird)
IO.puts(inspect(word_list))
word_list_as_atoms = ~w(cat dog bird)a
IO.puts(inspect(word_list_as_atoms))
IO.puts(~s(String with escape codes \x26 #{"inter" <> "polation"}))
IO.puts(~S(String without escape codes \x26 without #{interpolation}))

heredoc_style = ~s"""
this is
  a heredoc string
"""

IO.puts(heredoc_style)

# converts to date
d = ~D[2019-10-31]

# converts to time
t = ~T[23:00:07.0]

# NaiveDatetime -> no timezone
n = ~N[2019-10-31 23:00:07]

# crate datetime in UTC
timezone = ~U[2019-10-31 19:59:03Z]

defmodule Example do
  defmodule MySigils do
    def sigil_i(string, []), do: String.to_integer(string)
    def sigil_i(string, [?n]), do: -String.to_integer(string)
  end

  def example() do
    import MySigils
    ~i(13)
    ~i(42)n
  end
end
