# Given a string, find the length of the longest substring without repeating characters.
#Examples:
#Given "abcabcbb", the answer is "abc", which the length is 3.
#Given "bbbbb", the answer is "b", with the length of 1.
#Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
# @param {String} s
# @return {Integer}
def length_of_longest_substring(str)
  start = 0
  distance = 0
  dict = {}
  str.each_char.with_index do |e, idx|
    if dict[e] && start < dict[e] + 1
      distance = [idx - start, distance].max
      start = dict[e] + 1
    end
    dict[e] = idx
  end
  [str.size - start, distance].max
end