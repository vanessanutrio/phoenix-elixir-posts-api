defmodule Posts.PostView do
  use Posts.Web, :view

  def render("index.json", %{posts: posts}) do
    render_many(posts, __MODULE__, "post.json")
  end

  def render("post.json", %{post: post}) do
    %{
      comments: post.id,
      challenge_id: post.challenge_id,
      parent_id: post.parent_id,
      user_id: post.user_id,
      deleted_at: post.deleted_at,
      muted_at: post.muted_at
    }
  end 

end