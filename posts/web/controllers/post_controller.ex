defmodule Posts.PostController do
  use Posts.Web, :controller
  alias Posts.Repo
  alias Posts.Post

  #plug :action

  def index(conn, _params) do
    posts = Repo.all(Post)
    render conn, posts: posts
  end
end