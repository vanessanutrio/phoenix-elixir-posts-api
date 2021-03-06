defmodule Posts.Router do
  use Posts.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Posts do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/posts", PostController, :index
  end

  # Other scopes may use custom stacks.


  scope "/api", Posts do
    pipe_through :api

    resources "/posts", PostController
     put "/posts", PostController, :update
  end
end
