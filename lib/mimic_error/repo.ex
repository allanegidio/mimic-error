defmodule MimicError.Repo do
  use Ecto.Repo,
    otp_app: :mimic_error,
    adapter: Ecto.Adapters.Postgres
end
