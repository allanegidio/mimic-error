defmodule MimicErrorWeb.MimicController do
  use MimicErrorWeb, :controller

  def test(conn, _params) do
    result = MimicError.Crypto.validate_test(conn, "Test")

    case result do
      :ok ->
        conn
        |> put_status(:created)
        |> json(%{message: "success"})

      {:error, :invalid_hmac_signature} ->
        conn
        |> put_status(:internal_server_error)
        |> json(%{message: "error"})
    end
  end
end
