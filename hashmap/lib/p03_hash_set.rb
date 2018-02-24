require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)

    if include?(num) == false
      @count += 1
      resize! if @count == num_buckets
      @store[num.hash % num_buckets] << num
    end
  end

  def remove(num)
    if include?(num)
      @store[num.hash % num_buckets].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[num.hash % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    stuff = []

      @store.flatten.each do |el|
        stuff << el
        @count -= 1
      end
      @store = Array.new(2 * num_buckets) { Array.new }

      stuff.each { |el| insert(el) }
  end
end
