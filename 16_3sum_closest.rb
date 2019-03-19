# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_closest(nums, target)
  nums.sort!
  closest = -Float::INFINITY
  closest_diff = Float::INFINITY
  (nums.size - 2).times do |i|
    left, right = i + 1, nums.size - 1
    while left != right
      sum = nums[i] + nums[left] + nums[right]
      return target if target == sum
      diff = (sum - target).abs
      if diff < closest_diff
        closest_diff = diff
        closest = sum
      end
      sum > target ? right -= 1 : left += 1
    end
  end
  closest
end
