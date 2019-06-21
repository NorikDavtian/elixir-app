defmodule HelloWeb.SessionController do
  use HelloWeb, :controller

  alias Hello.Accounts

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"user" => %{"email"=> email, "passwd"=> passwd}}) do
    case Accounts.authenticate_user(email, passwd) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome back #{user.name}")
        |> put_session(:user_id, user.id)
        |> configure_session(renew: true)
        |> redirect(to: "/")
      {:error, :unauthorized} ->
        conn
        |> put_flash(:error, "Bad Username/Password")
        |> redirect(to: "/sessions/new")
    end
  end

  def delete(conn, _) do
    conn
    |> put_flash(:info, "Logged out successfully.")
    |> configure_session(drop: true)
    |> redirect(to: "/")
  end
end
