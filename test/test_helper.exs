Mimic.copy(MimicError.Orders)
Mimic.copy(MimicError.Crypto)

ExUnit.start()

Ecto.Adapters.SQL.Sandbox.mode(MimicError.Repo, :manual)
