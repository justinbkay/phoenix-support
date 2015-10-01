defmodule Support.SessionController do
  use Support.Web, :controller

  def delete(conn, _params) do
    conn
    |> delete_session(:current_user)
    |> put_flash(:info, "Logged Out")
    |> redirect(to: "/")
  end

end
