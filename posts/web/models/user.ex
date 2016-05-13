defmodule Posts.User do
  use Ecto.Model
  @derive {Poison.Encoder, only: [:user_id]}

  schema "user_master" do
    field :user_id, :integer
  end

end