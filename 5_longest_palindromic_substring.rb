#Given a string s, find the longest palindromic substring in s.
# You may assume that the maximum length of s is 1000.
# @param {String} s
# @return {String}
def longest_palindrome(s)
  s.gsub!(/\b|\B/, '#')
  radiuses = [0]
  pos = 1
  max_pld_pos = 0
  max_pld_radius = 0
  loop do
    max_pld_radius = radiuses[max_pld_pos]
    break if max_pld_radius + pos > s.size
    pos_radius = if pos >= max_pld_pos + max_pld_radius
                   get_max_radius(s, pos)
                 else
                   mirror_pos = 2 * max_pld_pos - pos
                   mirror_pos - radiuses[mirror_pos] > max_pld_pos - max_pld_radius ? radiuses[mirror_pos] :
                       get_max_radius(s, pos, max_pld_pos + max_pld_radius - pos)
                 end
    radiuses << pos_radius
    max_pld_pos = pos if pos_radius > max_pld_radius
    pos += 1
  end
  s[(max_pld_pos - max_pld_radius)..(max_pld_pos + max_pld_radius)].gsub('#','')
end

def get_max_radius(s, pos, radius = 1)
  radius += 1 while s[pos - radius] == s[pos + radius]
  return radius - 1
end

s = 'babad'
p longest_palindrome(s)

