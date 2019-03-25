# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[][]}
require 'set'
def four_sum(nums, target)
  rst = Set.new
  nums.sort!
  hsh = {}
  (0...(nums.size - 1)).each do |i|
    ((i + 1)...nums.size).each do |j|
      s = nums[i] + nums[j]
      hsh.has_key?(s) ? hsh[s] << [i, j] : hsh[s] = [[i, j]]
    end
  end
  hsh.each_pair do |k, v|
    dst = target - k
    if hsh[dst]
      v.product(hsh[dst]).each do |arr|
        if (arr[0] & arr[1]).empty?
          rst << nums.values_at(*arr.flatten.sort)
        end
      end
      hsh.delete(dst)
    end
  end
  rst.to_a
end