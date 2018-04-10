#You are given two non-empty linked lists representing two non-negative integers.
#The digits are stored in reverse order and each of their nodes contain a single digit.
#Add the two numbers and return it as a linked list. You may assume the two numbers do 
#not contain any leading zero, except the number 0 itself.

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

def add_two_numbers(l1, l2)
  head = node = ListNode.new(nil)
  sum = 0
  while l1 || l2 || sum > 0
    sum += l1&.val.to_i + l2&.val.to_i 
    node.next = ListNode.new(sum % 10)
    node = node.next
    sum /=10 
    l1 &&= l1.next
    l2 &&= l2.next
  end
  head.next
end