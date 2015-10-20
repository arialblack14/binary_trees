class Node
  attr_reader :value
  attr_accessor :left, :right

  def initialize value = nil
    @value = value
    @left = left
    @right = right
  end

  def insert_in new_val
    if new_val < @value
      @left ? @left.insert_in(new_val) : @left = Node.new(new_val)
    elsif new_val > @value      
      @right ? @right.insert_in(new_val) : @right = Node.new(new_val)
    end    
  end

  def build_sorted_tree arr
    return nil if arr.length == 0
    mid = arr.length/2

    current_node = Node.new(arr[mid])
    return arr if arr.length == 1

    current_node.left = build_sorted_tree(arr[0..mid-1]) 
    current_node.right = build_sorted_tree(arr[mid+1..-1]) 
  end

  def build_tree arr = nil
    arr.shuffle # Unsorts array if sorted
    
    root = Node.new(arr[-1])
    arr.pop
    arr.each { |num| root.insert_in(num) }
    root
  end

  def bfs check_val, root
    queue = []
    queue << root
    until queue.length == 0
      current = queue.shift
      return current if current.value == check_val
      queue << current.left unless current.left.nil?
      queue << current.right unless current.right.nil?
    end 
    nil 
  end

  def dfs check_val, root
    stack = []
    visited = []
    stack << root
    until stack.length == 0
      current = stack.pop
      return current if current.value == check_val
      stack << current.left unless current.left.nil?
      stack << current.right unless current.right.nil?
    end 
    nil 
  end

  def dfs_rec check_val, root
    return root if root.value == check_val
    check_left = dfs_rec(check_val, root.left) unless root.left.nil?
    return check_left if check_left.nil?
    check_right = dfs_rec(check_val, root.right) unless root.left.nil?
    return check_right if check_left.nil?
    nil
  end
end