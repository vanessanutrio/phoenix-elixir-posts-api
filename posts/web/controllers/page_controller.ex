defmodule Posts.PageController do
  use Posts.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
