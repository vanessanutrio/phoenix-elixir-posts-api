defmodule Posts.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :comments, :string
      add :user_id, :integer
      add :parent_id, :integer
      add :challenge_id, :integer
      add :deleted_at, :datetime
      add :muted_at, :datetime

      timestamps
    end
  end
end
