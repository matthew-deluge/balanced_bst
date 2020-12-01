require_relative 'node'

class Tree
  attr_reader :root

  private

  attr_writer :root

  public

  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    return nil if array.length <= 0

    array = array.uniq.sort
    mid = array.length / 2
    temp_root = Node.new(array[mid])
    temp_root.left = build_tree(array[0...mid])
    temp_root.right = build_tree(array[mid+1..-1])
    temp_root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(value, root = @root)
    return Node.new(value) if root.nil?

    if root.data == value
      root
    elsif root.data > value
      root.left = insert(value, root.left)
    elsif root.data < value
      root.right = insert(value, root.right)
    end
    root
  end

  def min_child(node) # finds the lowest ancestor of a given node
    current = node
    current = current.left until current.left.nil?
    return current
  end

  def delete(value, root = @root)
    # returns if finds a nil
    return root if root.nil?

    # checks to search in the right or left tree
    if value < root.data
      root.left = delete(value, root.left)
    elsif value > root.data
      root.right = delete(value, root.right)
    # code if node's data is the value to be deleted
    else 
      if root.left.nil? #returns right child to attach to parent of deleted node
        temp = root.right
        root = nil
        return temp
      elsif root.right.nil? #returns left child to attach to parent of deleted node
        temp = root.left
        root = nil
        return temp
      else
      # code for if the node to be deleted has two children
        temp = min_child(root.right) # get the lowest ancestor of the deleted node
        root.data = temp.data #replace the data in the node with the lowest ancestors data
        root.right = delete(temp.data, root.right) #find and delete the lowest ancestor
      end 
    end
    return root
  end

  def find(value, root = @root)
    return root if root.data == value

    if value < root.data
      find(value, root.left)
    elsif value > root.data
      find(value, root.right)
    end
  end

  def level_order
    tree_array = []
    queue = [@root]
    until queue.empty? 
      current = queue[0]
      queue.push(current.left) unless current.left.nil?
      queue.push(current.right) unless current.right.nil?
      tree_array.push(queue.shift.data)
    end
    tree_array
  end

  def in_order(root = @root, array = [])
    unless root.nil?
      array = in_order(root.left, array)
      array.push(root.data)
      array = in_order(root.right, array)
    end
  array
  end

  def pre_order(root = @root, array = [])
    unless root.nil?
      array.push(root.data)
      array = pre_order(root.left, array)
      array = pre_order(root.right, array)
    end
  array
  end

  def post_order(root = @root, array = [])
    unless root.nil?
      array = post_order(root.left, array)
      array = post_order(root.right, array)
      array.push(root.data)
    end
  array
  end

  def height(node = @root, current_height = 1)
    return 0 if @root.nil?
    return 1 if node.left.nil? && node.right.nil?
    if node.left.nil?
      return current_height + height(node.right, current_height)
    elsif node.right.nil?
      return current_height + height(node.left, current_height)
    else
      right_height = current_height + height(node.right, current_height)
      left_height = current_height + height(node.left, current_height)
      return right_height >= left_height ? right_height : left_height
    end
  end

  def count_levels(node, depth = 1, root = @root)
    return 1 if root == node

    if node.data < root.data
      return depth + count_levels(node, depth, root.left)
    elsif node.data > root.data
      return depth + count_levels(node, depth, root.right)
    end
  end

  def depth(node)
    count_levels(node)-1
  end

  def balanced?(node = @root)
    return true if node.nil?

    return true if (height(root.left) - height(root.right)).abs < 1&&balanced?(node.right)&&balanced?(node.left)
    return false
  end

  def rebalance
    array = level_order
    @root = build_tree(array)
  end
      
end






