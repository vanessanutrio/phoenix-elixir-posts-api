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

  def show(conn, %{"id" => id}) do
    if post = Repo.get(Posts.Post, id) do
      conn 
      |> put_status(200)
      render conn, "show.json", post: post
    else
      conn
      |> send_resp(:not_found, "")
    end
  end


  def create(conn, %{"comments" => comments, "challenge_id" => challenge_id, "parent_id" => parent_id, "user_id" => user_id}) do
    #new_post = %Post{comments: comments, challenge_id: challenge_id, parent_id: parent_id, user_id: user_id}

    new_post = Post.changeset(%Post{}, %{comments: comments, challenge_id: challenge_id, parent_id: parent_id, user_id: user_id})

    case Repo.insert new_post do
      {:ok, new_post}  -> # Inserted or updated with success
        conn 
        |> put_status(201)
        render conn, "show.json", post: new_post

      {:error, changeset} -> # Something went wrong
        conn
        |> put_status(:bad_request)
        render conn, "errors.json", changeset: changeset
        
    end
    
  end

  def update(conn, %{"id" => id, "comments" => comments}) do
    if post = Repo.get(Posts.Post, id) do
      post = Post.changeset(post, %{ comments: comments})

      case Repo.update post do
        {:ok, post}        -> # Updated with success
          conn 
          |> put_status(:ok)
          render conn, "show.json", post: post
        {:error, changeset} -> # Something went wrong
          conn
          |> put_status(:bad_request)
          render conn, "errors.json", changeset: changeset

          
      end
    else
      conn
      |> send_resp(:not_found, "")
    end
  end


  def delete(conn, %{"id" => id}) do
    if post = Repo.get(Posts.Post, id) do

      post = Post.changeset(post, %{ deleted_at: :calendar.local_time()})
    
      case Repo.update post do
        {:ok, post}        -> # Updated with success
          conn 
          |> put_status(:ok)
          render conn, "show.json", post: post
        {:error, changeset} -> # Something went wrong
          conn
          |> put_status(:bad_request)
          render conn, "errors.json", changeset: changeset
      end
    else
      conn
      |> send_resp(:not_found, "")
    end
  end


end