defmodule Support.SessionController do
  use Support.Web, :controller

  import Comeonin.Bcrypt, only: [checkpw: 2]

  alias Support.User

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    user = Repo.get_by(User, email: email)
    if user && checkpw(password, user.encrypted_password) do
      conn
      |> put_session(:current_user, user.id)
      |> put_flash(:info, "Logged in")
      |> redirect(to: page_path(conn, :index))
    else
      conn
      |> put_flash(:error, "Bad things just happened")
      |> render("new.html")
    end

  end

  def delete(conn, _params) do
    conn
    |> delete_session(:current_user)
    |> put_flash(:info, "Logged Out")
    |> redirect(to: "/")
  end

end
