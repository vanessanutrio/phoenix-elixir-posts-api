defmodule Posts.Post do
  use Ecto.Model
  @derive {Poison.Encoder, only: [:comments, :user_id, :parent_id, :challenge_id, :deleted_at, :muted_at]}

  schema "user_challenge_wall_posts" do
    field :comments, :string
    field :user_id, :integer
    field :parent_id, :integer
    field :challenge_id, :integer
    field :deleted_at, Ecto.DateTime
    field :muted_at, Ecto.DateTime
    field :created_at, Ecto.DateTime
    field :updated_at, Ecto.DateTime

  end
end