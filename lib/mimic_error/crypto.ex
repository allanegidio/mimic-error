defmodule MimicError.Crypto do
  def validate_test(%Plug.Conn{} = conn, signature \\ "12345") do
    raw_body = "1234"

    hmac =
      :crypto.mac(:hmac, :sha256, "shared_secret", raw_body)
      |> Base.encode16()
      |> String.downcase()

    if hmac == signature do
      :ok
    else
      {:error, :invalid_hmac_signature}
    end
  end
end
