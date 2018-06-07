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

