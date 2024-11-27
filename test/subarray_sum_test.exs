defmodule SubarraySumTest do
  use ExUnit.Case

  test "basic case" do
    assert SubarraySum.count([1, 2, 3, 4, 5], 9) == 2
  end

  test "special case why start sums need to contain key 0" do
    assert SubarraySum.count([1, 1, 1], 1) == 3
  end
end
