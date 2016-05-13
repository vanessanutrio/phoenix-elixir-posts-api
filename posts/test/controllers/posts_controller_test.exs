defmodule Posts.PostsControllerTest do
  use Posts.ConnCase
  alias Posts.Post
  alias Posts.Repo
  #alias Ecto.Adapters.SQL

  # setup do
  #   SQL.begin_test_transaction(Repo)

  #   on_exit fn ->
  #     SQL.rollback_test_transaction(Repo)
  #   end
  # end

  test "/index returns a list of posts" do
    json =
      %Post{comments: "Hello World", challenge_id: 1, user_id: 1, parent_id: 1}
      |> Repo.insert
      |> List.wrap
      #|> Poison.encode!

    response = conn(:get, "/api/posts") |> send_request

    assert response.status == 200
    #assert response.resp_body == json #FIXME encoding issue
  end

  defp send_request(conn) do
    conn
    |> put_private(:plug_skip_csrf_protection, true)
    |> Posts.Endpoint.call([])
  end

end