# @param {String} s
# @return {Integer}
def roman_to_int(s)
  romans = {'I' => 1, 'IV' => 4, 'V' => 5, 'IX' => 9, 'X' => 10, 'XL' => 40, 'L' => 50, 
          'XC' => 90, 'C' => 100, 'CD' => 400, 'D' => 500, 'CM' => 900, 'M' => 1000}
  rst = 0
  cs = s.chars
  until cs.empty?
    seq = cs[0, 2].join
    if seq.size == 2 && romans[seq]
      rst += romans[seq]
      cs.shift(2)
    else
      rst += romans[cs.shift]
    end
  end
  rst
end

#faster
def roman_to_int(s)
  romans = {'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 'C' => 100, 'D' => 500, 'M' => 1000}
  rst = 0
  last_c = nil
  s.each_char do |c|
    v = romans[c]
    if last_c
      last_v = romans[last_c]
      rst += v > last_v ? -last_v : last_v
    end
    last_c = c
  end
  rst += romans[last_c]
end
