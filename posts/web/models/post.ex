defmodule Posts.Post do
  use Ecto.Model
  @derive {Poison.Encoder, only: [:comments, :user_id, :parent_id, :challenge_id, :deleted_at, :muted_at]}

  schema "posts" do
    field :comments, :string
    field :user_id, :integer
    field :parent_id, :integer
    field :challenge_id, :integer
    field :deleted_at, Ecto.DateTime
    field :muted_at, Ecto.DateTime

    timestamps
  end
end