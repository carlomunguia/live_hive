defmodule Pento.Repo.Migrations.CreateRatings do
  use Ecto.Migration

  def change do
    create table(:ratings) do
      add :stars, :integer
      add :product_id, references(:products, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:ratings, [:product_id])
    create index(:ratings, [:user_id])
    create unique_index(:ratings, [:product_id, :user_id], name: :index_ratings_on_user_product)
  end
end
