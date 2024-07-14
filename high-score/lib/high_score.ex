defmodule HighScore do
  @reset_value 0

  def new(), do: %{}

  def add_player(scores, name, score \\ @reset_value), do: Map.put_new(scores, name, score)

  def remove_player(scores, name), do: Map.delete(scores, name)

  def reset_score(scores, name) do
    Map.update(scores, name, @reset_value, fn _ -> @reset_value end)
  end

  def update_score(scores, name, score) do
    Map.update(scores, name, score, fn existing_value -> existing_value + score end)
  end

  def get_players(scores), do: Map.keys(scores)
end
