defmodule MimicErrorWeb.MimicControllerTest do
  use MimicErrorWeb.ConnCase
  use Mimic

  alias MimicError.Crypto

  describe "test/2" do
    test "returns a 201 status code", %{conn: conn} do
      Crypto
      |> expect(:validate_test, fn _, _ -> :ok end)

      conn =
        conn
        |> post(~p"/test", %{test: "test"})

      assert conn.status == 201
    end

    test "returns a 500 status code when signature is invalid", %{conn: conn} do
      Crypto
      |> expect(:validate_test, fn _, _ -> {:error, :invalid_hmac_signature} end)

      conn =
        conn
        |> post(~p"/test", %{})

      assert conn.status == 500
    end
  end
end
