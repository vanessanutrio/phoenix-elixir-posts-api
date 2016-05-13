defmodule Posts.Challenge do
  use Ecto.Model
  @derive {Poison.Encoder, only: [:id]}

  schema "cobrand_challenge" do
    field :name, :string
    field :cobrand_id, :integer
  end


end