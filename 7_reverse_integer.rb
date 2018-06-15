def reverse(x)
  x = if x < 0
        -x.abs.to_s.reverse.to_i
      else
        x.to_s.reverse.to_i
      end
  x.bit_length > 31 ? 0 : x
end
