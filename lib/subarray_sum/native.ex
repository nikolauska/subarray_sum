defmodule SubarraySum.Native do
  use Rustler, otp_app: :subarray_sum, crate: "subarraysum_native"

  # When your NIF is loaded, it will override this function.
  def count(_a, _b), do: :erlang.nif_error(:nif_not_loaded)
end
