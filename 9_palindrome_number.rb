# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  return false if x < 0
  arr = x.digits
  (0..arr.size / 2).all? { |i| arr[i] == arr[-1-i] }
end

def is_palindrome(x)
  return false if x < 0
  arr = x.digits
  arr == arr.reverse
end

#最快
def is_palindrome(x)
  return false if x < 0 || (x % 10 == 0 && x ！= 0)
  rx = 0
  while x > rx
    rx = rx * 10 + x % 10
    x = x / 10
  end
  x == rx || x == rx / 10
end
