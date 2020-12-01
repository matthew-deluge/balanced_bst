require_relative 'balanced_bst.rb'
require_relative 'node.rb'

array = Array.new(15) { rand(1..100) }
test_tree = Tree.new(array)
puts test_tree.balanced?
print test_tree.level_order
puts "\n"
print test_tree.pre_order
puts "\n"
print test_tree.post_order
puts "\n"
print test_tree.in_order
puts "\n"
(100...110).each {|number| test_tree.insert(number)}
puts test_tree.balanced?
test_tree.rebalance
puts test_tree.balanced?
print test_tree.level_order
puts ""
print test_tree.pre_order
puts ""
print test_tree.post_order
puts ""
print test_tree.in_order
puts ""