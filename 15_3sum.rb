# @param {Integer[]} nums
# @return {Integer[][]}

#slower
def three_sum(nums)
  h = nums.each_with_object({}){ |n, obj| obj[n] = obj[n].to_i + 1 }
  rst = []
  h.keys.combination(2).each do |arr|
    temp = -arr.sum
    if h[temp] && (!arr.include?(temp) || (arr.include?(temp) && h[temp] > 1))
      rst << [*arr, temp].sort
    end
  end
  rst << [0, 0, 0] if h[0].to_i >= 3
  rst.uniq
end

#faster
def three_sum(nums)
  nums.sort!
  rst, n = [], nums.size
  (n - 2).times do |i|
    next if !i.zero? && nums[i] == nums[i - 1]
    l, r = i + 1, n - 1
    while l < r
      sum = nums[i] + nums[l] + nums[r]
      if sum > 0
        r -= 1
      elsif sum < 0
        l += 1
      else
        rst << [nums[i], nums[l], nums[r]]
        loop do
          r -= 1
          break if nums[r] != nums[r + 1]
        end
        loop do
          l += 1
          break if nums[l] != nums[l - 1]
        end
      end
    end
  end
  rst
end
