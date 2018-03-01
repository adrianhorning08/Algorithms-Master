class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    @prc = prc || Proc.new{|a,b| a<=>b}
  end

  def count
    @store.length
  end

  def extract
    raise "no element to extract" if count == 0
    val = @store.first
    self.class.swap!(@store, 0, count-1)
    @store.pop
    self.class.heapify_down(@store, 0, len = count)
    val
  end

  def peek
    raise "no element to peek" if count == 0
    @store.first
  end

  def push(val)
    @store << val
    self.class.heapify_up(@store, count - 1, &prc)
  end

  public
  def self.swap!(array, i1, i2)
   array[i1], array[i2] = array[i2], array[i1]
 end

  def self.child_indices(len, parent_idx)
    parent_idx_times_two = parent_idx * 2
    if parent_idx_times_two + 2 == len
      [parent_idx_times_two + 1]
    else
      [parent_idx_times_two + 1, parent_idx_times_two + 2]
    end
  end

  def self.parent_index(child_idx)
    raise "root has no parent" if child_idx == 0
    (child_idx - 1) /2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
      prc ||= Proc.new { |a, b| a <=> b }
      return self if len <= 1
      while parent_idx <= parent_index(len-1)
        children = child_indices(len, parent_idx)
        if children.length == 1
          smallest_child_idx = children[0]
        else
          child1_idx, child2_idx = children
          if prc.call(array[child1_idx], array[child2_idx]) <= 0
            smallest_child_idx = child1_idx
          else
            smallest_child_idx = child2_idx
          end
        end

        if prc.call(array[parent_idx], array[smallest_child_idx]) > 0
          swap!(array, parent_idx, smallest_child_idx)
          parent_idx = smallest_child_idx
        else
          break
        end
      end
      array
    end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }
    while child_idx > 0
      parent_idx = parent_index(child_idx)
      if prc.call(array[parent_idx], array[child_idx]) > 0
        swap!(array, parent_idx, child_idx)
        child_idx = parent_idx
      else
        break
      end
    end
    array
  end
end
