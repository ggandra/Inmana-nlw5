defmodule InmanaWeb.FallbackController do
  use InmanaWeb, :controller

  def call(conn, {:error, %{result: result}}) do
    conn
    |> put_status(:bad_request)
    |> put_view(InmanaWeb.ErrorView)
    |> render("error.json", result: result)
  end
end
