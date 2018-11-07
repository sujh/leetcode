# @param {Integer} num
# @return {String}
def int_to_roman(num)
  rst = ""
  romans = {1 => 'I', 5 => 'V', 10 => 'X', 50 => 'L', 100 => 'C', 500 => 'D', 1000 => 'M'}
  len = num.digits.size
  num.digits.reverse_each.with_index do |n, idx|
    next if n == 0
    base = len - idx - 1
    char = 
      if n < 4
        romans[10 ** base] * n
      elsif n == 4
        romans[10 ** base] + romans[10 ** base * 5]
      elsif n == 9
        romans[10 ** base] + romans[10 ** base * 10]
      else
        romans[10 ** base * 5] + romans[10 ** base] * (n % 5)
      end
    rst << char
  end
  rst
end