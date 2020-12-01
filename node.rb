# Node class for balanced binary search tree
class Node
  include Comparable

  attr_accessor :data, :left, :right

  def initialize(data=nil, left_child = nil, right_child = nil)
    @data = data
    @left = left_child
    @right = right_child
  end

  def <=>(other)
    @data <=> other.data
  end
end



