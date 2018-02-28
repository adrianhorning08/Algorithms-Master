class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    @prev = @next
  end
end

class LinkedList
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    return nil if empty?
    @head.next
  end

  def last
    return nil if empty?
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)

  end

  def include?(key)
    curr = @head.next
    while curr != nil
      return true if curr.key == key
      curr = curr.next
    end
    false
  end

  def append(key, val)
    return false if include?(key)
    node = Node.new(key,val)
    node.prev = @tail.prev
    node.next = @tail
    @tail.prev = node
  end

  def update(key, val)

  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  # end
end
