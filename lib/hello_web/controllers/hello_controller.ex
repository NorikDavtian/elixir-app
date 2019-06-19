defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  def index(conn, _params) do
    count = Hello.Repo.aggregate(Hello.User, :count, :id)
    conn
    |> assign(:count, count)
    |> render("index.html")
  end

  def show(conn, %{"messenger" => messenger}) do
    render(conn, "hello.html", messenger: messenger)
  end
end
