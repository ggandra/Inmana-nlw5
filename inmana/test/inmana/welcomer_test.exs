defmodule Inmana.WelcomerTest do
  use ExUnit.Case

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when user is banana, return ok and a message banana" do
      params = %{"name" => "banana", "age" => "42"}
      expected_result = {:ok, "User Banana"}

      result = Welcomer.call(params)

      assert result == expected_result
    end

    test "when user is not banana, and the age is over 18 return ok and a message 'name' + over 18" do
      params = %{"name" => "Gabriel", "age" => "18"}
      expected_result = {:ok, "#{params["name"]} are over 18"}

      result = Welcomer.call(params)

      assert result == expected_result
    end

    test "when user is not banana, and is under age return an error and a message 'name' + under age" do
      params = %{"name" => "Gabriel", "age" => "12"}
      expected_result = {:error, "#{params["name"]} are under age"}

      result = Welcomer.call(params)

      assert result == expected_result
    end
  end
end
