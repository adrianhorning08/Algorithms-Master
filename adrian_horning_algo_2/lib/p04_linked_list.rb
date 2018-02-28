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
    while @head.next.key != @tail
      return @head.next.val if @head.next.key == key
      @head.next
    end
    false
  end

  def include?(key)
    while @head.next.key != @tail
      return true if @head.next.key == key
      @head.next
    end
    false
  end

  def append(key, val)
    node = Node.new(key,val)
    @tail.next = node
    @tail = node
  end

  def update(key, val)
    each { |link| return link.val = val if link.key == key }
    new_link = Link.new(key, val)
    @tail.prev.next = new_link
    new_link.prev = @tail.prev
    new_link.next = @tail
    @tail.prev = new_link
    new_link
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
