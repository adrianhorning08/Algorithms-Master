require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if include?(key)
    self[key.hash] << key
    @count += 1
    resize! if num_buckets < @count

    key
  end

  def include?(key)
    hashed = key.hash
    self[hashed].include?(key)
  end

  def remove(key)
    hashed = key.hash
    self[hashed].delete(key)
    @count-=1
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
    @store = Array.new(num_buckets * 2) { Array.new }
    old_store.flatten.each { |el| insert(el) }
  end
end
