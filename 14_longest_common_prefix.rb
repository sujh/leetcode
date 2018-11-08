# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return '' if strs.empty? || strs[0].empty?
  return strs[0] if strs.size == 1
  strs[0].each_char.with_index do |c, idx|
    strs[1..-1].all?{ |str| str[idx] == c } ? next : (return strs[0][0...idx])
  end
end
