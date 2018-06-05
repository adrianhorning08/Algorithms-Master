require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map[key]
      # move it to the back
      update_link!(@map[key])
    else
      calc!(key)
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    val = prc.call(key)
    new_link = @store.insert(key, val)
    @map[key] = new_link
  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
    new_link = @store.get(link.key)
    new_link.next = nil
    new_link.prev = @store.last
    @store.
  end

  def eject!
    # how can you eject a key if you don't pass it in as an arg?
  end
end
