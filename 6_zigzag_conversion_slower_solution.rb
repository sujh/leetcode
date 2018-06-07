def convert(s, num_rows)
  return s if num_rows >= s.size
  cols = []
  while s.size != 0
    col = s.slice!(0...num_rows).chars
    if col.size == num_rows
      cols << col
    else
      col.insert(-1, *([nil] * (num_rows - col.size)))
      cols << col
      break
    end
    (num_rows - 2).downto(1).each do |i|
      break if s.size == 0
      cols << ([nil] * (num_rows - 1)).insert(i, s.slice!(0, 1))
    end
  end
  cols.transpose.map do |a|
    a.compact.join
  end.join
end
