defmodule Posts.PostView do
  use Posts.Web, :view

  def render("index.html", %{posts: posts}) do
    posts
  end

  def render("index.json", %{posts: posts}) do
    posts
  end

  def render("create.json", %{post: post}) do
    post
  end

end