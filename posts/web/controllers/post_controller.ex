defmodule Posts.PostController do
  use Posts.Web, :controller
  alias Posts.Repo
  alias Posts.Post

  #plug :action

  # def index(conn, %{"format" => "html"} = params) do
  #   render conn, "index.html"
  # end

  # def index(conn, %{"format" => "json"} = params) do
  #   render conn, "index.json", posts: Repo.all(Post)
  # end

  # def new(conn, _params) do
  #   render conn, "new.html"
  # end

  def create(conn, %{"comments" => comments, "challenge_id" => challenge_id, "parent_id" => parent_id, "user_id" => user_id}) do
    new_post = Post.changeset(%Post{}, %{comments: comments, challenge_id: challenge_id, parent_id: parent_id, user_id: user_id})
    case new_post.valid? do
      nil ->
        new_post = Repo.insert(new_post)
        conn 
        |> put_status(201)
        render conn, "create.json", post: new_post
      errors ->
        conn
        |> put_status(422)
        |> json %{errors: errors}
    end
  end

  # def update(conn, %{"id" => id, "post" => params}) do
  #   post = Repo.get(Posts.Post, id)
  #   post = %{post | comments: params["comments"]}

  #   case Post.validate(post) do
  #     nil ->
  #       Repo.update(post)
  #       conn 
  #       |> put_status(200)
  #       render conn, "show.html", post: post
  #     errors ->
  #       json conn, errors: errors
  #   end
  # end


  # def destroy(conn, %{"id" => id}) do
  #   post = Repo.get(Posts.Post, id)
  #   case post do
  #     post when is_map(post) ->
  #       Repo.delete(post)
  #       conn
  #       |> put_status(201)
  #       render conn, "show.html", post: post
  #     _ ->
  #       redirect conn, Router.Helpers.page_path(page: "unauthorized")
  #   end
  # end


end