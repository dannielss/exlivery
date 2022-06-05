defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.{Item, Order}
  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Daniel",
      email: "daniel@hotmail.com",
      cpf: "123456789",
      age: 21,
      address: "Rua x"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza",
      category: :pizza,
      quantity: 1,
      unity_price: Decimal.new("35.5")
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua x",
      items: [
        build(:item),
        build(:item,
          description: "Sorvete",
          category: :sobremesas,
          quantity: 2,
          unity_price: Decimal.new("10.50")
        )
      ],
      total_price: Decimal.new("56.50"),
      user_cpf: "123456789"
    }
  end
end
