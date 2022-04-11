# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Pento.Repo.insert!(%Pento.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Pento.Catalog

products = [
  %{
    name: "Go",
    description: "The ancient strategy game",
    sku: 5_678_910,
    unit_price: 10.00
  },
  %{
    name: "Global Thermonuclear War",
    description: "Implement actual War Games!",
    sku: 11_121_314,
    unit_price: 3.00
  },
  %{
    name: "Air Hockey",
    description: "Like Hockey, but on Air!",
    sku: 15_222_324,
    unit_price: 12.00
  }
]

Enum.each(products, fn product ->
  Catalog.create_product(product)
end)
