defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "should returns the user when all params are valid" do
      response = User.build("Rua x", "Daniel", "daniel@hotmail.com", "123456789", 21)

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "should returns an error when age is less than 18" do
      response = User.build("Rua x", "Daniel", "daniel@hotmail.com", "123456789", 15)

      expected_response = {:error, "Invalid params"}

      assert response == expected_response
    end
  end
end
