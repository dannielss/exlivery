defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "save/1" do
    test "should saves the user" do
      user = build(:user)

      UserAgent.start_link(%{})
      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "should returns an user, when the user is found" do
      :user
      |> build(cpf: "12345678910")
      |> UserAgent.save()

      response = UserAgent.get("12345678910")

      expected_response =
        {:ok,
         %User{
           address: "Rua x",
           age: 21,
           cpf: "12345678910",
           email: "daniel@hotmail.com",
           name: "Daniel"
         }}

      assert response == expected_response
    end

    test "should returns an error, when the user is not found" do
      response = UserAgent.get("12345678919")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
