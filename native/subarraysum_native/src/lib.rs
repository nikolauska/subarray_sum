use std::collections::HashMap;

#[rustler::nif]
fn count(arr: Vec<i32>, target: i32) -> i32 {
    let mut sums = HashMap::new();
    let mut running = 0;
    let mut count = 0;

    // Initialize the prefix_sums map with the base case
    sums.insert(0, 1); // This ensures subarrays starting from index 0 are counted

    for &num in arr.iter() {
        running += num;

        // If (current_sum - target_sum) exists in prefix_sums, add its count to result
        if let Some(&prev_count) = sums.get(&(running - target)) {
            count += prev_count;
        }

        // Update the prefix_sums map with the current_sum
        *sums.entry(running).or_insert(0) += 1;
    }

    count
}

rustler::init!("Elixir.SubarraySum.Native");
