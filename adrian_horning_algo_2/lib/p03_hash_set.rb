require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if include?(key.hash)
    resize! if @count == num_buckets
    self[key] << key
    @count +=1
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    self[key].delete(key)
    @count -= 1
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_len = num_buckets * 2
    newStore = Array.new(new_len) { Array.new }
    i = 0
    while i < @store.length
      @store[i].each do |item|
        newStore[item.hash % new_len] << item
      end
      i+=1
    end

    @store = newStore
  end
end
