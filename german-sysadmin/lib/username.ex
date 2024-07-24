defmodule Username do
  def sanitize(username) do
    Enum.map(username, &sanitize_username/1)
    |> List.flatten()
    |> Enum.filter(fn u -> (u >= ?a && u <= ?z) || u == ?_ end)
  end

  defp sanitize_username(character) do
    case character do
      ?ä -> ~c"ae"
      ?ö -> ~c"oe"
      ?ü -> ~c"ue"
      ?ß -> ~c"ss"
      _ -> [character]
    end
  end
end
