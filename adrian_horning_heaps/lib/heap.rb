class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
  end

  def count
    @store.length
  end

  def extract
  end

  def peek
  end

  def push(val)
  end

  public
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
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end
