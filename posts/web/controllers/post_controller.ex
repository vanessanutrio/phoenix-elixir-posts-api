defmodule Posts.PostController do
  use Posts.Web, :controller
  alias Posts.Repo
  alias Posts.Post

  #plug :action

  def index(conn, %{"format" => "html"} = params) do
    render conn, "index.html"
  end

  def index(conn, %{"format" => "json"} = params) do
    render conn, "index.json", posts: Repo.all(Post)
  end

  # def new(conn, _params) do
  #   render conn, "new.html"
  # end

  def create(conn, %{"comments" => comments, "challenge_id" => challenge_id, "parent_id" => parent_id, "user_id" => user_id}) do
    new_post = %Post{comments: comments, challenge_id: challenge_id, parent_id: parent_id, user_id: user_id}

    case Repo.insert new_post do
      {:ok, new_post}  -> # Inserted or updated with success
        conn 
        |> put_status(201)
        render conn, "create.json", post: new_post

      {:error, changeset} -> # Something went wrong
        conn
        |> put_status(422)
        render conn, "create.json", post: changeset.errors
        
    end
    

  end

  def update(conn, %{"id" => id, "comments" => comments}) do
    post = Repo.get(Posts.Post, id)
    post = %{post | comments: comments}

    case Repo.update post do
      {:ok, model}        -> # Updated with success
        conn 
        |> put_status(200)
        render conn, "create.json", post: post
      {:error, changeset} -> # Something went wrong
        conn
        |> put_status(400)
        render conn, "create.json", post: changeset.errors

        
    end
  end


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