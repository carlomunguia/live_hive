defmodule Pento.Repo.Migrations.AddUsernameField do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :username, :varchar
    end
  end    
end
