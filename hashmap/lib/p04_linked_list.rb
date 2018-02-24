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
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  def initialize
    h = Node.new
    t = Node.new
    @head = h
    @tail = t
    @tail.prev = @head
    @head.next = @tail
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    index = @head
    until index.key == key || index == @tail
      index = index.next
    end
    index.val
  end

  def include?(key)
    index = @head
    until index.key == key || index == @tail
      if index.key == key
        return true
      elsif index == @tail
        return false
      end
        index = index.next
    end
  end

  def append(key, val)
    v = Node.new(key, val)
    v.prev = @tail.prev
    v.next = @tail
    @tail.prev.next = v
    @tail.prev = v



  end

  def update(key, val)

  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
