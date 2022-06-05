defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case

  alias Exlivery.Orders.Item

  import Exlivery.Factory

  describe "build/4" do
    test "should returns an item when all params are valid" do
      response = Item.build("Pizza", :pizza, "35.5", 1)

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "should returns an error when category is invalid" do
      response = Item.build("Pizza", :test, "35.5", 1)

      expected_response = {:error, "Invalid params"}

      assert response == expected_response
    end

    test "should returns an error when price is invalid" do
      response = Item.build("Pizza", :test, "-35.5", 1)

      expected_response = {:error, "Invalid params"}

      assert response == expected_response
    end

    test "should returns an error when quantity is invalid" do
      response = Item.build("Pizza", :test, "35.5", 0)

      expected_response = {:error, "Invalid params"}

      assert response == expected_response
    end
  end
end
