defmodule Exlivery.Orders.OrderTest do
  use ExUnit.Case

  alias Exlivery.Orders.Order

  import Exlivery.Factory

  describe "build/2" do
    test "should returns an order when all params are valid" do
      user = build(:user)

      items = [
        build(:item),
        build(:item,
          description: "Sorvete",
          category: :sobremesas,
          quantity: 2,
          unity_price: Decimal.new("10.50")
        )
      ]

      response = Order.build(user, items)

      expected_response = {:ok, build(:order)}

      assert response == expected_response
    end

    test "should returns an error when there are not items in the order" do
      user = build(:user)

      items = []

      response = Order.build(user, items)

      expected_response = {:error, "Invalid params"}

      assert response == expected_response
    end
  end
end
