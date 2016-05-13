defmodule Posts.Post do
  use Ecto.Model
  import Ecto.Changeset
  @derive {Poison.Encoder, only: [:id, :comments, :user_id, :parent_id, :challenge_id, :deleted_at, :muted_at]}


  schema "user_challenge_wall_posts" do
    field :comments, :string
    belongs_to :user, Posts.User
    belongs_to :challenge, Posts.Challenge
    belongs_to :parent, Posts.Post
    field :deleted_at, Ecto.DateTime
    field :muted_at, Ecto.DateTime
    field :created_at, Ecto.DateTime
    field :updated_at, Ecto.DateTime

  end


  def changeset(post, params \\ :empty) do
    post
    |> cast(params, ~w(comments user_id parent_id challenge_id deleted_at), ~w(comments user_id challenge_id))
    |> validate_length(:comments, max: 100)
  end

end