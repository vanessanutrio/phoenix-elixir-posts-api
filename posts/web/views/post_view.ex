defmodule Posts.PostView do
  use Posts.Web, :view

  def render("index.html", %{posts: posts}) do
    posts
  end

  def render("index.json", %{posts: posts}) do
    posts
  end

  def render("show.json", %{post: post}) do
    post
  end

  # http://www.thisisnotajoke.com/blog/2015/09/serializing-ecto-changeset-errors-to-jsonapi-in-elixir.html

  def render("errors.json", %{changeset: changeset}) do
    errors = Enum.map(changeset.errors, fn {field, detail} ->
      %{
        attribute: "#{field}",
        message: render_detail(detail)
      }
    end)

    %{errors: errors}
  end

  def render_detail({message, values}) do
    Enum.reduce values, message, fn {k, v}, acc ->
      String.replace(acc, "%{#{k}}", to_string(v))
    end
  end

  def render_detail(message) do
    message
  end

end