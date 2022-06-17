defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "should saves the user, when all params are valid" do
      params = %{
        name: "Daniel",
        address: "Rua X",
        email: "daniel@gmail.com",
        cpf: "12345678919",
        age: 21
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User create or updated successfully"}

      assert response == expected_response
    end

    test "should returns an error, when there is invalid param" do
      params = %{
        name: "Daniel",
        address: "Rua X",
        email: "daniel@gmail.com",
        cpf: "12345678919",
        age: 10
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid params"}

      assert response == expected_response
    end
  end
end
