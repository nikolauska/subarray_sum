arr_small = Enum.to_list(1..100)    # Small dataset
arr_medium = Enum.to_list(1..1000) # Large dataset
arr_large = Enum.to_list(1..10_000) # Large dataset
arr_very_large = Enum.to_list(1..100_000) # Large dataset
target_sum = 100

Benchee.run(%{
  "100 items" => fn -> SubarraySum.count(arr_small, target_sum) end,
  "1_000 items" => fn -> SubarraySum.count(arr_medium, target_sum) end,
  "10_000 items" => fn -> SubarraySum.count(arr_large, target_sum) end,
  "100_000 items" => fn -> SubarraySum.count(arr_very_large, target_sum) end,
})
