defmodule RPG.CharacterSheet do
  def welcome(), do: IO.puts("Welcome! Let's fill out your character sheet together.")

  def ask_name(), do: ask_information("What is your character's name?")

  def ask_class(), do: ask_information("What is your character's class?")

  def ask_level(), do: ask_information("What is your character's level?") |> String.to_integer()

  def run() do
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()

    IO.inspect(%{class: class, level: level, name: name}, label: "Your character")
  end

  defp ask_information(question) do
    IO.gets(question <> "\n")
    |> String.trim()
  end
end
