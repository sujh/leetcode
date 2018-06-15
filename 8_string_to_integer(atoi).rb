def my_atoi(str)
  i = str.to_i
  i > 2147483647 ? 2147483647 : (i < -2147483648 ? -2147483648 : i)
end
