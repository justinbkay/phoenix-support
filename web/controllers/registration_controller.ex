defmodule Support.RegistrationController do
  use Support.Web, :controller

  alias Support.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, params) do
  end

end
