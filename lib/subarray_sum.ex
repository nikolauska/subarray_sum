defmodule SubarraySum do
  @moduledoc """
  Subarray with Target Sum

  Description:

  Given an array of integers arr and an integer targetSum, write a function to find the number of continuous subarrays whose elements sum up to the targetSum.

  Input:

  • arr (List of integers): The input array of size n (1 ≤ n ≤ 100_000)
  • targetSum (Integer): The target sum (1 ≤ | targetSum | ≤ 10^9)

  Output:

  • An integer representing the number of continuous subarrays whose sum equals targetSum.

  Example:

  Input:
  arr = [1, 2, 3, 4, 5]
  targetSum = 9

  Output:
  2
  // Explanation: The subarrays that sum to 9 are [2, 3, 4] and [4, 5]
  """

  # Define starting sums
  # NOTE: The key 0 is a special case, since the sum of an empty subarray is 0.
  @start_sums %{0 => 1}

  @doc """
  Calculate the number of subarrays with the target sum.

  ## Complexity

  Time Complexity: O(n), where n is the length of the array.
      Iterating through the array is linear.
      Map operations (insert, lookup) are O(1).
  Space Complexity: O(n), where n is unique sums stored in the map.
  """
  def count(arr, target) when is_list(arr) and is_integer(target) and target > 0 do
    arr
    |> Enum.reduce({@start_sums, 0, 0}, fn num, {sums, running, count} ->
      new_running = running + num

      # Count the number of subarrays ending here with the target sum
      new_count = count + Map.get(sums, new_running - target, 0)

      # Update sums map with new running sum
      new_sums = Map.update(sums, new_running, 1, fn val -> val + 1 end)

      {new_sums, new_running, new_count}
    end)
    # Extract the count
    |> elem(2)
  end

  @doc """
  Same as `count/2`, but with a native implementation in Rust using Rustler.
  """
  def native_count(arr, target) when is_list(arr) and is_integer(target) and target > 0 do
    SubarraySum.Native.count(arr, target)
  end
end
