defmodule Exlivery.Orders.AgentTest do
  use ExUnit.Case

  alias Exlivery.Orders.Agent, as: OrderAgent

  import Exlivery.Factory

  describe "save/1" do
    test "should saves the order" do
      order = build(:order)

      OrderAgent.start_link(%{})
      assert {:ok, _uuid} = OrderAgent.save(order)
    end
  end

  describe "get/1" do
    setup do
      OrderAgent.start_link(%{})

      :ok
    end

    test "should returns an order, when the order is found" do
      order = build(:order)

      {:ok, uuid} = OrderAgent.save(order)

      response = OrderAgent.get(uuid)

      expected_response = {:ok, order}

      assert response == expected_response
    end

    test "should returns an error, when the user is not found" do
      response = OrderAgent.get("1")

      expected_response = {:error, "Order not found"}

      assert response == expected_response
    end
  end
end
