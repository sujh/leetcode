# @param {Integer[]} heights
# @return {Integer}

#slower
def max_area(heights)
  l = 0
  r = heights.size - 1
  area = heights.values_at(l, r).min * (r - l)
  while l < r
    if heights[l] < heights[r]
      l += 1
      #在l移动后，只有在新值比老值大的情况下，才重新计算area
      heights[l] > heights[l - 1] ? area = [heights.values_at(l, r).min * (r - l), area].max : next  
    else
      r -= 1
      heights[r] > heights[r + 1] ? area = [heights.values_at(l, r).min * (r - l), area].max : next
    end
  end
  area
end

#faster
def max_area(heights)
  l = 0
  r = heights.size - 1
  area = 0
  while l < r
    if heights[l] < heights[r]
      area = [heights[l] * (r - l), area].max
      l += 1
    else
      area = [heights[r] * (r - l), area].max
      r -= 1
    end
  end
  area
end