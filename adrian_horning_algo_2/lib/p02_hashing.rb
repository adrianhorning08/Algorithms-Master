class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    result = 0
    self.each_with_index do |el, i|
      result += el.hash * i
    end
    result
  end
end

class String
  def hash
    result = 0
    i = 0
    while i < self.length
      result += self[i].ord * i
      i +=1
    end
    result
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0
    self.each do |key, val|
      result += self[key].ord * val.ord
    end
    result
  end
end
