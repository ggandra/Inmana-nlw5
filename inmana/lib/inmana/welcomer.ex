defmodule Inmana.Welcomer do
  def call(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    name
    |> String.trim()
    |> handle_users(age)
  end

  def handle_users("banana", 42) do
    {:ok, "User Banana"}
  end

  def handle_users(name, age) when age >= 18 do
    {:ok, "#{name} are over 18"}
  end

  def handle_users(name, age) when age <= 18 do
    {:error, "#{name} are under age"}
  end
end
