# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    if @root == nil
      @root = BSTNode.new(value)
    else
      insert_helper(value, @root)
    end
  end

  def find(value, tree_node = @root)
    if tree_node == nil
      nil
    elsif value < tree_node.value
      find(value, tree_node.left)
    elsif value > tree_node.value
      find(value, tree_node.right)
    elsif value == tree_node.value
      return tree_node
    else
      nil
    end
  end

  def delete(value)
    # find if it exists
    node = find(value)
    return nil if node.nil?

    if node == @root
      @root = nil
    else
      find_and_delete_node(value, @root)
    end

  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    if tree_node.right
      maximum(tree_node.right)
    else
      return tree_node.value
    end
  end

  def depth(tree_node = @root)
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  def find_and_delete_node(value, tree_node)
    node = find(value)
    puts node == tree_node
    if node == tree_node
      tree_node = nil
    else
      if value < tree_node.value
        find_and_delete_node(value, tree_node.left)
      else
        find_and_delete_node(value, tree_node.right)
      end
    end
  end
  # optional helper methods go here:
  def insert_helper(value, tree_node)
    if value <= tree_node.value
      if tree_node.left == nil
        tree_node.left = BSTNode.new(value)
      else
        insert_helper(value, tree_node.left)
      end
    elsif tree_node.right == nil
      tree_node.right = BSTNode.new(value)
    else
      insert_helper(value, tree_node.right)
    end
  end
end
