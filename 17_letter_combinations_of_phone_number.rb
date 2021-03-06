# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  return [] if digits.empty?
  mapping = {
      '2' => %w(a b c), '3' => %w(d e f), '4' => %w(g h i),
      '5' => %w(j k l), '6' => %w(m n o), '7' => %w(p q r s),
      '8' => %w(t u v), '9' => %w(w x y z)
  }

  digits.chars
      .select { |e| mapping[e] }
      .map { |e| mapping[e] }
      .reduce { |memo, arr| memo.product(arr) }
      .map { |e| e.respond_to?('join') ? e.join : e }
end