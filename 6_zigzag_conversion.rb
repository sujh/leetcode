#faster solution
def convert(s, num_rows)
  return s if num_rows >= s.size || num_rows == 1
  s = s.chars
  rows = ''
  num_rows.times do |n|
    row = ''
    pos = n
    while s[pos]
      row << s[pos]
      if n != 0 && n != num_rows - 1
        zig_pos = pos + (num_rows - n - 1) * 2
        row << s[zig_pos] if s[zig_pos]
      end
      pos += 2 * num_rows - 2
    end
    rows << row
  end
  rows
end

#slower sulotion
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
