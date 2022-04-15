defmodule Pento.Repo.Migrations.AddUniqueIndexRatings do
  use Ecto.Migration

  def change do
    create unique_index(:ratings, [:user_id, :product_id], name: :index_ratings_on_user_product)
  end
end
