class MaxIntSet
  def initialize(max)
    @store = Array.new(max)
  end

  def insert(num)
    validate!(num)
    @store[num - 1] = true
  end

  def remove(num)
    @store[num-1] = false
  end

  def include?(num)
    @store[num-1]
  end

  private

  def is_valid?(num)

  end

  def validate!(num)
    if num > @store.length || num < 0
      raise "Out of bounds"
    end
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if self[num].length > 0
      resize!
    end
    self[num] << num
    @count+=1
  end

  def remove(num)
    self[num].delete(num)
    @count-=1
  end

  def include?(num)
    self[num].length > 0
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @count = 0
    @store = Array.new(num_buckets * 2) {Array.new}
    old_store.flatten.each { |el| insert(el) }
  end
end
